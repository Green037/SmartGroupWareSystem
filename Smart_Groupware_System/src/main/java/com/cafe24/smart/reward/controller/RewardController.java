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
import com.cafe24.smart.reward.domain.Reward;
import com.cafe24.smart.reward.service.IncentiveService;
import com.cafe24.smart.reward.service.RewardService;
import com.cafe24.smart.util.UtilFile;

@Controller
public class RewardController {
	private static final Logger log = LoggerFactory.getLogger(RewardController.class);
	
	@Autowired
	RewardService rewardService;
	
	@Autowired
	IncentiveService incentiveService;
	
	@Autowired
	HttpSession session;
	
	Calendar calendar;
	
//	인사부 > 고과목록관리 
	@RequestMapping(value = "re/listAll", method = RequestMethod.GET)
	public String reListAllCtrl() {
						
		return "reward/re_listAll";
	}
	
//	연간고과목록 보기
	@RequestMapping(value = "re/list", method = RequestMethod.GET)
	public String reListCtrl() {
						
		return "reward/re_list";
	}
	
//	고과내역 보기
	@RequestMapping(value = "re/content", method = RequestMethod.GET)
	public String reContentCtrl(Model model) {
		
		int mmCode = (int) session.getAttribute("mmCode");
		
//		오늘 날짜 구하기
		calendar = Calendar.getInstance();
		
		String reDate = String.valueOf(calendar.get(Calendar.YEAR)) + "-";
		reDate += String.valueOf(calendar.get(Calendar.MONTH) + 1) + "-";
		reDate += String.valueOf(calendar.get(Calendar.DATE));
		
		System.out.println("RewardController RewardController mmCode : " + mmCode);
		System.out.println("RewardController RewardController reDate : " + reDate);
		
		Member member = rewardService.mmContentServ(mmCode);
		
		List<Reward> reward = rewardService.reContentServ(mmCode, "2016-11-13");
		
		System.out.println("RewardController RewardController reward : " + reward);
		System.out.println("RewardController RewardController member : " + member);
		
//		model.addAttribute("reward", reward);
		model.addAttribute("member", member);
		
		System.out.println("RewardController RewardController model : " + model.toString());
		
		return "reward/re_content";
	}
	
//	인사부 > 고과목록 추가 (get)
	@RequestMapping(value = "re/add", method = RequestMethod.GET)
	public String reAddFormCtrl(Model model, HttpServletRequest request) {
		
		int mmCode = (int) session.getAttribute("mmCode");
		
		model.addAttribute("reMmCode", mmCode);
		
		return "reward/re_add";
	}

//	인사부 > 고과목록 추가 (파일 업로드) (post)
	@RequestMapping(value = "re/add", method = RequestMethod.POST)
	public String reAddProCtrl(@RequestParam("uploadFile") MultipartFile uploadFile,
									MultipartHttpServletRequest request, Reward reward) {
		
		int n = 0;
		
		System.out.println("RewardController reAddProCtrl uploadFile : " + uploadFile);
		
		UtilFile utilFile = new UtilFile();
		
//		파일 업로드 결과값을 path로 받아 
		String uploadPath = utilFile.fileUpload(request, uploadFile, reward);
		
//		해당 경로를 db에 저장
		n = rewardService.reAddServ(uploadPath, reward);
		
		if (n > 0) {
			n = incentiveService.inAddServ(reward);
		}
		
		System.out.println("RewardController reAddProCtrl n : " + n);
		System.out.println("RewardController reAddProCtrl uploadPath : " + uploadPath);
		
		return "reward/re_list";
	}
}