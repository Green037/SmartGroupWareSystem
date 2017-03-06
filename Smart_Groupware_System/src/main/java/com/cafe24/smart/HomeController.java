package com.cafe24.smart;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	final static Logger log = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		
		log.info("home is called ...");
		

		session.setAttribute("id", 2);
		session.setAttribute("password", 123456);

		/*session.setAttribute("id", 8);
		session.setAttribute("password", 123456);*/

		return "home";
	}	
	
	// 로그인 화면
	@RequestMapping(value="/member/mm_login", method=RequestMethod.GET)
	public String login(){
		
		return "/member/mm_login";
	}
	
	//로그인 처리
	@RequestMapping(value="/member/mm_login", method=RequestMethod.POST)
	public String login(int mmCode, String mmPassword, HttpSession session) {
		
		return  "redirect:home";
	}
	
	// 로그아웃 화면
	 @RequestMapping(value="/member/mm_logout", method=RequestMethod.GET)
	 public String logout(HttpSession session) {
	 	session.invalidate();
	       
	 	return "redirect:home";
	 } 
}																																																																																				