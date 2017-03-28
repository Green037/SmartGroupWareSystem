package com.cafe24.smart.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.smart.member.domain.Achieve;
import com.cafe24.smart.member.domain.Career;
import com.cafe24.smart.member.domain.Contract;
import com.cafe24.smart.member.domain.Department;
import com.cafe24.smart.member.domain.License;
import com.cafe24.smart.member.domain.MajorTypeOfBusiness;
import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.member.domain.MemberAchieve;
import com.cafe24.smart.member.domain.MemberContent;
import com.cafe24.smart.member.domain.MemberLicense;
import com.cafe24.smart.member.domain.MinorTypeOfBusiness;
import com.cafe24.smart.member.domain.Position;
import com.cafe24.smart.member.service.MemberService;

@Controller
public class MemberController {

	private static final Logger log = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	// POST 사원정보수정
	@RequestMapping(value = "member/mm_modify", method = RequestMethod.POST)
	public String mmModifyCtrl(Model model, Member member) {
		
		log.debug("MemberController mmModifyCtrl member : " + member);
		
		int result = memberService.mmModifyeServ(member);
		
		log.debug("MemberController mmModifyCtrl result : " + result);

		return "redirect:mm_content";
	}

	// GET 사원정보수정
	@RequestMapping(value = "member/mm_modify", method = RequestMethod.GET)
	public String mmModifyCtrl(Model model, Member member, HttpSession session) {
		
		log.debug("MemberController mmModifyCtrl member : " + member);
		
		int mmCode = (int) session.getAttribute("mmCode");
		
		log.debug("MemberController mmModifyCtrl mmCode : " + mmCode);
		
		MemberContent viewMemberContent = memberService.mmContentServ(mmCode);

		model.addAttribute("memberContent", viewMemberContent);
		
		log.debug("MemberController mmModifyCtrl model : " + model);
		
		return "member/mm_modify";
	}

	// GET 사원 검색리스트 상세보기
	@RequestMapping(value = "member/mm_view", method = RequestMethod.GET)
	public String mmViewCtrl(Model model, @RequestParam("mmCode") int mmCode) {
		
		log.debug("MemberController mmViewCtrl mmCode : " + mmCode);

		System.out.println("상세보기 확인");

		MemberContent viewMemberContent = memberService.mmContentServ(mmCode);
		MemberContent viewMemberContentMc = memberService.mmContentMcServ(mmCode);
	
		List<MemberContent> viewMemberContentLc = memberService.mmContentLcServ(mmCode);
		List<MemberContent> viewMemberContentCr = memberService.mmContentCrServ(mmCode);

		model.addAttribute("memberContent", viewMemberContent);
		model.addAttribute("memberContentMc", viewMemberContentMc);
		model.addAttribute("memberContentLc", viewMemberContentLc);
		model.addAttribute("memberContentCr", viewMemberContentCr);

		return null;
	}

	// get 사원 조건검색조회
	@RequestMapping(value = "member/mm_listSearch", method = RequestMethod.GET)
	public String mmSearchCtrl(Model model) {

		List<Position> position = memberService.ptListServ();
		List<Department> department = memberService.dpListServ();
		List<Contract> contract = memberService.ctListServ();
		List<Achieve> achieve = memberService.acListServ();
		List<License> license = memberService.lcListServ();

		model.addAttribute("position", position);
		model.addAttribute("department", department);
		model.addAttribute("contract", contract);
		model.addAttribute("achieve", achieve);
		model.addAttribute("license", license);
		
		log.debug("MemberController mmSearchCtrl model : " + model);

		return "member/mm_listSearch";
	}

	// GET 요청 사원 개인정보조회
	@RequestMapping(value = "member/mm_content", method = RequestMethod.GET)
	public String mmContentCtrl(Model model, HttpSession session) {
		
		int mmCode = (int) session.getAttribute("mmCode");// 세션에 담겨져있는 값을 가져와
															// mmCode 변수에 담아준다.
		log.debug("MemberController mmContentCtrl mmCode : " + mmCode);

		// 사원조회 매서드 호출
		MemberContent viewMemberContent = memberService.mmContentServ(mmCode);
		MemberContent viewMemberContentMc = memberService.mmContentMcServ(mmCode);
		
		List<MemberContent> viewMemberContentLc = memberService.mmContentLcServ(mmCode);
		List<MemberContent> viewMemberContentCr = memberService.mmContentCrServ(mmCode);

		model.addAttribute("memberContent", viewMemberContent);
		model.addAttribute("memberContentMc", viewMemberContentMc);
		model.addAttribute("memberContentLc", viewMemberContentLc);
		model.addAttribute("memberContentCr", viewMemberContentCr);
		
		log.debug("MemberController mmContentCtrl model : " + model);
		
		return "member/mm_content";
	}

	// post 요청 사원 등록
	@RequestMapping(value = "member/mm_add", method = RequestMethod.POST)
	public String mmAddCtrl(Member member, MemberAchieve memberAchieve, MemberLicense memberLicense, Career career) {

		log.debug("MemberController mmAddCtrl member : " + member);
		log.debug("MemberController mmAddCtrl memberAchieve : " + memberAchieve);
		log.debug("MemberController mmAddCtrl memberLicense : " + memberLicense);
		log.debug("MemberController mmAddCtrl career : " + career);
		
		// 경력 입력 메서드호출
		memberService.mmAddServ(member, memberAchieve, memberLicense, career);
		
		return "mainIndex";
	}

	// get 요청 사원 등록화면
	@RequestMapping(value = "member/mm_add", method = RequestMethod.GET)
	public String mmAddCtrl(Model model) {
		
		List<Achieve> achieve = memberService.acListServ();
		List<License> license = memberService.lcListServ();
		List<Contract> contract = memberService.ctListServ();
		List<Position> position = memberService.ptListServ();
		List<Department> department = memberService.dpListServ();
		List<MajorTypeOfBusiness> majorTypeOfBusiness = memberService.maListServ();
		List<MinorTypeOfBusiness> minorTypeOfBusiness = memberService.miListServ();
		
		model.addAttribute("achieve", achieve);
		model.addAttribute("license", license);
		model.addAttribute("contract", contract);
		model.addAttribute("position", position);
		model.addAttribute("department", department);
		model.addAttribute("majorTypeOfBusiness", majorTypeOfBusiness);
		model.addAttribute("minorTypeOfBusiness", minorTypeOfBusiness);
		
		log.debug("MemberController mmAddCtrl model : " + model);
		
		return "member/mm_add";
	}
}