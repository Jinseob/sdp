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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.find.someone.model.BB00080VO;
import com.find.someone.model.BB00090VO;
import com.find.someone.service.CmmnService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CommonJsonController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonJsonController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	private CmmnService cmmnService;
	
	/**
	 *  댓글 불러오기
	 * @param model
	 * @return
	 */
	@RequestMapping("common/comment.json")
	public ModelAndView commentList(@ModelAttribute("bb00090VO") BB00090VO bb00090VO
			, ModelMap model
			, HttpServletRequest request)throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		MappingJacksonJsonView jsonView = new MappingJacksonJsonView();
		modelAndView.setView(jsonView);
		
		@SuppressWarnings("unchecked")
		List<BB00090VO> commentList = (ArrayList<BB00090VO>)cmmnService.selectList("bb00090.selectCommentList", bb00090VO);
		model.addAttribute("commentList", commentList);

		return modelAndView;
	}
	
	/**
	 *  댓글 등록하기
	 * @param model
	 * @return
	 */
	@RequestMapping("common/commentInsert.json")
	public ModelAndView chkId(@ModelAttribute("bb00090VO") BB00090VO bb00090VO
			, ModelMap model
			, HttpServletRequest request)throws Exception {
		
		String board_id = (String)cmmnService.select("bb00090.selectGETUUID", null);
		
		bb00090VO.setComment_id(board_id);
		
		if(bb00090VO.getParent_id().equals("")){
			bb00090VO.setParent_id("0");
		}
		
		ModelAndView modelAndView = new ModelAndView();
		MappingJacksonJsonView jsonView = new MappingJacksonJsonView();
		modelAndView.setView(jsonView);

		cmmnService.insert("bb00090.insertComment", bb00090VO);
		model.addAttribute("result", true);
		return modelAndView;
	}
	
	/**
	 *  평점 Insert 및 avg Update
	 * @param model
	 * @return
	 */
	@RequestMapping("grade_add.json")
	public ModelAndView grade_add(@ModelAttribute("bb00080VO") BB00080VO bb00080VO
			, ModelMap model
			, HttpServletRequest request)throws Exception {
		
		System.out.println("##grade_add");
		
		ModelAndView modelAndView = new ModelAndView();
		MappingJacksonJsonView jsonView = new MappingJacksonJsonView();
		modelAndView.setView(jsonView);
		
		bb00080VO.setGrade_id((String)cmmnService.select("bb00080.selectGETUUID", null));
		bb00080VO.setGubun("bb00310");
		
		HttpSession session = request.getSession();
		bb00080VO.setCre_id((String)session.getAttribute("bb_se_user_id"));
		bb00080VO.setUpt_id((String)session.getAttribute("bb_se_user_id"));
		
		cmmnService.insert("bb00080.insertGrade", bb00080VO); //각 평점 Insert
		
		// 카페 24에서 트리거 사용이 안됨...
		// 참고 text : http://tindevil.tistory.com/466
		cmmnService.insert("bb00080.updateAvgGrade", bb00080VO); // 평점 avg Update
		
		return modelAndView;
	}
}
