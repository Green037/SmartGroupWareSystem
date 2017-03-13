package com.cafe24.smart.reward.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.member.domain.MemberContent;
import com.cafe24.smart.member.service.MemberService;
import com.cafe24.smart.reward.domain.Reward;
import com.cafe24.smart.reward.service.IncentiveService;
import com.cafe24.smart.reward.service.RewardService;
import com.cafe24.smart.util.UtilDate;
import com.cafe24.smart.util.UtilFile;
import com.cafe24.smart.util.UtilMember;

@Controller
public class RewardController {
	private static final Logger log = LoggerFactory.getLogger(RewardController.class);
	
	@Autowired
	RewardService rewardService;
	
	@Autowired
	IncentiveService incentiveService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	HttpSession session;
	
	Calendar calendar;
	
	UtilDate utilDate = new UtilDate();
	UtilMember utilMember = new UtilMember();
	
	int mmCode = 0;
	
//	인사부 > 총고과목록 
	@RequestMapping(value = "re/listAll", method = RequestMethod.GET)
	public String reListAllCtrl(Model model) {
		
		mmCode = (int) session.getAttribute("mmCode");
		
		Reward reward = new Reward();
		
		List<Reward> reList = rewardService.reListServ();
		int rewardCount = rewardService.reCountAllServ();
		
		System.out.println("RewardController reListAllCtrl reList : " + reList);
		
		for (int i = 0; i < reList.size(); i++) {
			reward.setReDocument(reList.get(i).getReDocument()
					.substring(reList.get(i).getReDocument().lastIndexOf("/") + 1, 
								reList.get(i).getReDocument().lastIndexOf(".")));
		}
		
		System.out.println("RewardController reListAllCtrl getReDocument : " + reward.getReDocument());
		
	
		model.addAttribute("reList", reList);
		model.addAttribute("rewardCount", rewardCount);
		
		System.out.println("RewardController reListAllCtrl model : " + model);
						
		return "reward/re_listAll";
	}
	
//	연간고과목록 보기
	@RequestMapping(value = "re/list", method = RequestMethod.GET)
	public String reListYearCtrl(Model model) {
		
		String startDate = utilDate.getCurrentYear() + "-01-01";
		String endDate = utilDate.getCurrentDate();
		
		mmCode = (int) session.getAttribute("mmCode");
		
//		연간 고과내역 조회 리스트를 받아옴 + count
		List<Reward> reYearList = rewardService.reListYearServ(mmCode, startDate, endDate);
		int rewardCount = rewardService.reCountAllServ();
		
		System.out.println("RewardController reListYearCtrl reYearList : " + reYearList);
		System.out.println("RewardController reListYearCtrl rewardCount : " + rewardCount);
		
		MemberContent member = memberService.mmContentServ(mmCode);
		
		String dpName = utilMember.getDpName(member.getDpCode());
		
		model.addAttribute("member", member);		
		model.addAttribute("dpName", dpName);
		model.addAttribute("mmCode", mmCode);
		model.addAttribute("rewardCount", rewardCount);
		
		return "reward/re_list";
	}
	
//	고과내역 보기
	@RequestMapping(value = "re/content", method = RequestMethod.GET)
	public String reContentCtrl(Model model) {
		
		mmCode = (int) session.getAttribute("mmCode");
		
		Member member = rewardService.mmContentServ(mmCode);
		
		List<Reward> reward = rewardService.reContentServ(mmCode, utilDate.getCurrentDate());
		int rewardCount = rewardService.reCountAllServ();
		
		System.out.println("RewardController RewardController reward : " + reward);
		System.out.println("RewardController RewardController member : " + member);
		System.out.println("RewardController reListYearCtrl rewardCount : " + rewardCount);
	
		model.addAttribute("member", member);
//		model.addAttribute("reward", reward);
		model.addAttribute("rewardCount", rewardCount);
		
		System.out.println("RewardController RewardController model : " + model.toString());
		
		return "reward/re_content";
	}
	
//	인사부 > 고과목록 추가 (get)
	@RequestMapping(value = "re/add", method = RequestMethod.GET)
	public String reAddFormCtrl(Model model, HttpServletRequest request) {
		
		model.addAttribute("reMmCode", mmCode);
		
		return "reward/re_add";
	}

//	인사부 > 고과목록 추가 (파일 업로드) (post)
	@RequestMapping(value = "re/add", method = RequestMethod.POST)
	public String reAddProCtrl(@RequestParam("uploadFile") MultipartFile uploadFile,
									MultipartHttpServletRequest request, Reward reward) {
		
		System.out.println("RewardController reAddProCtrl uploadFile : " + uploadFile);
		
		UtilFile utilFile = new UtilFile();
		
//		파일 업로드 결과값을 path로 받아 
		String uploadPath = utilFile.fileUpload(request, uploadFile, reward);
		
//		해당 경로만 받아 db에 저장
		int n = rewardService.reAddServ(uploadPath, reward);
		
		if (n > 0) {
			incentiveService.inAddServ(reward);
		}
		
		System.out.println("RewardController reAddProCtrl n : " + n);
		System.out.println("RewardController reAddProCtrl uploadPath : " + uploadPath);
		
		return "reward/re_list";
	}
}