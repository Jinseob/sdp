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

import com.find.someone.model.BB00800T1VO;
import com.find.someone.model.BB008VO;
import com.find.someone.service.CmmnService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BB00800Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(BB00800Controller.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	private CmmnService cmmnService;
	
	@RequestMapping(value = "/home.do")
	public String home(@ModelAttribute("bb")String bb, ModelMap model,
			HttpServletRequest request) throws Exception{
		
//		@SuppressWarnings("unchecked")
//		List<BB00800T1VO> rsltList = (ArrayList<BB00800T1VO>)cmmnService.selectList("bb008.test", null);
//		model.addAttribute("rsltList", rsltList);
		
		return "main";
	}
	
	@RequestMapping(value = "BB008/BB00800Form{procType}.do")
	public String BB00800Form(@ModelAttribute("bb008VO")BB008VO bb008VO
			, @PathVariable String procType, ModelMap model
			, HttpServletRequest request) throws Exception{
		
		String url = "";
		
		if(procType.equals("I")){
			url = "b00800/bb00800U";
		}else if(procType.equals("D")){	// 상세화면으로
			BB00800T1VO detail = (BB00800T1VO)cmmnService.select("bb008.selectBoardDetail", bb008VO);
			model.addAttribute("detail", detail);
			url = "b00800/bb00800D";
		}else if(procType.equals("U")){	// 수정화면으로
			BB00800T1VO detail = (BB00800T1VO)cmmnService.select("bb008.selectBoardDetail", bb008VO);
			model.addAttribute("detail", detail);
			url = "b00800/bb00800U";
		}else if(procType.equals("L")){	// 리스트화면으로
			@SuppressWarnings("unchecked")
			List<BB00800T1VO> boardList = (ArrayList<BB00800T1VO>)cmmnService.selectList("bb008.selectBoardList", bb008VO);
			model.addAttribute("boardList", boardList);
			url = "b00800/bb00800L";
		}else if(procType.equals("A")){	// 신청시
			String order_no = (String)cmmnService.select("bb008.selectOrderNo", bb008VO);
			bb008VO.setOrder_no(order_no);
			bb008VO.setUser_id((String)request.getSession().getAttribute("user_id"));
			System.out.println("order_no : " + bb008VO.getOrder_no() + " : board_id : " + bb008VO.getBoard_id());
			cmmnService.insert("bb008.application", bb008VO);
			
			BB00800T1VO detail = (BB00800T1VO)cmmnService.select("bb008.selectBoardDetail", bb008VO);
			model.addAttribute("detail", detail);
			url = "b00800/bb00800D";
		}
		
		return url;
	}
	
	@RequestMapping(value = "BB008/BB00800Processing.do")
	public String BB00800(@ModelAttribute("bb00800t1VO")BB00800T1VO bb00800t1VO
			, ModelMap model, HttpServletRequest request
			, RedirectAttributes redirectAttributes) throws Exception{
		
		String url = "";
		String gubun = bb00800t1VO.getGubun();
		
		if(gubun.equals("Insert")){
			// 새로운 키값 생성
			String board_id = (String) cmmnService.select("bb008.selectGETUUID", null);
			bb00800t1VO.setBoard_id(board_id);
			bb00800t1VO.setParent_id(board_id);	// 부모글일 경우 board_id 와 parent_id 가 같다.
			
			cmmnService.insert("bb008.insertBoard", bb00800t1VO);
			redirectAttributes.addAttribute("board_id", bb00800t1VO.getBoard_id());
			
			url = "redirect:/BB008/BB00800FormD.do";
		}else if(gubun.equals("Update")){
			cmmnService.update("bb008.updateBoard", bb00800t1VO);
			redirectAttributes.addAttribute("board_id", bb00800t1VO.getBoard_id());
			url = "redirect:/BB008/BB00800FormD.do";
		}else if(gubun.equals("Delete")){
			url = "redirect:/BB008/BB00800FormL.do";
		}
		
		return url;
	}
}
