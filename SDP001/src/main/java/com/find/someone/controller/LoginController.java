package com.find.someone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.find.someone.model.LoginVO;
import com.find.someone.service.CmmnService;

@Controller
public class LoginController {
	
	@Autowired
	private CmmnService cmmnService;
	
	@RequestMapping(value = "loginForm.do")
	public String loginForm(@ModelAttribute("loginVO")LoginVO loginVO){
		return "login/loginForm";
	}
	
	@RequestMapping(value = "loginByDB.do")
	public String loginByDB(@ModelAttribute("loginVO")LoginVO loginVO){
		
		return "login/loginForm";
	}
	
	@RequestMapping(value = "loginByIPin.do")
	public String loginByIPin(@ModelAttribute("loginVO")LoginVO loginVO){
		
		return "";
	}
	
	@RequestMapping(value = "loginByPhone.do")
	public String loginByPhone(@ModelAttribute("loginVO")LoginVO loginVO){
		
		return "";
	}

	@RequestMapping(value = "loginByEtc.do")
	public String loginByEtc(@ModelAttribute("loginVO")LoginVO loginVO){
		
		return "";
	}
}
