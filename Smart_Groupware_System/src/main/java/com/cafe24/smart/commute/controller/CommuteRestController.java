package com.cafe24.smart.commute.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.smart.commute.domain.Commute;
import com.cafe24.smart.commute.service.CommuteService;
import com.cafe24.smart.member.domain.Member;
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
		/*System.out.println("h2 Ctrl Ajax Commute offTimeCheck!!");
		System.out.println("입력값 확인 : "+commute);*/
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		// 1. 오늘날짜 퇴근기록 확인. 오늘날짜 출근기록 조회
		commute = commuteService.cmOnTimeTodayServ(commute);
		/*System.out.println("오늘의 퇴근기록 : "+commute);*/
		
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
		}else if(!commute.getCmSituation().equals("근무중")){
			resultMap.put("check", "외출중이거나 정상 근무중이 아닙니다.");
		}
		return resultMap;
	}
	
	//퇴근처리 - 포스트요청,출근등록 데이터에 수정처리하여 퇴근시간 체크하기
	@RequestMapping(value = "cm/addGoOut", method = RequestMethod.POST)
	public Map<String, Object> cmAddGoOutCtrl(Commute commute) {
		/*System.out.println("H2 Ajax 외출등록~CTRL!!");
		System.out.println("넘어온 값 확인 : "+commute);*/
		String cmGoOutReason = commute.getCmGoOutReason();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		// 1. 기존에 근무중인(출근중인) 사원만 외출등록 가능
		commute = commuteService.cmOnTimeTodayServ(commute);
		commute.setCmGoOutReason(cmGoOutReason);
		/*System.out.println("조회되었는지 확인 : "+commute);*/
		
		// 2. 출근중이면 데이터 가져와서 수정처리
		if(commute.getCmSituation().equals("근무중")){
			int result = commuteService.cmGoOutServ(commute);
			if(result == 1){
				resultMap.put("check", "성공");
			}else{
				resultMap.put("check", "실패");
			}
		}else if(commute.getCmSituation().equals("외출중")){
			resultMap.put("check", "이미 외출등록을 하셨습니다.");
		}else{
			resultMap.put("check", "외출중이거나 정상 근무중이 아닙니다.");
		}
		return resultMap;
	}

	//외출복귀처리 - 포스트요청
	@RequestMapping(value = "cm/addReturn", method = RequestMethod.POST)
	public Map<String, Object> cmAddReturnCtrl(Commute commute) {
		/*System.out.println("h2 Ajax Ctrl 외출복귀!!");
		System.out.println("넘어온 값 확인 : "+commute);*/
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//1. 외출중인 사원만 복귀등록 가능
		commute = commuteService.cmOnTimeTodayServ(commute);
		/*System.out.println("조회정보 확인 : "+commute);*/
		
		//2. 외출중이면 수정처리.
		if(commute.getCmSituation().equals("외출중")){
			int result = commuteService.cmReturnServ(commute);
			if(result == 1){
				resultMap.put("check", "성공");
			}else{
				resultMap.put("check", "실패");
			}
		}else if(!commute.getCmSituation().equals("외출중")){
			resultMap.put("check", "이미 복귀등록을 하셨습니다.");
		}
		return resultMap;
	}
	
	//본인 출퇴근 검색조회 - 포스트요청
	@RequestMapping(value = "cm/search", method = RequestMethod.POST)
	public List<Commute> cmSearchCtrl(@RequestParam("cmStartDay")String cmStartDay,
									@RequestParam("cmEndDay")String cmEndDay,
									HttpSession session) {
		/*System.out.println("H2 Ajax Ctrl 개인근태조회~!!");
		System.out.println("넘어온 값 확인 : "+cmStartDay+" ~ "+cmEndDay);*/
		List<Commute> cmList = new ArrayList<Commute>();
		
		//세션에서 로긴 되있는 사원코드 가져와서 날짜와 조건 일치하는 데이터 조회.
		int mmCode = (int)session.getAttribute("mmCode");
		/*System.out.println("세션에서 가져온 사원코드확인 : "+mmCode);*/
		
		cmList = commuteService.cmPersonalListServ(mmCode, cmStartDay, cmEndDay);
		/*System.out.println("조회된 리스트확인 : "+cmList);*/
		
		return cmList;
	}
	
	//부서코드로 해당부서 사원조회 - 포스트요청
	@RequestMapping(value = "cm/searchMm", method = RequestMethod.POST)
	public List<Member> cmSearchMmCtrl(@RequestParam("dpCode")int dpCode){
		/*System.out.println("h2 Ajax SearchMember!!");
		System.out.println("넘어온 dpCode값 확인 : "+dpCode);*/
		
		//dpCode로 해당되는 맴버 정도 다 가져오기
		List<Member> mmList = new ArrayList<Member>();
		mmList = commuteService.cmSearchMmServ(dpCode);
		/*System.out.println("최종 사원조회내용 확인 : "+mmList);*/
		
		return mmList;
	}
	
	//해당부서의 사원 출퇴근내역 조회 - 포스트요청
	@RequestMapping(value = "cm/searchAll", method = RequestMethod.POST)
	public List<Commute> cmSearchAllCtrl(@RequestParam("cmStartDay")String cmStartDay,
										@RequestParam("cmEndDay")String cmEndDay,
										@RequestParam("dpCode")int dpCode,
										@RequestParam(value="mmCode", defaultValue="0")int mmCode){
		System.out.println("h2 부서 근태조회 ajax Ctrl!");
		System.out.println("넘어온 값 확인 : "+cmStartDay+" ~ "+cmEndDay);
		System.out.println("부서코드 : "+dpCode);
		System.out.println("사원코드 : "+mmCode);
		
		// null허용 된 내용은 사원코드만 조건별 실행하는 쿼리 실행하는 메서드 호출.
		List<Commute> cmList = new ArrayList<Commute>();
		cmList = commuteService.cmDpListServ(cmStartDay, cmEndDay, dpCode, mmCode);
		System.out.println("최종 조회값 확인 : "+cmList);
		
		return cmList;
	}
	
}
