package com.cafe24.smart;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.member.service.MemberService;

@Controller
public class HomeController {
	final static Logger log = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		
		log.info("home is called ...");

		return "member/mm_login";
	}	
	
	//POST 요청 사원 로그인
	@RequestMapping(value="/member/mm_login",method=RequestMethod.POST)
	public String mmLoginCtrl(Member member, HttpSession session) {
			
		Map<String, Object> resultMap = new HashMap<String, Object>();
			
		resultMap = memberService.mmLoginServ(member);
	
		if(resultMap.get("check").equals("성공")){
			session.setAttribute("mmCode", resultMap.get("mmCode"));
			session.setAttribute("mmName", resultMap.get("mmName"));
		}
					
		System.out.println("세션확인 :" + session.getAttribute("mmCode"));
			
		return "home";
	}
		
	// 로그 아웃 세션 종료
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String Logout(HttpSession session) {
			
		session.invalidate();
		
		System.out.println("-------- 로그아웃  세션 종료 --------");
			
		return "/member/mm_login";
	}
}																																																																																				