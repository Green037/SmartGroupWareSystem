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
	
	//참여인원 상세보기
	@RequestMapping(value = "pm/detail", method = RequestMethod.POST)
	public List<ProjectMember> pmListCtrl(@RequestParam("prCode") int prCode) {
		//System.out.println("h2");
		//System.out.println("넘어온 프로젝트코드값 : "+prCode);
		List<ProjectMember> pmList = new ArrayList<ProjectMember>(); 
		
		pmList = projectService.pmListServ(prCode);
		System.out.println(pmList);
		return pmList;
	}
	
	//자금상세보기
	@RequestMapping(value = "fu/detail", method = RequestMethod.POST)
	public List<Funds> fuListCtrl(@RequestParam("prCode") int prCode) {
		/*System.out.println("h2 funds ajax!!");
		System.out.println("넘어온 프로젝트코드값 : "+prCode);*/
		List<Funds> fuList = new ArrayList<Funds>(); 
		
		fuList = projectService.fuListServ(prCode);
		//System.out.println(fuList);
		
		return fuList;
	}
	
	// 참여인원 신청자 조회.
	@RequestMapping(value = "pm/add", method = RequestMethod.POST)
	public List<ProjectMember> pmAddListCtrl(@RequestParam("prCode") int prCode) {
		/*System.out.println("h2");
		System.out.println("넘어온 프로젝트코드값 : "+prCode);*/
		
		List<ProjectMember> pmList = new ArrayList<ProjectMember>(); 
		
		pmList = projectService.pmAddListServ(prCode);
		
		return pmList;
	}
	
	// 프로젝트에 할당된 상세자금 전체조회.
	@RequestMapping(value = "fu/modifyList", method = RequestMethod.POST)
	public List<Funds> fuModifyListCtrl(@RequestParam("prCode") int prCode) {
		/*System.out.println("h2 fu Modify List Ajax!!");
		System.out.println("넘어온 프로젝트코드값 : "+prCode);*/
		
		// 프로젝트코드로 입력된 자금내역 모두 조회하기
		
		List<Funds> fuList = new ArrayList<Funds>(); 
		fuList = projectService.fuListServ(prCode);
		
		return fuList;
	}
	
	// 프로젝트에 할당된 상세자금 조회.
	@RequestMapping(value = "fu/modifyValue", method = RequestMethod.POST)
	public Funds fuModifyValueCtrl(@RequestParam("fuCode") int fuCode) {
		/*System.out.println("h2 fu Modify Value Ajax!!");
		System.out.println("넘어온 프로젝트코드값 : "+fuCode);*/
		
		// 자금코드로 입력된 자금내역 조회하기
		Funds funds = new Funds();
		
		funds = projectService.fuModifyValueServ(fuCode);
		
		return funds;
	}
	
	// 자금내용수정.
	@RequestMapping(value = "fu/modify", method = RequestMethod.POST)
	public Map<String,String> fuModifyCtrl(Funds funds) {
		/*System.out.println("h2 fu ModifyAjax 직렬화된 데이터 확인!!");
		System.out.println("넘어온 값 확인 : "+funds);*/
		
		// 입력받은 내용으로 수정하기
		int result = projectService.fuModifyServ(funds);
		/*System.out.println("자금수정결과 : "+result);*/
		
		//수정결과에 따라 성공 혹은 실패 리턴~
		Map<String,String> resultMap = new HashMap<String, String>();
		if(result != 0){
			resultMap.put("result", "성공");
		}else{
			resultMap.put("result", "실패");
		}
		
		return resultMap;
	}
	
	// 자금내용추가입력.
	@RequestMapping(value = "fu/add", method = RequestMethod.POST)
	public Map<String,String> fuAddCtrl(Funds funds) {
		/*System.out.println("h2 fu add Ajax 데이터 확인!!");
		System.out.println("넘어온 값 확인 : "+funds);*/
		
		Map<String,String> resultMap = new HashMap<String, String>();
		
		// 입력받은 내용 insert하기
		int result = projectService.fuAddServ(funds);
		//System.out.println("자금입력결과 : "+result);
		
		//입력결과에 따라 성공 혹은 실패 리턴~
		if(result != 0){
			resultMap.put("result", "성공");
		}else{
			resultMap.put("result", "실패");
		}
		
		return resultMap;
	}
	
	// 프로젝트삭제요청전 팀장체크.
	@RequestMapping(value = "pr/removeCheck", method = RequestMethod.POST)
	public Map<String,Object> prRemoveCheckCtrl(Member member) {
		/*System.out.println("H2 Ajax Delete MemberCheck~!!");
		System.out.println(member);*/
		Map<String,Object> resultMap = new HashMap<String,Object>();
		
		//사원정보비교 후 일치 불일치리턴~!!
		int mmCode = wbsService.checkMemberServ(member);
		
		if(mmCode > 1 && mmCode < 10000){ //비번일치시 .
			resultMap.put("checkresult", true);
			resultMap.put("check", "삭제");
		}else if(mmCode == 10000){
			resultMap.put("checkresult", false);
			resultMap.put("check", "비번");
		}else if(mmCode == 0){
			resultMap.put("checkresult", false);
			resultMap.put("check", "아이디");
		}
		
		return resultMap;
	}
	
	//프로젝트 검색
	@RequestMapping(value = "pr/search", method = RequestMethod.POST)
	public List<Project> prSearchCtrl(Project project, @RequestParam("prSize") String prSize) {
		/*System.out.println("h2 search Project Ajax!!");
		System.out.println("넘어온 값 확인 : "+project);
		System.out.println("넘어온 파라미터 확인 : "+prSize);*/
		
		//입력받은 값으로 검색처리
		List<Project> projectList = new ArrayList<Project>();
		projectList = projectService.prSearchServ(project, prSize);
		//System.out.println(projectList);
		
		return projectList;
	}
	
	//프로젝트 리스트 - 포스트요청
		@RequestMapping(value = "pr/list", method = RequestMethod.POST)
		public List<Project> prListCtrl(@RequestParam(value="prProgress", defaultValue="0")int prProgress) {
			System.out.println("h2");
			System.out.println("넘어온 prProgress값확인 : "+prProgress);
			List<Project> projectList = new ArrayList<Project>();
			
			//모든 프로젝트 내용 조회
			projectList = projectService.prListServ(prProgress);
			System.out.println(projectList);
			
			return projectList;
		}
}
