package com.find.someone.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.util.HashMap;
import java.util.Map;
import java.net.URL;

//import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.find.someone.service.CmmnService;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

@Controller
public class SnsLoginController {
	
	@Autowired
	private CmmnService cmmnService;
	
	private String g_client_id = "2PGrPorFgOsQqgvn9FoG"; // 네이버 로그인 등록 완료 후 발급받은 ClientID 값 
	private String g_client_secret = "z0NVF5kUX2"; // 네이버 로그인 등록 완료 후 발급받은 ClientSecret 값

    /**
     * <pre>
     * 1. MethodName : getNaverUserInfo
     * 3. Comment    : 네이버 로그인 인증 Access Token 생성 후 사용자 정보 요청 
     * 4. 작성자       : hyojoong
     * </pre>
     *
     * @return
     * @throws Exception
     */
	@RequestMapping(value = "/getNaverUserInfo.do")
    public Map<String, Object> getNaverUserInfo(HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
		System.out.println("##===============");
		System.out.println("##getNaverUserInfo");
        Map<String, Object> userInfoMap = new HashMap<String, Object>();
        
        // CSRF 방지를 위한 state token 검증
        String state = request.getParameter("state") == null ? "" : request.getParameter("state");// callback request에서 state파라미터의 값을 가져옴
        String code = request.getParameter("code") == null ? "" : request.getParameter("code");// callback의 응답으로 전달받은 authorization code
        
        System.out.println("##getNaverUserInfo_state:"+state);
        System.out.println("##getNaverUserInfo_code:"+code);
        
        // 쿠키값 가져 오기
//        Cookie[] cookies = request.getCookies();
//        String coookieName = "";
//        String cookieValue = "";        
        
        /*System.out.println("##getNaverUserInfo_cookies");
        if(cookies!=null)
        {
        	System.out.println("##getNaverUserInfo_cookies:"+cookies.length);
            for(int i = 0; i < cookies.length; i++)
            {
                Cookie c = cookies[i];
                coookieName = c.getName();
                cookieValue = c.getValue();
                
                System.out.println("##cookies:"+coookieName);
                System.out.println("##cookies:"+state);
                System.out.println("##cookies:"+coookieName.compareTo("state"));
                if(coookieName.compareTo("state") == 0)
                {
                    break;    
                }
                cookieValue = "";                
            }
        }*/
		HttpSession session = request.getSession();
		
		// 세션 또는 별도의 스토리지에서 state token을 가져옴
		String storedState  = (String)session.getAttribute("state");
        
        System.out.println("##getNaverUserInfo_token1:"+state);
        System.out.println("##getNaverUserInfo_token2:"+storedState);
        // state token 검증
        //if(state.equals(cookieValue))
        if(state.equals(storedState))
        {
        	System.out.println("##state confirm");
            HttpURLConnection conn = null;
            URL url = null;
            
            try
            {
                /********************** Access Token 요청 시작 */
                String accessTokenurl = "https://nid.naver.com/oauth2.0/token?";
                
                String client_id = g_client_id; // 네이버 로그인 등록 완료 후 발급받은 ClientID 값 
                String client_secret = g_client_secret; // 네이버 로그인 등록 완료 후 발급받은 ClientSecret 값 
                String grant_type = "authorization_code"; // authorization_code 로 고정
                String accessTokenValue = "";  
                String tokenString = "";
                String jsonString = "";   
                
                // URL 생성
                accessTokenurl = accessTokenurl
                        + "client_id=" + client_id
                        + "&client_secret=" + client_secret
                        + "&grant_type=" + grant_type
                        + "&state=" + state
                        + "&code=" + code;
                
                System.out.println("##getNaverUserInfo_accessTokenurl:"+accessTokenurl);
                
                // Access Token 요청 return JSON
                url = new URL(accessTokenurl);
                conn = (HttpURLConnection)url.openConnection();
                conn.setRequestMethod("GET");
                conn.setRequestProperty("Cache-Control", "no-cache");
                conn.setRequestProperty("Content-Type", "application/json");
                conn.setRequestProperty("Accept", "application/json");
                conn.setDoInput(true);
                conn.setDoOutput(true);
                
                BufferedReader accessTokenResult = new BufferedReader(new InputStreamReader(conn.getInputStream())); 
                
                while((tokenString = accessTokenResult.readLine()) != null)
                {
                    jsonString += tokenString;
                }
                
                System.out.println("##getNaverUserInfo_jsonString:"+jsonString);
                if(!("").equals(jsonString))
                {
                	 System.out.println("##jsonString if in");
                    // JSON 파싱
                	System.out.println("##1111111111111");
                    ObjectMapper objectMapper = new ObjectMapper();
                    System.out.println("##222222222222222"+objectMapper);
                    JsonNode jsonNode = objectMapper.readTree(jsonString);
                    System.out.println("##3333333333333:"+jsonNode);
                    
                    //accessTokenValue = CommonUtil.getString(jsonNode.get("access_token"), "");
//                    accessTokenValue = (String) (jsonNode.get("access_token") == null ? "" : jsonNode.get("access_token"));
                    accessTokenValue = jsonNode.get("access_token").toString();
                    System.out.println("##accessTokenValue:"+accessTokenValue);
                }
                
                conn.disconnect();        
                
                /********************** Access Token 요청 종료 */
                
                /********************** 사용자 정보  요청 시작 */
                // 요청 URL
                String uerInfoUrl = "https://apis.naver.com/nidlogin/nid/getUserProfile.xml";
                String xmlString = "";
                
                // 사용자 기본정보 조회 요청 return XML (Authorization 헤더값에는 인증토큰을 포함)
                url = new URL(uerInfoUrl);
                conn = (HttpURLConnection)url.openConnection();
                conn.setRequestMethod("GET");
                conn.setRequestProperty("Cache-Control", "no-cache");
                conn.setRequestProperty("Content-Type", "application/xml");
//                conn.setRequestProperty("Charset", "UTF-8");
                conn.setRequestProperty("Accept", "application/xml");
                conn.setRequestProperty("Authorization: Bearer", accessTokenValue);
                conn.setDoInput(true);
                conn.setDoOutput(true);
                
                BufferedReader userInfoResult = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF8"));
                System.out.println("##!!!!!!!!!!!!!!!!!!!!!");
                tokenString = "";
                while((tokenString = userInfoResult.readLine()) != null)
                {
                    xmlString += tokenString;
                }

                System.out.println("##xmlString:"+xmlString);
                // 사용자 XML Parse
                DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
                DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
                Document doc = dBuilder.parse(new InputSource(new StringReader(xmlString)));
                
                // XML NodeList (data > response > 사용자 정보)
                Element root = doc.getDocumentElement();
                NodeList resNodeList = root.getElementsByTagName("response");
                
                System.out.println("##resNodeList.getLength():"+resNodeList.getLength());
                for(int i=0; i<resNodeList.getLength(); i++)
                {
                    Node resNode = resNodeList.item(i);
                    
                    System.out.println("##resNode.getNodeName()):"+resNode.getNodeName());
                    if(("response").equals(resNode.getNodeName()))
                    {
                        NodeList userNodeList = resNode.getChildNodes();
                        
                        // 사용자 정보를 Map에 담는다
                        System.out.println("##userNodeList_len:"+userNodeList.getLength());
                        for(int j=0; j<userNodeList.getLength(); j++)
                        {
                            Node userNode = userNodeList.item(j);
                            userInfoMap.put(userNode.getNodeName(), userNode.getTextContent());
                            System.out.println("##getNaverUserInfo:"+userInfoMap.get(userNode.getNodeName()));
                            // 0 : E-mail
                            // 1 : 닉네임
                            // 2 : enc_id (암호화 된것) 모르겠음...
                            // 3 : 프로필 사진
                            // 4 : 연령
                            // 5 : 성별(M, F)
                            // 6 : ID (숫자)
                            // 7 : 생년월일 중 월, 일 (생년은 표시 안됨)
                        }
                        break;
                    }
                }
                
                System.out.println("##disconnect");
                conn.disconnect();                
                /********************** 사용자 정보  요청 종료 */
            }    
            catch(Exception e)
            {
            	System.out.println("##getNaverUserInfo_Exception:"+e);
                if(conn != null)
                {
                    try{ conn.disconnect(); }catch(Exception ex){}
                }
            }
        }
        
        System.out.println("##userInfoMap End");
        return userInfoMap;
    }
}


