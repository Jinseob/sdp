package com.find.someone.controller;

import java.security.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.HtmlUtils;

import com.find.someone.common.CommonUtil;
import com.find.someone.model.BB00100T1VO;
import com.find.someone.model.BB00200T1VO;
import com.find.someone.model.CommonVO;
import com.find.someone.service.CmmnService;

@Controller
public class BB00100Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(BB00100Controller.class);
	
	@Autowired
	private CmmnService cmmnService;
	
	@RequestMapping(value="/BB001/BB00100Form{procType}.do")
	public String BB00100Form(@ModelAttribute("bb001VO")BB00100T1VO bb00100t1VO
			, @PathVariable String procType
			, ModelMap model
			, HttpServletRequest reqeust) throws Exception{
		
		
//		String html = "";
//		String html2 = "";
//		if(procType.equals("L")){
//			String[] args = new String[4];
//			args[0] = "http://www.gwanakgongdan.or.kr//info/notice.php?deptCd=ALL";
//			args[1] = "http://www.gwanak.go.kr/servlets/rnl/gwanak/portal/newsplaza/news/notice/service/NoticeServlet?cmd=LIST&menu_no=000120";
//			args[2] = "http://www.seoul.go.kr/v2012/news/list.html";
//			args[3] = "http://www.gwanak.go.kr/servlets/rnl/gwanak/dong/common/service/DongServlet?cmd=L_LIST&menu_no=000377&pageNum=1&post_code=7070&srhtype=&srhword1=&srhword2=";
//			Validate.isTrue(args.length == 4, "usage : supply url to fetch");
//			String url = args[0];
//			
//			Document doc = Jsoup.connect(args[0]).get();
//			Elements table = doc.select("#list_bottom_line tbody tr");
//			Elements script = doc.select("script");
//			
//			int cnt = 0;
//			
//			for(Element src : table){
//				cnt = 0;
//				Elements td = src.select("td");
//				for(Element tdsrc : td){
//					cnt++;
//					html += tdsrc.text() + "/" +cnt + "/";
//				}
//			}
//			
//			for(Element src1 : script){
//				System.out.println("table context : " + src1.attr("[src]") + src1.html());
//			}
//			
//			doc = Jsoup.connect(args[1]).get();
//			Elements table1 = doc.select("table tr");
//			for(Element src : table1){
//				cnt = 0;
//				Elements td = src.select("td");
//				for(Element tdsrc : td){
//					cnt++;
//					html2 += tdsrc.text() + "/" + cnt + "/";
//				}
//			}
//			
//		}else{
//			System.out.println("�뜝�룞�삕�뜝�룞�삕.");
//		}
//		
//		html = html.replaceAll("/servlets/", "http://www.gwanak.go.kr/servlets/");
		
		/*String tag1 = "";
		String tag2 = "";
		String script_tag1 = "";
		int cnt = 0;
		String[] data = null;
		String[] data_script = null;
		String[] temp = null;
		
		String page = "http://www.gwanakgongdan.or.kr/info/notice.php";
	/*	
		Document doc = Jsoup.connect(page).get();
//		Elements elements_data = doc.select("#list_bottom_line tbody tr");
		Elements elements_data = doc.select("#list_bottom_line tr");
		Elements elements_script = doc.select("script");
		
		for(Element src : elements_data){
			System.out.println("href : " + src.attr("td a[href]"));
			
//			tag1 += src.html().replaceAll("/info/", "http://www.gwanakgongdan.or.kr/info/");
			if(!src.className().equals("lineTop")){	// 상단공지 제거.
				cnt = 0;
				Elements test = src.select("td");
				data = new String[test.size()];
				data_script = new String[test.size()];
				for(Element test1 : test){
//					temp = test1.select("a").attr("href").split(",");
					temp = test1.select("a").attr("href").toString().split("\"");
					if(temp.length > 1){
						System.out.println("temp : " + temp[1]);
					}
//					data_script[cnt] = temp[1];
					data[cnt++] = test1.text();
					tag1 += test1.html() + "..........";
				}
				for(int i = 0; i < test.size(); i++){
					System.out.println("data[] : " + data[i] + ", data_script[] : " + data_script[i]);
				}
			}else{
				System.out.println("className : lineTop 임");
			}
			
		}
		
		for(Element src : elements_script){
			if(src.attr("src").indexOf(".js") > 0){
				tag2 += "<script type='text/javascript' src='" + src.attr("src") + "' ></script>\n";
			}
			script_tag1 += src.html() + "\n";
		}
		
		model.addAttribute("tag1", tag1);
		model.addAttribute("tag2", tag2);
		model.addAttribute("script_tag1", script_tag1);*/
		
		//Seoul_News();
		@SuppressWarnings("unchecked")
		List<BB00200T1VO> bb001List = (ArrayList<BB00200T1VO>)cmmnService.selectList("bb001.seoul_news", null);
		model.addAttribute("seoul_news", bb001List);
		
		String url = "b00100/bb00100L";
		
		return url;
	}
	
	//관악구 고고
	@RequestMapping(value="/BB001/BB00100Gwanak{procType}.do")
	public String BB00100Gwanak(@ModelAttribute("bb002VO") BB00200T1VO bb00200t1VO, @PathVariable String procType, ModelMap model, HttpServletRequest reqeust) throws Exception {
		
		List<CommonVO> codeList = (ArrayList<CommonVO>) cmmnService.selectList("common.getCodeList", "000000");
		
		if( "".equals(bb00200t1VO.getLocal1()) ){
			bb00200t1VO.setLocal1("seoul");
		}
		if( "".equals(bb00200t1VO.getLocal2()) ){
			bb00200t1VO.setLocal2("gwanak");
		}
		
		@SuppressWarnings("unchecked")
		List<BB00200T1VO> bb001List = (ArrayList<BB00200T1VO>) cmmnService.selectList("bb001.gwanak_news", bb00200t1VO);
		model.addAttribute("bb002", bb00200t1VO);
		model.addAttribute("gwanak_news", bb001List);
		model.addAttribute("dong_list", codeList);

		System.out.println("#####:" + bb001List.size());

		String url = "b00100/bb00100G";

		return url;
	}
	
	//파싱??테스트
	@RequestMapping(value="/BB001/BB00100Parsing{procType}.do")
	public String BB00100Parsing(@ModelAttribute("bb002VO") BB00200T1VO bb00200t1VO, @PathVariable String procType, ModelMap model, HttpServletRequest reqeust) throws Exception {
		System.out.println("111");

		String searchVal = reqeust.getParameter("search_code") == null ? "15" : reqeust.getParameter("search_code");
		
		model.addAttribute("info", CommonUtil.urlParsing("6c4644764168776139314b73476b6e", "SeoulNewsList", searchVal));
		model.addAttribute("search_code", searchVal );
		
		
		String url = "b00100/bb00100P";
		
		return url;
	}
	
	@RequestMapping(value="/BB001/map_test.do")
	public String map_test() throws Exception {
		
		System.out.println("map_api2");
		//String url = "b00100/map_api";
		String url = "b00100/map_api2";
		
		return url;
	}
	
	@RequestMapping(value="/BB001/BB00100GwanakGumin.do")
	public String bb00100GwanakGumin(@ModelAttribute("bb002VO") BB00200T1VO bb002VO
			, ModelMap model, HttpServletRequest request) throws Exception{
		
		String url = "b00100/bb00100GG";
		
		bb002VO.setLocal1("seoul");
		bb002VO.setLocal2("0000");
		bb002VO.setLocal3("0000");
		
		@SuppressWarnings("unchecked")
		List<BB00200T1VO> list = (ArrayList<BB00200T1VO>) cmmnService.selectList("bb001.gwanak_news", bb002VO);
		model.addAttribute("list", list);
		
		webScraping_gwanakgongdan();
		
		return url;
	}
	
	@Scheduled(fixedRate=3000000)
	public void doSomething() throws Exception{
		System.out.println("3000초마다");
//		webScraping();
//		webScraping1(); // 동 + 디테일까지
//		webScraping_Seoul_News();
	}
	
	public void webScraping() throws Exception{
//		String[] args = new String[4];
//		args[0] = "http://www.gwanakgongdan.or.kr//info/notice.php?deptCd=ALL";
//		args[1] = "http://www.gwanak.go.kr/servlets/rnl/gwanak/portal/newsplaza/news/notice/service/NoticeServlet?cmd=LIST&menu_no=000120";
//		args[2] = "http://www.seoul.go.kr/v2012/news/list.html";
//		args[3] = "http://www.gwanak.go.kr/servlets/rnl/gwanak/dong/common/service/DongServlet?cmd=L_LIST&menu_no=000377&pageNum=1&post_code=7070&srhtype=&srhword1=&srhword2=";
//		Validate.isTrue(args.length == 4, "usage : supply url to fetch");
		
		
		
		String url = "http://www.gwanakgongdan.or.kr/info/notice.php";
//		String url = "http://www.gwanakgongdan.or.kr/common/js/ui_board.js";
//		String html = "";
		String[] data = null;
		String[] html = null;
		String[] script = null;
		String tag1 = "";
		String tag2 = "";
		
		Document doc = Jsoup.connect(url).get();
//		Elements elements_data = doc.select("#list_bottom_line tbody tr");
		Elements elements_data = doc.select("#list_bottom_line");
		Elements elements_script = doc.select("script");
		
		int cnt = 0;
		
		script = new String[elements_script.size()];
		for(Element scriptTag : elements_script){
			System.out.println("scriptTag.attr('src') : " + scriptTag.attr("src").equals(""));
			System.out.println("check : " + scriptTag.attr("src").indexOf(".js"));
			
			if(scriptTag.attr("src").indexOf(".js") > 0){
				script[cnt++] = "<script type='text/javascript' src='" + scriptTag.attr("src") + "' />";
			}
		}
		
		for(int i = 0; i < cnt; i++){
			System.out.println("script : " + script[i]);
			tag1 += script[i];
		}
		
		cnt = 0;
		
		for(Element src : elements_data){
//			cnt = 0;
//			System.out.println("src : " + src.text());
//			Elements td = src.select("td");
//			data = new String[td.size()];
//			html = new String[td.size()];
//			for(Element tdsrc : td){
//				try{
//					html[cnt] = tdsrc.html().toString();
//					data[cnt++] = tdsrc.text().toString();
//					System.out.println("tdsrc.text() : " + tdsrc.text());
//				}catch(Exception e){
//					System.out.println("error : " + e.toString());
//				}finally{
//					
//					
//				}
//			}
//			for(int i = 0; i < td.size(); i++){
//				System.out.print(" data : " + data[i] + "!!");
//				System.out.println((" html : " + html[i]));
//			}
			Elements test = src.select("td");
			for(Element test1 : test){
				tag2 += test1.html();
			}
//			tag2 += src.html();
		}
	}

	public void webScraping1() throws Exception {
		List<CommonVO> codeList = (ArrayList<CommonVO>) cmmnService.selectList("common.getCodeList", "000000");
		String url = "";

		System.out.println("=======================================관악구청 리스트 스크래핑 시작");
		for (int dong = 0; dong < codeList.size(); dong++) {
			
			url = "http://www.gwanak.go.kr/servlets/rnl/gwanak/portal/life/lecture/service/LectureServlet?cmd=LIST&menu_no=000096&pageNum=1&class_who=&amethod_state=A&srh_post_code=" + codeList.get(dong).getDcode() + "&srhtype=&srhword1=&srhword2=";
			//url = "http://www.gwanak.go.kr/servlets/rnl/gwanak/portal/life/lecture/service/LectureServlet?cmd=LIST&menu_no=000096&pageNum=1&class_who=&amethod_state=A&srh_post_code=" + "7020" + "&srhtype=&srhword1=&srhword2=";
			
			String[] data = null;

			Document doc = Jsoup.connect(url).get();
			Elements table = doc.select("#cms table tbody tr");

			int cnt = 0;
			
			for (Element src : table) {
				cnt = 0;
				Elements td = src.select("td");

				data = new String[td.size() + 1];

				BB00200T1VO b02 = new BB00200T1VO();

				//b02.setLocal_id((String) cmmnService.select("bb008.selectGETUUID", null));//키 값은 insert 쿼리에서 써야할듯...DUPLICATE KEY 경우에도 seq 증가할듯..
				b02.setLocal1("seoul");
				b02.setLocal2("gwanak");
				b02.setLocal3(codeList.get(dong).getDcode());
				//b02.setLocal3("7020");

				try {
					Boolean isExist = false;
					for (Element tdsrc : td) {

						if (!"6".equals(tdsrc.attr("colspan"))) {//내역 없을경우 colspan 6개
							isExist = true;
							if (tdsrc.select("a").attr("href").toString().startsWith("javascript:jsView")) {
								data[cnt++] = tdsrc.select("a").attr("href").toString().replaceAll("([^0-9])", "");
							}
							if (!"".equals(tdsrc.text())) {
								data[cnt++] = tdsrc.text().toString();
							}
							if (tdsrc.select("a").attr("href").toString().startsWith("javascript:jsStudy")) {
								data[cnt++] = tdsrc.select("a").select("img").attr("alt").toString();
							}
						}
					}

					if (isExist) {//내역있을 경우 vo에 담음
						b02.setCont_id(data[0]);
						b02.setTitle(data[1]);
						b02.setDay(data[2]);
						b02.setEdu_period(data[3]);
						b02.setPlace(data[4]);
						b02.setMethod(data[5]);
						b02.setStatus(data[6]);
						cmmnService.insert("bb001.insertCont", b02);//insert
					} else {
						//System.out.println(codeList.get(dong).getCode_nm() + " 신청 내역없음");
						System.out.println("7020" + " 신청 내역없음");
					}

				} catch (ArrayIndexOutOfBoundsException e) {
					System.out.println("ArrayIndexOutOfBoundsException : " + e.toString());
				} catch (Exception e) {
					System.out.println("error : " + e.toString());
				} finally {

				}

			}
		}
		System.out.println("=======================================관악구청 리스트 스크래핑 끝");
		
		webScraping1_detail();
	}
	public void webScraping1_detail() throws Exception {
		System.out.println("=======================================관악구청 상세보기 스크래핑 시작");
		
		List<CommonVO> codeList = (ArrayList<CommonVO>) cmmnService.selectList("common.getCodeList", "000000");//동 코드값 가져오기
		
		for (int dong = 0; dong < codeList.size(); dong++) {//동 갯수만큼
			BB00200T1VO b02 = new BB00200T1VO();
			b02.setLocal1("seoul");
			b02.setLocal2("gwanak");
			b02.setLocal3(codeList.get(dong).getDcode());
			
			List<BB00200T1VO> id_list = (ArrayList<BB00200T1VO>) cmmnService.selectList("bb001.getContId", b02);//cont_id 리스트 뽑아오기
	
			String url = "";
			
			for (int idCnt = 0; idCnt < id_list.size(); idCnt++) {
				
				b02.setCont_id(id_list.get(idCnt).getCont_id());
				
				url = "http://www.gwanak.go.kr/servlets/rnl/gwanak/portal/life/lecture/service/LectureServlet?cmd=VIEW&list_seq="+ b02.getCont_id() +"&menu_no=000096&pageNum=1&srhtype=&srhword1=&srhword2=&class_who=";
				String[] data = null;
				
				Document doc = Jsoup.connect(url).get();
				Elements td = doc.select("#content div table.table600-5 tbody tr td");

				int cnt = 0;
					data = new String[td.size()];

					try {
						for (Element tdsrc : td) {
							data[cnt++] = tdsrc.text().toString();
						}
						
						b02.setEdu_time(data[3]);
						b02.setEdu_persons(data[5]);
						b02.setTel(data[8]);
						b02.setTuition(data[9]);
						
						if( td.size() ==13 ){//수강료 있을경우 계좌번호 컬럼이 추가되나 DB 저장은 안할거임(내용에 중복되어있으므로)
							b02.setContent(data[11]);
						}else if(td.size() == 12)  {
							b02.setContent(data[10]);
						}
						
						cmmnService.insert("bb001.insertCont", b02);// insert

					} catch (ArrayIndexOutOfBoundsException e) {
						System.out.println("ArrayIndexOutOfBoundsException : " + e.toString());
					} catch (Exception e) {
						System.out.println("error : " + e.toString());
					} finally {

					}
			}
		}
		System.out.println("=======================================관악구청 상세보기 스크래핑 끝");
	}
	
	// 서울특별시청 [Seoul Metropolitan Government]
	private void  webScraping_Seoul_News() throws Exception{
		String url = "";
		//http://www.seoul.go.kr/v2012/news/list.html?page=1
		//http://www.seoul.go.kr/v2012/news/list.html?page=2
		String html = "";
		
		
		for(int i=0; i<1; i++) {
			url = "http://www.seoul.go.kr/v2012/news/list.html?page="+i;
			
			Document doc = Jsoup.connect(url).get();
			Elements li = doc.select("#newsWrap li");
	//		Elements script = doc.select("script");
			
			for(Element src : li) {
	//			System.out.println("src : " + src.html());
	//			Elements source = src.select("li");
				Elements title = src.select("h2");
				Elements write_dt = src.select("dl span");
				Elements content = src.select("dl dd");
				Elements list_img = src.select("dl dt");
				
				String detail_url="";
				
				html += src.html().toString().replaceAll("/v2012", "http://www.seoul.go.kr/v2012");
	
				BB00200T1VO b02 = new BB00200T1VO();
	
				b02.setLocal_id((String) cmmnService.select("bb008.selectGETUUID", null));
				b02.setLocal1("seoul");
				b02.setLocal2("");
				b02.setLocal3("");
				
				for(Element lisrc : title){
					try{
	//					System.out.println("title_src.text() : " + lisrc.text());
//						System.out.println(lisrc.text());
						detail_url = lisrc.select("a").attr("href").toString();
						String cont_id[] = lisrc.select("a").attr("href").toString().split("/");
						
						b02.setTitle(lisrc.text());
						b02.setDetail_url(detail_url);
						b02.setCont_id(cont_id[4]);
						
					}catch(Exception e){
						System.out.println("error : " + e.toString());
					}finally{
						
					}
				}
				
				for(Element lisrc : write_dt){
					try{
	//					System.out.println("write_dt_src.text() : " + lisrc.text());
//						System.out.println(lisrc.text());
						
						b02.setWrite_dt(lisrc.text());
					}catch(Exception e){
						System.out.println("error : " + e.toString());
					}finally{
						
					}
				}
				
				for(Element lisrc : content){
					try{
	//					System.out.println("content_src.text() : " + lisrc.text());
//						System.out.println(lisrc.text().substring(16));
						
						b02.setContent(lisrc.text().substring(16)); // 시간제외
						
//						System.out.println("#content#:"+detail_url);
						
						/* detail 시작*/
						/*System.out.println("++++++++++++++++++++++++++++++++");
						Document detail_doc = Jsoup.connect(detail_url).get();
						System.out.println("--------------------------------");
						Elements detail_li = detail_doc.select("#sns_elem");
						
						System.out.println("@@detail_li@@:"+detail_li.html());
						
						for(Element detail_src : detail_li) {
							System.out.println("#!@#!@$@$!@$");
							Elements detail_content = detail_src.select("div");
							
							for(Element detail_lisrc : detail_content){
								try{
				//					System.out.println("detail_content.text() : " + detail_lisrc.text());
									System.out.println(detail_lisrc.html());
									
									b02.setContent(detail_lisrc.html());
								}catch(Exception e){
									System.out.println("detail_content error : " + e.toString());
								}finally{
									
								}
							}
							
						}*/
						/* detail 끝 */
					}catch(Exception e){
						System.out.println("content error : " + e.toString());
					}finally{
						
					}
				}
				
				for(Element lisrc : list_img){
					try{
	//					System.out.println("content_src.text() : " + lisrc.text());
						b02.setList_img(list_img.select("img").attr("src").toString());
					}catch(Exception e){
						System.out.println("error : " + e.toString());
					}finally{
						
					}
				}
				
				cmmnService.insert("bb001.insertCont", b02);
			}
		}
		
//		System.out.println(html);
	}
	
	public void webScraping_gwanakgongdan() throws Exception{
		CommonUtil common = new CommonUtil();
		
		BB00200T1VO vo = null;
		int cnt = 0;
		String[] data = null;
		String[] temp = null;
		String detail_url = "";
		int num = 1;
		int chk = 0;
		
		Document doc = null;
		
		for(int j = 0; j < 5; j++){
		
		// 관악구민센터
		String page = "http://www.gwanakgongdan.or.kr/info/notice.php?SearchKey===&SearchKeyValue=&boardCd=WEB_NEWS&deptCd=ALL&menuAuth=&s_gubun=&s_day_from=&e_day_to=&CurrPageNo=" + num++;
//		String page = "http://www.gwanakgongdan.or.kr/info/notice.php";
		
		doc = Jsoup.connect(page).get();
		
		Elements elements_data = doc.select("#list_bottom_line tbody tr");	// 목록 ID
//		Elements elements_script = doc.select("script");					// script
		
		for(Element element : elements_data){
			if(!element.className().equals("lineTop")){	// 상단공지 제외
				cnt = 0;
				Elements elements_td = element.select("td");	// td 단위로 분류.
				data = new String[elements_td.size() + 1];
				for(Element element_td : elements_td){
					data[cnt++] = element_td.text();
					// a 태그에서 href 속성에서 javascript 함수 사용하는 부분에서 key 값 가지고 오는 부분 시작, detail_url 생성부분
					temp = element_td.select("a").attr("href").split("\""); 
					if(temp.length > 1){
						data[cnt++] = temp[1];
						detail_url = "http://www.gwanakgongdan.or.kr/info/notice.php?writingNo=" + temp[1] + "&mode=" + temp[5]; 
					}
					// key 값 가지고 오는 부분 종료
				}
				
				chk = common.compareTo3Month(data[6]);
				if(chk > 0){
					break;
				}
				
//				vo = new BB00200T1VO();
//				
//				vo.setLocal_id((String)cmmnService.select("gwanak.selectGETUUID", null));
//				vo.setLocal1("seoul");
//				vo.setLocal2("0000");
//				vo.setLocal3("0000");
//				vo.setCont_id(data[3]);
//				vo.setTitle(data[2]);
//				vo.setDetail_url(detail_url);
//				vo.setContent("");
//				vo.setMethod("");
//				vo.setWrite_dt(data[6]);
//				vo.setPlace(data[1]);
//				vo.setDay("");
//				vo.setStatus("");
//				
//				cmmnService.insert("gwanak.insertbb00200t1", vo);
				
//				for(int i = 0; i < data.length; i++){
//					System.out.println("Data : " + data[i] + " : " + i);
//				}
			}
			
// script 용 js 가지고 와서 사용하기위한 메서드.
//			String tmp = "";
//			
//			for(Element script_ele : elements_script){
//				if(script_ele.attr("src").indexOf("board") > 0){
//					tmp = script_ele.attr("src") + "\n";
//				}
//				if(script_ele.html().indexOf("board") > 0){
//					tmp += script_ele.html();
//				}
//			}
//			System.out.println("script : " + tmp);
		}
		if(chk > 0){
			break;
		}
		}
		
//		for(Element src : elements_script){
//			if(src.attr("src").indexOf(".js") > 0){
//				tag2 += "<script type='text/javascript' src='" + src.attr("src") + "' ></script>\n";
//			}
//			script_tag1 += src.html() + "\n";
//		}
		
//		String[] args = new String[4];
//		args[0] = "http://www.gwanakgongdan.or.kr//info/notice.php?deptCd=ALL";
//		args[1] = "http://www.gwanak.go.kr/servlets/rnl/gwanak/portal/newsplaza/news/notice/service/NoticeServlet?cmd=LIST&menu_no=000120";
//		args[2] = "http://www.seoul.go.kr/v2012/news/list.html";
//		args[3] = "http://www.gwanak.go.kr/servlets/rnl/gwanak/dong/common/service/DongServlet?cmd=L_LIST&menu_no=000377&pageNum=1&post_code=7070&srhtype=&srhword1=&srhword2=";
//		Validate.isTrue(args.length == 4, "usage : supply url to fetch");
		
		
		
//		String url = "http://www.gwanakgongdan.or.kr/info/notice.php";
//		String url = "http://www.gwanakgongdan.or.kr/common/js/ui_board.js";
//		String html = "";
//		String[] data = null;
//		String[] html = null;
//		String[] script = null;
//		String tag1 = "";
//		String tag2 = "";
//		
//		Document doc = Jsoup.connect(url).get();
//		Elements elements_data = doc.select("#list_bottom_line tbody tr");
//		Elements elements_data = doc.select("#list_bottom_line");
//		Elements elements_script = doc.select("script");
		
//		int cnt = 0;
//		
//		script = new String[elements_script.size()];
//		for(Element scriptTag : elements_script){
//			System.out.println("scriptTag.attr('src') : " + scriptTag.attr("src").equals(""));
//			System.out.println("check : " + scriptTag.attr("src").indexOf(".js"));
//			
//			if(scriptTag.attr("src").indexOf(".js") > 0){
//				script[cnt++] = "<script type='text/javascript' src='" + scriptTag.attr("src") + "' />";
//			}
//		}
//		
//		for(int i = 0; i < cnt; i++){
//			System.out.println("script : " + script[i]);
//			tag1 += script[i];
//		}
//		
//		cnt = 0;
//		
//		for(Element src : elements_data){
//			cnt = 0;
//			System.out.println("src : " + src.text());
//			Elements td = src.select("td");
//			data = new String[td.size()];
//			html = new String[td.size()];
//			for(Element tdsrc : td){
//				try{
//					html[cnt] = tdsrc.html().toString();
//					data[cnt++] = tdsrc.text().toString();
//					System.out.println("tdsrc.text() : " + tdsrc.text());
//				}catch(Exception e){
//					System.out.println("error : " + e.toString());
//				}finally{
//					
//					
//				}
//			}
//			for(int i = 0; i < td.size(); i++){
//				System.out.print(" data : " + data[i] + "!!");
//				System.out.println((" html : " + html[i]));
//			}
//			Elements test = src.select("td");
//			for(Element test1 : test){
//				tag2 += test1.html();
//			}
//			tag2 += src.html();
//		}
	}
	
	public void webscraping_gwanakgongdan_update(List<BB00200T1VO> list) throws Exception{
		CommonUtil common = new CommonUtil();
		
		BB00200T1VO vo = null;
		int cnt = 0;
		String[] data = null;
		String[] temp = null;
		String detail_url = "";
		int num = 1;
		int chk = 0;
		
		Document doc = null;
		
		for(int j = 0; j < 5; j++){
		
		// 관악구민센터
		String page = "http://www.gwanakgongdan.or.kr/info/notice.php?SearchKey===&SearchKeyValue=&boardCd=WEB_NEWS&deptCd=ALL&menuAuth=&s_gubun=&s_day_from=&e_day_to=&CurrPageNo=" + num++;
//		String page = "http://www.gwanakgongdan.or.kr/info/notice.php";
		
		doc = Jsoup.connect(page).get();
		
		Elements elements_data = doc.select("#list_bottom_line tbody tr");	// 목록 ID
//		Elements elements_script = doc.select("script");					// script
		
		for(Element element : elements_data){
			if(!element.className().equals("lineTop")){	// 상단공지 제외
				cnt = 0;
				Elements elements_td = element.select("td");	// td 단위로 분류.
				data = new String[elements_td.size() + 1];
				for(Element element_td : elements_td){
					data[cnt++] = element_td.text();
					// a 태그에서 href 속성에서 javascript 함수 사용하는 부분에서 key 값 가지고 오는 부분 시작, detail_url 생성부분
					temp = element_td.select("a").attr("href").split("\""); 
					if(temp.length > 1){
						data[cnt++] = temp[1];
						detail_url = "http://www.gwanakgongdan.or.kr/info/notice.php?writingNo=" + temp[1] + "&mode=" + temp[5]; 
					}
					// key 값 가지고 오는 부분 종료
				}
				
				chk = common.compareTo3Month(data[6]);
				if(chk > 0){
					break;
				}
			}
		}
		
		for(int i = 0; i < 5; i++){
//			common.compareToDate(val1, list.get(i).getWrite_dt());
		}
	}
	}
}
