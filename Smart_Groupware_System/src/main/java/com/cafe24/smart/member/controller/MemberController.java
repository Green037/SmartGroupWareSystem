package com.cafe24.smart.member.controller;

import java.util.List;
import java.util.Map;

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
import com.cafe24.smart.member.domain.MemberList;
import com.cafe24.smart.member.domain.MinorTypeOfBusiness;
import com.cafe24.smart.member.domain.Position;
import com.cafe24.smart.member.service.MemberService;

@Controller
public class MemberController {
	
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	
	//POST 사원정보수정
		@RequestMapping(value="member/mm_modify", method=RequestMethod.POST)
		public String mmModifyCtrl(Model model,Member member){
			int result = memberService.mmModifyeServ(member);
			System.out.println("수정값 확인"+result);
			
			return "redirect:mm_content";
		}
		
		//GET 사원정보수정
		@RequestMapping(value="member/mm_modify", method=RequestMethod.GET)
		public String mmModifyCtrl(Model model,Member member, HttpSession session){
			int mmCode = (int) session.getAttribute("mmCode");
			MemberContent viewMemberContent = memberService.mmContentServ(mmCode);
			
			model.addAttribute("memberContent", viewMemberContent);
			return "member/mm_modify";
		}
		
	
	
	//GET 사원 검색리스트 상세보기
	@RequestMapping(value="member/mm_view", method=RequestMethod.GET)
	public String mmViewCtrl(Model model, @RequestParam("mmCode")int mmCode){
		
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
	
	
	//get 사원 조건검색조회 
	@RequestMapping(value="member/mm_listSearch", method=RequestMethod.GET)
	public String mmSearchCtrl(Model model){
		
		
		List<Position> position = memberService.ptListServ();
		List<Department> department = memberService.dpListServ();
		List<Contract> contract = memberService.ctListServ();
		List<Achieve> achieve = memberService.acListServ();
		List<License> license = memberService.lcListServ();
	
		model.addAttribute("position",position);
		model.addAttribute("department", department);
		model.addAttribute("contract",contract);
		model.addAttribute("achieve", achieve);
		model.addAttribute("license", license);
		
		return "member/mm_listSearch";
	}
	//GET 요청 사원 개인정보조회
		@RequestMapping(value="member/mm_content", method=RequestMethod.GET)
		public String mmContentCtrl(Model model, HttpSession session){
			int mmCode = (int) session.getAttribute("mmCode");// 세션에 담겨져있는 값을 가져와 mmCode 변수에 담아준다.
			System.out.println("세션 코드값 확인 : "+mmCode);
			
			// 사원조회 매서드 호출
			MemberContent viewMemberContent = memberService.mmContentServ(mmCode); 
			MemberContent viewMemberContentMc = memberService.mmContentMcServ(mmCode);
			List<MemberContent> viewMemberContentLc = memberService.mmContentLcServ(mmCode);
			List<MemberContent> viewMemberContentCr = memberService.mmContentCrServ(mmCode);
			
			model.addAttribute("memberContent", viewMemberContent);
			model.addAttribute("memberContentMc", viewMemberContentMc);
			model.addAttribute("memberContentLc", viewMemberContentLc);
			model.addAttribute("memberContentCr", viewMemberContentCr);
			//System.out.println("컨트롤러에서 개인정보조회 확인:"+viewMemberContent); 확인완료
			//System.out.println("컨트롤러에서 개인정보조회 확인:"+viewMemberContentMc);확인완료
			//System.out.println("컨트롤러에서 개인정보조회 확인:"+viewMemberContentLc);확인완료
			//System.out.println("컨트롤러에서 개인정보조회 확인:"+viewMemberContentCr);확인완료
			return "member/mm_content";
		}
		
	// post 요청 사원 등록
		@RequestMapping(value="member/mm_add",method=RequestMethod.POST)
		public String mmAddCtrl(Member member,MemberAchieve memberAchieve,MemberLicense memberLicense,Career career) {
			
			//System.out.println("member입력확인"+member);
			//System.out.println("memberAchieve입력확인"+memberAchieve);
			//System.out.println("career입력확인"+career);
			//System.out.println("memberLicense입력확인"+memberLicense);
			//경력 입력 메서드호출
			memberService.mmAddServ(member,memberAchieve,memberLicense,career);
			//memberService.mmAddServ(Member member, MemberAchieve memberAchieve, , Career career);
			
		
			
			return "home";
		}
	//get 요청 사원 등록화면
	@RequestMapping(value="member/mm_add",method=RequestMethod.GET)
	public String mmAddCtrl(Model model){
			//System.out.println("사원등록컨트롤러확인");
		List<Achieve> achieve = memberService.acListServ();
		List<License> license = memberService.lcListServ();
		List<Contract> contract = memberService.ctListServ();
		List<Position> position = memberService.ptListServ();
		List<Department> department = memberService.dpListServ();
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