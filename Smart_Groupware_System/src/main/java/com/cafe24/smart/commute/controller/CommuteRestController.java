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

@RestController
public class CommuteRestController {

	private static final Logger log = LoggerFactory.getLogger(ProjectController.class);

	@Autowired
	private CommuteService commuteService;

	// 출근등록 - 포스트요청
	@RequestMapping(value = "cm/addOnTime", method = RequestMethod.POST)
	public Map<String, Object> cmAddOnTimeCtrl(Commute commute) {

		log.debug("CommuteRestController cmAddOnTimeCtrl commute : " + commute);

		Map<String, Object> resultMap = new HashMap<String, Object>();

		// 1. 오늘날짜로 출근체크된 열이 있는지 카운트확인.
		int count = commuteService.cmCountByTodayServ(commute);

		log.debug("CommuteRestController cmAddOnTimeCtrl count : " + count);

		// 2. 출첵이 안되어 있다면 입력정보와 현재시간 구해서 출근입력처리.
		if (count == 0) {
			int result = commuteService.addOnTimeServ(commute);

			if (result == 1) {
				resultMap.put("check", "성공");

				commute = commuteService.cmOnTimeTodayServ(commute);

				log.debug("최종 조회값 확인 : " + commute);

				resultMap.put("commute", commute);
			} else {
				resultMap.put("check", "실패");
			}

		} else {
			resultMap.put("check", "이미 출근체크를 하셨습니다.");
		}

		log.debug("CommuteRestController cmAddOnTimeCtrl resultMap : " + resultMap);

		return resultMap;
	}

	// 퇴근처리 - 포스트요청,출근등록 데이터에 수정처리하여 퇴근시간 체크하기
	@RequestMapping(value = "cm/addOffTime", method = RequestMethod.POST)
	public Map<String, Object> cmAddOffTimeCtrl(Commute commute) {

		log.debug("CommuteRestController cmAddOffTimeCtrl commute : " + commute);

		Map<String, Object> resultMap = new HashMap<String, Object>();

		// 1. 오늘날짜 퇴근기록 확인. 오늘날짜 출근기록 조회
		commute = commuteService.cmOnTimeTodayServ(commute);

		// 2. 오늘자 출근기록 가져와서 세팅하고 수정처리.
		commute.setCmCode(commute.getCmCode());
		if (commute.getCmOffTime() == null) {

			int result = commuteService.cmOffTimeServ(commute);

			log.debug("CommuteRestController cmAddOffTimeCtrl result : " + result);

			if (result == 1) {
				resultMap.put("check", "성공");

				commute = commuteService.cmOnTimeTodayServ(commute);

				resultMap.put("commute", commute);
			} else {
				resultMap.put("check", "실패");
			}

		} else if (commute.getCmOffTime() != null) {
			resultMap.put("check", "이미 퇴근체크를 하셨습니다.");
		} else if (!commute.getCmSituation().equals("근무중")) {
			resultMap.put("check", "외출중이거나 정상 근무중이 아닙니다.");
		}

		log.debug("CommuteRestController cmAddOffTimeCtrl resultMap : " + resultMap);

		return resultMap;
	}

	// 외출처리 - 포스트요청,출근등록 데이터에 수정처리하여 외출시간 체크하기
	@RequestMapping(value = "cm/addGoOut", method = RequestMethod.POST)
	public Map<String, Object> cmAddGoOutCtrl(Commute commute) {

		log.debug("CommuteRestController cmAddGoOutCtrl commute : " + commute);

		/*
		 * log.debug("H2 Ajax 외출등록~CTRL!!"); log.debug("넘어온 값 확인 : "+commute);
		 */
		String cmGoOutReason = commute.getCmGoOutReason();
		Map<String, Object> resultMap = new HashMap<String, Object>();

		// 1. 기존에 근무중인(출근중인) 사원만 외출등록 가능
		commute = commuteService.cmOnTimeTodayServ(commute);
		commute.setCmGoOutReason(cmGoOutReason);

		// 2. 출근중이면 데이터 가져와서 수정처리
		if (commute.getCmSituation().equals("근무중")) {
			int result = commuteService.cmGoOutServ(commute);

			if (result == 1) {
				resultMap.put("check", "성공");

				commute = commuteService.cmOnTimeTodayServ(commute);

				resultMap.put("commute", commute);
			} else {
				resultMap.put("check", "실패");
			}
		} else if (commute.getCmSituation().equals("외출중")) {
			resultMap.put("check", "이미 외출등록을 하셨습니다.");
		} else {
			resultMap.put("check", "외출중이거나 정상 근무중이 아닙니다.");
		}

		log.debug("CommuteRestController cmAddGoOutCtrl resultMap : " + resultMap);

		return resultMap;
	}

