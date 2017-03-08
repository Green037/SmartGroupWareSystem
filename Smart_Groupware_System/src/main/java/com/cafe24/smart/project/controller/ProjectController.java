package com.cafe24.smart.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.project.domain.Funds;
import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.project.domain.ProjectMember;
import com.cafe24.smart.project.domain.ProjectMemberCommand;
import com.cafe24.smart.project.service.ProjectService;
import com.cafe24.smart.wbs.domain.Wbs;
import com.cafe24.smart.wbs.service.WbsService;



@Controller
public class ProjectController {
	
	private static final Logger log = LoggerFactory.getLogger(ProjectController.class);
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private WbsService wbsService;
	
	//프로젝트 등록 - 폼요청 겟방식
	@RequestMapping(value = "pr/add", method = RequestMethod.GET)
	public String prAddCtrl() {
						
		return "project/pr_addForm";
	}	

	// 프로젝트 등록 포스트요청 - 프로젝트, 자금, 인원 폼 동시 처리.
	@RequestMapping(value = "pr/add", method = RequestMethod.POST)
	public String prAddCtrl(ProjectMember projectMember, Project project, Funds funds) {
		/*System.out.println("h2");
		System.out.println(project);
		System.out.println(funds);
		System.out.println(projectMember);*/
		
		int result = projectService.prAddServ(projectMember, project, funds);
		
		return "home";
	}	
	
	//프로젝트 리스트 - 겟요청
	@RequestMapping(value = "pr/list", method = RequestMethod.GET)
	public String prListCtrl(Model model, @RequestParam(value="prProgress", defaultValue="0")int prProgress) {
		//System.out.println("h2");
		List<Project> projectList = new ArrayList<Project>();
		
		//모든 프로젝트 내용 조회
		projectList = projectService.prListServ(prProgress);
		System.out.println(projectList);
		
		model.addAttribute("projectList", projectList);
		
		return "project/pr_list";
	}
	
	// 프로젝트 참여신청자등록 포스트요청
	@RequestMapping(value = "pr/addPm", method = RequestMethod.POST)
	public String pmAddCtrl(ProjectMember projectMember) {
		/*System.out.println("h2 Post!!");*/
		//System.out.println(projectMember);
		
		int result = projectService.pmAddServ(projectMember);
		//System.out.println("참여인원등록결과 : "+result);
		
		// 세션에 회원정보 가져와서 회원정보 세팅해줘야함.
		return "redirect:/pr/list";
	}
		
	// 프로젝트 상세보기 - 겟요청
	@RequestMapping(value = "pr/detail", method = RequestMethod.GET)
	public String prDetailCtrl(Model model, @RequestParam("prCode") int prCode) {
		//System.out.println("h2 detail~!!");
		//System.out.println("넘어온 프로젝트 코드확인 : "+prCode);
		List<Wbs> wbsList = new ArrayList<Wbs>();
		
		// 프로젝트기본내용, 참여인원정보, 자금상세정보 모두 필요함.
		Project project = new Project();
		Map<String, Object> mmMap = new HashMap<String, Object>();
		
		project = projectService.prDetailServ(prCode);
		int pmCount = projectService.pmCountServ(prCode);
		mmMap = projectService.mmDetailServ(project.getPrMemberCode());
		//System.out.println(mmMap);
		
		//System.out.println("참여인원 카운트값 : "+pmCount);
		
		// WBS내용 조회하기.
		wbsList = wbsService.wbsListServ(prCode);
		//System.out.println(wbsList);
		
		model.addAttribute("mmMap", mmMap);
		model.addAttribute("project", project);
		model.addAttribute("pmCount", pmCount);
		model.addAttribute("wbsList", wbsList);
		
		return "project/pr_detail";
	}
	
	// 프로젝트 수정 - 겟요청
	@RequestMapping(value = "pr/modify", method = RequestMethod.GET)
	public String prModifyCtrl(Model model, @RequestParam("prCode") int prCode) {
		/*System.out.println("h2 modify ctrl~!!");
		System.out.println("넘어온 프로젝트 코드확인 : "+prCode);*/
		List<Wbs> wbsList = new ArrayList<Wbs>();
		
		// 수정 폼으로 연결. 기존 값 깔아줘야됨.
		Map<String, Object> mmMap = new HashMap<String, Object>();
		Project project = new Project();
		
		project = projectService.prDetailServ(prCode);
		int pmCount = projectService.pmCountServ(prCode);
		
		// WBS내용 조회하기.
		wbsList = wbsService.wbsListServ(prCode);
		//System.out.println(wbsList);
		
		//팀장정보셋팅
		mmMap = projectService.mmDetailServ(project.getPrMemberCode());
		
		model.addAttribute("mmMap", mmMap);
		model.addAttribute("project", project);
		model.addAttribute("pmCount", pmCount);
		model.addAttribute("wbsList", wbsList);
		
		return "project/pr_modify";
	}
	
	//프로젝트 수정 - 포스트요청
	@RequestMapping(value = "pr/modify", method = RequestMethod.POST)
	public String prModifyCtrl(Project project) {
		System.out.println("what!!");
		System.out.println(project);
		
		// 수정 처리	
		int result = projectService.prModifyServ(project);
		System.out.println("수정처리 성공여부 : "+result);
		
		return "redirect:/pr/list";
	}
	
	//프로젝트 참여인원 참여승인 여부수정 - 포스트요청(참여거절된 인원들도 관리 하게 되면 로직추가해야함.)
	@RequestMapping(value = "pm/addApproval", method = RequestMethod.POST)
	public String pmModifyCtrl(Model model, ProjectMemberCommand projectMemberCommand) {
		/*System.out.println("pm modify~ POST!!");
		System.out.println(projectMemberCommand);
		[pmCode_=4,5,6,7 , pmApproval_=대기,승인,대기,승인]*/
		
		// 수정 처리 후 최종승인된 인원 총 카운트 수와 해당 프로젝트코드 를 Map으로 리턴받아서 
		// 프로젝트 코드로 다시 해당 프로젝트 조회하여 결과와 카운트를 세팅하고 수정화면으로 포워드한다
		Map<String, Integer> result = new HashMap<String, Integer>();
		result = projectService.pmModifyApprovalServ(projectMemberCommand);
		Project project = new Project();
		
		project = projectService.prDetailServ(result.get("prCode"));
		
		model.addAttribute("pmCount", result.get("pmCount"));
		model.addAttribute("project", project);
		
		return "project/pr_modify";
	}
	
	//프로젝트삭제처리
	@RequestMapping(value = "pr/removePrAll", method = RequestMethod.POST)
	public String prRemoveCtrl(@RequestParam("prCode") int prCode) {
		/*System.out.println("H2 DELETE Ctrl!");
		System.out.println("넘어온 프로젝트 코드 : "+prCode);*/
		
		// 삭제 처리	
		int result = projectService.prRemoveServ(prCode);
		/*System.out.println("삭제처리 결과 : "+result);*/
		
		return "redirect:/pr/list";
	}

}