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
import com.cafe24.smart.member.domain.Career;
import com.cafe24.smart.member.domain.Contract;
import com.cafe24.smart.member.domain.Department;
import com.cafe24.smart.member.domain.License;
import com.cafe24.smart.member.domain.MajorTypeOfBusiness;
import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.member.domain.MemberAchieve;
import com.cafe24.smart.member.domain.MemberLicense;
import com.cafe24.smart.member.domain.MinorTypeOfBusiness;
import com.cafe24.smart.member.domain.Position;
import com.cafe24.smart.member.service.MemberService;

@Controller
public class MemberController {
	
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	
	
	//get 요청 개인정보조회 
	@RequestMapping(value="member/mm_list",method=RequestMethod.GET)
	public String mmListCtrl(){
		return "member/mm_list";
		
	}
	
	// post 요청 사원 등록
		@RequestMapping(value="member/mm_add",method=RequestMethod.POST)
		public String mmAddCtrl(Member member,MemberAchieve memberAchieve,MemberLicense memberLicense,Career career) {
			
			System.out.println("member입력확인"+member);
			System.out.println("memberAchieve입력확인"+memberAchieve);
			System.out.println("career입력확인"+career);
			System.out.println("memberLicense입력확인"+memberLicense);
			//경력 입력 메서드호출
			memberService.mmAddServ(member,memberAchieve,memberLicense,career);
			//memberService.mmAddServ(Member member, MemberAchieve memberAchieve, , Career career);
			
			return null;
		}
	//get 요청 사원 등록화면
	@RequestMapping(value="member/mm_add",method=RequestMethod.GET)
	public String mmAddCtrl(Model model){
			//System.out.println("사원등록컨트롤러확인");
		List<Achieve> achieve = memberService.acListServ();
		List<License> license = memberService.lcListServ();
		List<Contract> contract = memberService.CtListServ();
		List<Position> position = memberService.PtListServ();
		List<Department> department = memberService.DpListServ();
		List<MajorTypeOfBusiness> majorTypeOfBusiness = memberService.maListServ();
		List<MinorTypeOfBusiness> minorTypeOfBusiness = memberService.miListServ();
	
			/*log.debug("member컨트롤러 achieve확인 :"+achieve);
			log.debug("member컨트롤러 license확인 :"+license);
			log.debug("member컨트롤러 contract확인 :"+contract);
			log.debug("member컨트롤러 position확인 :"+position);
			log.debug("member컨트롤러 department확인 :"+department);
			log.debug("member컨트롤러 majorTypeOfBusiness확인 :"+majorTypeOfBusiness);
			log.debug("member컨트롤러 minorTypeOfBusiness확인 :"+minorTypeOfBusiness);*/
		/*for(int a=0; a<achieve.size(); a++){
			System.out.println("학력최종확인 : "+achieve.get(a).getAcCode());
		}
		for(int l=0; l<license.size(); l++){
			System.out.println("자격증최종확인 : "+license.get(l).getLcCode());
		}
		for(int c=0; c<contract.size(); c++){
			System.out.println("계약최종확인 : "+contract.get(c).getCtCode());
		}
		for(int p=0; p<position.size(); p++){
			System.out.println("직급최종확인 : "+position.get(p).getPtCode());
		}
		for(int d=0; d<department.size(); d++){
			System.out.println("부서최종확인 : "+department.get(d).getDpCode());
		}
		for(int m=0; m<majorTypeOfBusiness.size(); m++){
			System.out.println("상위업종최종확인 : "+majorTypeOfBusiness.get(m).getMaCode());
		}
		for(int i=0; i<minorTypeOfBusiness.size(); i++){
			System.out.println("하위업종최종확인 : "+minorTypeOfBusiness.get(i).getMiCode());
		}*/
		model.addAttribute("achieve", achieve);
		model.addAttribute("license", license);
		model.addAttribute("contract",contract);
		model.addAttribute("position",position);
		model.addAttribute("department", department);
		model.addAttribute("majorTypeOfBusiness", majorTypeOfBusiness);
		model.addAttribute("minorTypeOfBusiness", minorTypeOfBusiness);
		return "member/mm_add";
	}
		
}