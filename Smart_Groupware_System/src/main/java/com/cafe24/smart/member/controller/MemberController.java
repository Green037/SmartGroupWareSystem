package com.cafe24.smart.member.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.smart.member.domain.Achieve;
import com.cafe24.smart.member.domain.License;
import com.cafe24.smart.member.service.MemberService;

@Controller
public class MemberController {
	
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	//get 요청 사원 등록화면
	@RequestMapping(value="member/mm_add",method=RequestMethod.GET)
	public String mmAddCtrl(Model model){
			System.out.println("h3");
		List<Achieve> achieve = memberService.acListServ();
		List<License> license = memberService.lcListServ();
			log.debug("member컨트롤러 achieve확인 :"+achieve);
			log.debug("member컨트롤러 license확인 :"+license);
		for(int i=0; i<achieve.size(); i++){
			System.out.println("최종확인 : "+achieve.get(i).getAcCode());
		}
		for(int l=0; l<license.size(); l++){
			System.out.println("최종확인 : "+license.get(l).getLcCode());
		}
		model.addAttribute("achieve", achieve);
		model.addAttribute("license", license);
		return "member/mm_add";
	}
	// post 요청 사원 등록
//	@RequestMapping(value="member/mm_add",method=RequestMethod.POST)
//	public String mmAddCtrl(Member member) {
//		
//		memberService.mmAddServ(member);
//		
//		return "redirect:/home";
//	}
	
}