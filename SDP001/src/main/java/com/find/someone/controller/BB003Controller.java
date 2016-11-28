package com.find.someone.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.find.someone.model.BB00310VO;
import com.find.someone.model.BB00080VO;
import com.find.someone.model.BB00090VO;
import com.find.someone.service.CmmnService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BB003Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(BB003Controller.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	private CmmnService cmmnService;
	
	@RequestMapping(value="BB00310{procType}.do")
	public String BB00300Form(@ModelAttribute("bb00310VO")BB00310VO bb00310VO
			, @PathVariable String procType
			, ModelMap model
			, HttpServletRequest request) throws Exception{
		
		String url="";
		
		BB00080VO bb00080VO = new BB00080VO();
		BB00090VO bb00090VO = new BB00090VO();
		
		System.out.println("##menu:BB00310-"+procType);
		System.out.println("##BB00310VO:["+bb00310VO.getPast_id()+"]");
		
		if(procType.equals("a01")) { // 찾아보 리스트
			
			if(!bb00310VO.getPast_id().equals("") ) {
				bb00310VO.setPast_id("");
			}
			
			@SuppressWarnings("unchecked")
			List<BB00310VO> rsltList = (ArrayList<BB00310VO>)cmmnService.selectList("bb00310.find_past", bb00310VO);
			model.addAttribute("find_past", rsltList);
			
			url = "bb003/bb00310a01";
		} else if(procType.equals("b01")) { // 찾아보 상세보기
			
			cmmnService.update("bb00310.view_update", bb00310VO);
			
			BB00310VO rsltList = (BB00310VO)cmmnService.select("bb00310.find_past", bb00310VO);
			model.addAttribute("find_past", rsltList);
			
			HttpSession session = request.getSession();
			bb00080VO.setBoard_id(bb00310VO.getPast_id());
			bb00080VO.setCre_id((String)session.getAttribute("bb_se_user_id"));
			int grade_cnt = (Integer)cmmnService.select("bb00080.grade_cnt", bb00080VO);
			model.addAttribute("grade_cnt", grade_cnt);
			
			url = "bb003/bb00310b01";
		} else if (procType.equals("c01")) { // 찾아보 등록 폼, 수정 폼
			
			if(bb00310VO.getPast_id().equals(null) || bb00310VO.getPast_id().equals("") ) {
				bb00310VO.setPast_id("0"); // 한개만 뿌릴려고 할때 값 없게 하려고
			}
			
			@SuppressWarnings("unchecked")
			BB00310VO rsltList = (BB00310VO)cmmnService.select("bb00310.find_past", bb00310VO);
			model.addAttribute("find_past", rsltList);
			
			url = "bb003/bb00310c01";
		} else if (procType.equals("c02")) { // 찾아보 DB저장
			if(!bb00310VO.getPast_id().equals(null) || !bb00310VO.getPast_id().equals("") ) {
				cmmnService.update("bb00310.updatePast", bb00310VO);
			} else {
				bb00310VO.setPast_id((String) cmmnService.select("bb008.selectGETUUID", null));
				cmmnService.insert("bb00310.insertPast", bb00310VO);
			}
					
			url = "redirect:BB00310a01.do";
		} else {
			url = "redirect:/main.do";
		}
		
		return url;
	}
	
	@RequestMapping(value = "/3000.do")
	public String brand_address(@ModelAttribute("bb00310VO")BB00310VO bb00310VO
			, @PathVariable String procType
			, ModelMap model
			, HttpServletRequest reqeust) throws Exception{
		
		@SuppressWarnings("unchecked")
		List<BB00310VO> rsltList = (ArrayList<BB00310VO>)cmmnService.selectList("bb005.brand_address", null);
		model.addAttribute("rsltList", rsltList);
		
		return "";
	}
}
