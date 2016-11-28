package com.find.someone.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.find.someone.common.CommonUtil;
import com.find.someone.model.BB00200T1VO;
import com.find.someone.model.BB00500T1VO;
import com.find.someone.model.CommonVO;
import com.find.someone.service.CmmnService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BB00500Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(BB00500Controller.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	private CmmnService cmmnService;
	
	@RequestMapping(value="/BB005/BB00500Form{procType}.do")
	public String BB00500Form(@ModelAttribute("bb005VO")BB00500T1VO bb00500t1VO
			, @PathVariable String procType
			, ModelMap model
			, HttpServletRequest reqeust) throws Exception{
		
		String url="";
		String map_view = "";
		String map_marker="";
		
		if (procType.equals("F")) { // 이곳보 등록 폼
			System.out.println("##menu:BB00300Form-F");
			
			url = "b00500/bb00500F";
			
		} else if(procType.equals("I")) { // 이곳보 DB저장
			System.out.println("##menu:BB00300Form-I");
			
			bb00500t1VO.setBrand_id((String) cmmnService.select("bb008.selectGETUUID", null));
			cmmnService.insert("bb005.insertCont", bb00500t1VO);
					
			url = "redirect:/BB005/BB00500FormL.do";
		} else if(procType.equals("L")) { // 이곳보 리스트
			System.out.println("##menu:BB00300Form-L");
			
			@SuppressWarnings("unchecked")
			List<BB00500T1VO> rsltList = (ArrayList<BB00500T1VO>)cmmnService.selectList("bb005.brand_address", null);
			model.addAttribute("brand_address", rsltList);
			
			for(int i=0; i<rsltList.size(); i++) {
				if(i==0) {
					map_view = rsltList.get(i).getLatitudel()+","+rsltList.get(i).getLongitude();
					map_marker = map_view+","+ rsltList.get(i).getBrand_nm();
				} else {
					map_marker += "|"+rsltList.get(i).getLatitudel()+","+rsltList.get(i).getLongitude()+","+ rsltList.get(i).getBrand_nm();
				}
			}
			
			model.addAttribute("map_view", map_view);
			model.addAttribute("map_marker", map_marker);
			
			url = "b00500/bb00500L";
		} else {
			url = "redirect:/main.do";
		}
		
		return url;
	}
	
	@RequestMapping(value = "/brand_address.do")
	public String brand_address(@ModelAttribute("bb005VO")BB00500T1VO bb00500t1VO
			, @PathVariable String procType
			, ModelMap model
			, HttpServletRequest reqeust) throws Exception{
		
		@SuppressWarnings("unchecked")
		List<BB00500T1VO> rsltList = (ArrayList<BB00500T1VO>)cmmnService.selectList("bb005.brand_address", null);
		model.addAttribute("rsltList", rsltList);
		
		return "";
	}
	
}