	// 외출복귀처리 - 포스트요청
	@RequestMapping(value = "cm/addReturn", method = RequestMethod.POST)
	public Map<String, Object> cmAddReturnCtrl(Commute commute) {

		log.debug("CommuteRestController cmAddReturnCtrl commute : " + commute);

		Map<String, Object> resultMap = new HashMap<String, Object>();

		// 1. 외출중인 사원만 복귀등록 가능
		commute = commuteService.cmOnTimeTodayServ(commute);
		/* log.debug("조회정보 확인 : "+commute); */

		// 2. 외출중이면 수정처리.
		if (commute.getCmSituation().equals("외출중")) {
			int result = commuteService.cmReturnServ(commute);

			if (result == 1) {
				resultMap.put("check", "성공");

				commute = commuteService.cmOnTimeTodayServ(commute);

				resultMap.put("commute", commute);
			} else {
				resultMap.put("check", "실패");
			}

		} else if (!commute.getCmSituation().equals("외출중")) {
			resultMap.put("check", "이미 복귀등록을 하셨습니다.");
		}

		log.debug("CommuteRestController cmAddReturnCtrl resultMap : " + resultMap);

		return resultMap;
	}

	// 본인 출퇴근 검색조회 - 포스트요청
	@RequestMapping(value = "cm/search", method = RequestMethod.POST)
	public List<Commute> cmSearchCtrl(@RequestParam("cmStartDay") String cmStartDay,
			@RequestParam("cmEndDay") String cmEndDay, HttpSession session) {

		log.debug("CommuteRestController cmSearchCtrl cmStartDay : " + cmStartDay + ", cmEndDay : " + cmEndDay);

		List<Commute> cmList = new ArrayList<Commute>();

		// 세션에서 로긴 되있는 사원코드 가져와서 날짜와 조건 일치하는 데이터 조회.
		int mmCode = (int) session.getAttribute("mmCode");

		log.debug("CommuteRestController cmSearchCtrl mmCode : " + mmCode);

		cmList = commuteService.cmPersonalListServ(mmCode, cmStartDay, cmEndDay);

		log.debug("CommuteRestController cmSearchCtrl cmList : " + cmList);

		return cmList;
	}

	// 부서코드로 해당부서 사원조회 - 포스트요청
	@RequestMapping(value = "cm/searchMm", method = RequestMethod.POST)
	public List<Member> cmSearchMmCtrl(@RequestParam("dpCode") int dpCode) {

		log.debug("CommuteRestController cmSearchMmCtrl dpCode : " + dpCode);

		// dpCode로 해당되는 맴버 정도 다 가져오기
		List<Member> mmList = new ArrayList<Member>();

		mmList = commuteService.cmSearchMmServ(dpCode);

		log.debug("CommuteRestController cmSearchMmCtrl mmList : " + mmList);

		return mmList;
	}

	// 해당부서의 사원 출퇴근내역 조회 - 포스트요청
	@RequestMapping(value = "cm/searchAll", method = RequestMethod.POST)
	public List<Commute> cmSearchAllCtrl(@RequestParam("cmStartDay") String cmStartDay,
			@RequestParam("cmEndDay") String cmEndDay, @RequestParam("dpCode") int dpCode,
			@RequestParam(value = "mmCode", defaultValue = "0") String mmCode) {

		log.debug("CommuteRestController cmSearchAllCtrl cmStartDay : " + cmStartDay + ", cmEndDay : " + cmEndDay);
		log.debug("CommuteRestController cmSearchAllCtrl dpCode : " + dpCode + ", mmCode : " + mmCode);

		// null허용 된 내용은 사원코드만 조건별 실행하는 쿼리 실행하는 메서드 호출.
		List<Commute> cmList = new ArrayList<Commute>();

		cmList = commuteService.cmDpListServ(cmStartDay, cmEndDay, dpCode, Integer.parseInt(mmCode));

		log.debug("CommuteRestController cmSearchAllCtrl cmList : " + cmList);

		return cmList;
	}
}