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
import org.springframework.web.bind.annotation.RequestMapping;

import com.find.someone.model.BB00100T1VO;
import com.find.someone.model.BB00800T1VO;
import com.find.someone.model.LoginVO;
import com.find.someone.service.CmmnService;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private CmmnService cmmnService;
	
	@RequestMapping(value="main.do")
	public String mainView(@ModelAttribute("loginVO")LoginVO loginVO
			, HttpServletRequest request, ModelMap model) throws Exception{
		
		return "main";
	}
}
