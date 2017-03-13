package com.cafe24.smart.commute.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.smart.commute.domain.Commute;
import com.cafe24.smart.commute.service.CommuteService;
import com.cafe24.smart.project.controller.ProjectController;
import com.cafe24.smart.project.domain.ProjectMember;

@RestController
public class CommuteRestController {
	
	private static final Logger log = LoggerFactory.getLogger(ProjectController.class);
	
	@Autowired
	private CommuteService commuteService;
	
	//출근등록 - 포스트요청
	@RequestMapping(value = "cm/addOnTime", method = RequestMethod.POST)
	public Map<String, Object> cmAddOnTimeCtrl(Commute commute) {
		/*System.out.println("h2 Ctrl Ajax Commute onTimeCheck!!");
		System.out.println("입력값 확인 : "+commute);*/
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		// 1. 오늘날짜로 출근체크된 열이 있는지 카운트확인.
		int count = commuteService.cmCountByTodayServ(commute);
		
		// 2. 출첵이 안되어 있다면 입력정보와 현재시간 구해서 출근입력처리.
		if(count == 0){
			int result = commuteService.addOnTimeServ(commute);
			if(result == 1){
				resultMap.put("check", "성공");
			}else{
				resultMap.put("check", "실패");
			}
		}else{
			resultMap.put("check", "이미 출근체크를 하셨습니다.");
		}
		return resultMap;
	}
	
	//퇴근처리 - 포스트요청,출근등록 데이터에 수정처리하여 퇴근시간 체크하기
		@RequestMapping(value = "cm/addOffTime", method = RequestMethod.POST)
		public Map<String, Object> cmAddOffTimeCtrl(Commute commute) {
			System.out.println("h2 Ctrl Ajax Commute offTimeCheck!!");
			System.out.println("입력값 확인 : "+commute);
			Map<String, Object> resultMap = new HashMap<String, Object>();
			
			// 1. 오늘날짜 퇴근기록 확인. 오늘날짜 출근기록 조회
			commute = commuteService.cmOnTimeTodayServ(commute);
			System.out.println("오늘의 퇴근기록 : "+commute);
			
			// 2. 오늘자 출근기록 가져와서 세팅하고 수정처리.
			commute.setCmCode(commute.getCmCode());
			if(commute.getCmOffTime() == null){
				int result = commuteService.cmOffTimeServ(commute);
				if(result == 1){
					resultMap.put("check", "성공");
				}else{
					resultMap.put("check", "실패");
				}
			}else if(commute.getCmOffTime() != null){
				resultMap.put("check", "이미 퇴근체크를 하셨습니다.");
			}
			return resultMap;
		}
	
}
