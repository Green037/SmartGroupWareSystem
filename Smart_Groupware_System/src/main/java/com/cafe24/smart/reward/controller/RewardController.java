package com.cafe24.smart.reward.controller;

import java.io.File;
import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.member.domain.MemberContent;
import com.cafe24.smart.member.service.MemberService;
import com.cafe24.smart.reward.domain.Incentive;
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
		
		List<Reward> reList = rewardService.reListServ();
		int rewardCount = rewardService.reCountAllServ();
		
		System.out.println("RewardController reListAllCtrl reList : " + reList);
		
		List<String> filePullPath = new ArrayList<String>(); 
		
		for (int i = 0; i < reList.size(); i++) {
			filePullPath.add(reList.get(i).getReDocument());
		}
		
		model.addAttribute("filePullPath", filePullPath);
		
		
//		filePath로 fileName만 추출하여 다시 List에 담기
		for (int i = 0; i < reList.size(); i++) {
			int lastIndex = reList.get(i).getReDocument().lastIndexOf("/");	
			
			reList.get(i).setReDocument(reList.get(i).getReDocument().substring(lastIndex + 1));
			
			System.out.println("RewardController reListAllCtrl getRedocument : " + 
									reList.get(i).getReDocument());
		}
		
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
	
//	고과기록정보조회
	@RequestMapping(value = "re/content", method = RequestMethod.GET)
	public String reContentCtrl(Model model) {
		
		mmCode = (int) session.getAttribute("mmCode");
		
		Member member = rewardService.mmContentServ(mmCode);
		
//		Reward 정보 받아오기
		Reward reward = rewardService.reContentServ(mmCode, utilDate.getCurrentYearMonth() + "-01", utilDate.getCurrentDate());
		
		int rewardCount = 0;
		
//		고과정보 있는 경우
		if (reward != null) {
			
			System.out.println("RewardController RewardController member : " + member);
			System.out.println("RewardController reListYearCtrl rewardCount : " + rewardCount);
			
			rewardCount = rewardService.reCountAllServ();
			
//			Incentive 정보 받아오기
			Incentive incentive = incentiveService.inListServ(reward.getReCode());
			
//			부서, 직급 정보
			String dpName = utilMember.getDpName(member.getDpCode());
			String ptName = utilMember.getPtName(member.getPtCode());
			
			model.addAttribute("member", member);
			model.addAttribute("dpName", dpName);
			model.addAttribute("ptName", ptName);
			
			model.addAttribute("reward", reward);
			model.addAttribute("incentive", incentive);
			model.addAttribute("rewardCount", rewardCount);
			
			System.out.println("RewardController RewardController model : " + model.toString());
//		고과 정보 없는 경우
		} else {
//			부서, 직급 정보
			String dpName = utilMember.getDpName(member.getDpCode());
			String ptName = utilMember.getPtName(member.getPtCode());
			
			model.addAttribute("rewardDate", utilDate.getCurrentDate());
			model.addAttribute("mmCode", mmCode);
			model.addAttribute("member", member);
			model.addAttribute("dpName", dpName);
			model.addAttribute("ptName", ptName);
			model.addAttribute("rewardCount", rewardCount);
		}
	
		return "reward/re_content";
	}
	
//	인사부 > 특정 사원의 고과내역 보기
	@RequestMapping(value = "re/mmContent", method = RequestMethod.GET)
	public String reContentMmCtrl(@RequestParam(value="reCode") int reCode,
																			Model model) {
		
		System.out.println("RewardController reContentMmCtrl reCode : " + reCode);
		
		Reward reward = rewardService.reListByReCodeServ(reCode);
		int rewardCount = rewardService.reCountAllServ();
		
		System.out.println("RewardController reContentMmCtrl reward : " + reward);
		
		Member member = rewardService.mmContentServ(reward.getMmCode());
		
//		Incentive 정보 받아오기
		Incentive incentive = incentiveService.inListServ(reCode);
		
//		부서
		String dpName = utilMember.getDpName(member.getDpCode());
//		직급
		String ptName = utilMember.getPtName(member.getPtCode());
		
//		filePath로 fileName만 추출하여 다시 List에 담기
		int lastIndex = reward.getReDocument().lastIndexOf("/");	
			
		reward.setReDocument(reward.getReDocument().substring(lastIndex + 1));
		
		model.addAttribute("dpName", dpName);
		model.addAttribute("ptName", ptName);
		model.addAttribute("member", member);
		model.addAttribute("incentive", incentive);
		model.addAttribute("reward", reward);
		model.addAttribute("rewardCount", rewardCount);
		
		return "reward/re_content";
	}
	
//	인사부 > 고과목록 추가 (get)
	@RequestMapping(value = "re/add", method = RequestMethod.GET)
	public String reAddFormCtrl(Model model, HttpServletRequest request) {
		
		mmCode = (int) session.getAttribute("mmCode");
		
		model.addAttribute("reMmCode", mmCode);
		
		return "reward/re_add";
	}

//	인사부 > 고과목록 추가 (파일 업로드) (post)
	@RequestMapping(value = "re/add", method = RequestMethod.POST)
	public String reAddProCtrl(@RequestParam("uploadFile") MultipartFile uploadFile,
									MultipartHttpServletRequest request, Reward reward) {
		
		System.out.println("RewardController reAddProCtrl uploadFile : " + uploadFile);
		System.out.println("RewardController reAddProCtrl reward : " + reward);
		
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
		
		return "reward/re_listAll";
	}
	
//	고과서류 파일 다운로드 (get)
	@RequestMapping(value = "/re/fileDownload", method = RequestMethod.GET)
	public ModelAndView reDocumentDown(@RequestParam(value="reCode") int reCode) {
		
		Reward reward = rewardService.reListByReCodeServ(reCode);
		
		File downFile = new File(reward.getReDocument());
		
		System.out.println("RewardController reDocumentDown reCode : " + reCode);
		
		return new ModelAndView("downloadView", "downloadFile", downFile);
	}
}