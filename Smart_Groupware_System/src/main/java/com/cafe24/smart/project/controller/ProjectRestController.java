package com.cafe24.smart.project.controller;

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

import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.project.domain.Funds;
import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.project.domain.ProjectMember;
import com.cafe24.smart.project.service.ProjectService;
import com.cafe24.smart.wbs.service.WbsService;

@RestController
public class ProjectRestController {

	private static final Logger log = LoggerFactory.getLogger(ProjectController.class);

	@Autowired
	private ProjectService projectService;

	@Autowired
	private WbsService wbsService;

	// 참여인원 상세보기
	@RequestMapping(value = "pm/detail", method = RequestMethod.POST)
	public List<ProjectMember> pmListCtrl(@RequestParam("prCode") int prCode) {

		log.debug("ProjectRestController pmListCtrl prCode : " + prCode);

		List<ProjectMember> pmList = new ArrayList<ProjectMember>();

		pmList = projectService.pmListServ(prCode);

		log.debug("ProjectRestController pmListCtrl pmList : " + pmList);

		return pmList;
	}

	// 자금상세보기
	@RequestMapping(value = "fu/detail", method = RequestMethod.POST)
	public List<Funds> fuListCtrl(@RequestParam("prCode") int prCode) {

		log.debug("ProjectRestController fuListCtrl prCode : " + prCode);

		List<Funds> fuList = new ArrayList<Funds>();

		fuList = projectService.fuListServ(prCode);

		log.debug("ProjectRestController fuListCtrl fuList : " + fuList);

		return fuList;
	}

	// 참여인원 신청자 조회.
	@RequestMapping(value = "pm/add", method = RequestMethod.POST)
	public List<ProjectMember> pmAddListCtrl(@RequestParam("prCode") int prCode) {

		log.debug("ProjectRestController pmAddListCtrl prCode : " + prCode);

		List<ProjectMember> pmList = new ArrayList<ProjectMember>();

		pmList = projectService.pmAddListServ(prCode);

		log.debug("ProjectRestController pmAddListCtrl pmList : " + pmList);

		return pmList;
	}

	// 프로젝트에 할당된 상세자금 전체조회.
	@RequestMapping(value = "fu/modifyList", method = RequestMethod.POST)
	public List<Funds> fuModifyListCtrl(@RequestParam("prCode") int prCode) {

		log.debug("ProjectRestController fuModifyListCtrl prCode : " + prCode);

		// 프로젝트코드로 입력된 자금내역 모두 조회하기
		List<Funds> fuList = new ArrayList<Funds>();

		fuList = projectService.fuListServ(prCode);

		log.debug("ProjectRestController fuModifyListCtrl fuList : " + fuList);

		return fuList;
	}

	// 프로젝트 검색
	@RequestMapping(value = "pr/search", method = RequestMethod.POST)
	public List<Project> prSearchCtrl(Project project, @RequestParam("prSize") String prSize) {

		log.debug("ProjectRestController prSearchCtrl project : " + project);
		log.debug("ProjectRestController prSearchCtrl prSize : " + prSize);

		// 입력받은 값으로 검색처리
		List<Project> projectList = new ArrayList<Project>();

		projectList = projectService.prSearchServ(project, prSize);

		log.debug("ProjectRestController prSearchCtrl projectList : " + projectList);

		return projectList;
	}

	// 프로젝트 리스트 - 포스트요청
	@RequestMapping(value = "pr/list", method = RequestMethod.POST)
	public List<Project> prListCtrl(@RequestParam(value = "prProgress", defaultValue = "0") int prProgress) {

		log.debug("ProjectRestController prListCtrl prProgress : " + prProgress);

		List<Project> projectList = new ArrayList<Project>();

		// 모든 프로젝트 내용 조회
		projectList = projectService.prListServ(prProgress);

		log.debug("ProjectRestController prListCtrl projectList : " + projectList);

		return projectList;
	}

	// 프로젝트에 할당된 상세자금 조회.
	@RequestMapping(value = "fu/modifyValue", method = RequestMethod.POST)
	public Funds fuModifyValueCtrl(@RequestParam("fuCode") int fuCode) {

		log.debug("ProjectRestController fuModifyValueCtrl fuCode : " + fuCode);

		// 자금코드로 입력된 자금내역 조회하기
		Funds funds = new Funds();

		funds = projectService.fuModifyValueServ(fuCode);

		log.debug("ProjectRestController fuModifyValueCtrl funds : " + funds);

		return funds;
	}

	// 자금내용수정.
	@RequestMapping(value = "fu/modify", method = RequestMethod.POST)
	public Map<String, String> fuModifyCtrl(Funds funds) {

		log.debug("ProjectRestController fuModifyCtrl funds : " + funds);

		// 입력받은 내용으로 수정하기
		int result = projectService.fuModifyServ(funds);

		log.debug("ProjectRestController fuModifyCtrl result : " + result);

		// 수정결과에 따라 성공 혹은 실패 리턴~
		Map<String, String> resultMap = new HashMap<String, String>();

		if (result != 0) {
			resultMap.put("result", "성공");
		} else {
			resultMap.put("result", "실패");
		}

		log.debug("ProjectRestController fuModifyCtrl resultMap : " + resultMap);

		return resultMap;
	}

	// 자금내용추가입력.
	@RequestMapping(value = "fu/add", method = RequestMethod.POST)
	public Map<String, String> fuAddCtrl(Funds funds) {

		log.debug("ProjectRestController fuAddCtrl funds : " + funds);

		Map<String, String> resultMap = new HashMap<String, String>();

		// 입력받은 내용 insert하기
		int result = projectService.fuAddServ(funds);

		log.debug("ProjectRestController fuAddCtrl result : " + result);

		// 입력결과에 따라 성공 혹은 실패 리턴~
		if (result != 0) {
			resultMap.put("result", "성공");
		} else {
			resultMap.put("result", "실패");
		}

		log.debug("ProjectRestController fuAddCtrl resultMap : " + resultMap);

		return resultMap;
	}

	// 프로젝트삭제요청전 팀장체크.
	@RequestMapping(value = "pr/removeCheck", method = RequestMethod.POST)
	public Map<String, Object> prRemoveCheckCtrl(Member member) {

		log.debug("ProjectRestController prRemoveCheckCtrl member : " + member);

		Map<String, Object> resultMap = new HashMap<String, Object>();

		// 사원정보비교 후 일치 불일치리턴~!!
		int mmCode = wbsService.checkMemberServ(member);

		log.debug("ProjectRestController prRemoveCheckCtrl mmCode : " + mmCode);

		if (mmCode > 1 && mmCode < 10000) { // 비번일치시 .
			resultMap.put("checkresult", true);
			resultMap.put("check", "삭제");
		} else if (mmCode == 10000) {
			resultMap.put("checkresult", false);
			resultMap.put("check", "비번");
		} else if (mmCode == 0) {
			resultMap.put("checkresult", false);
			resultMap.put("check", "아이디");
		}

		log.debug("ProjectRestController prRemoveCheckCtrl resultMap : " + resultMap);

		return resultMap;
	}
}