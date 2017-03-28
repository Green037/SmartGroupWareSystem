package com.cafe24.smart.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
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

import com.cafe24.smart.approve.domain.Document;
import com.cafe24.smart.approve.service.ApproveService;
import com.cafe24.smart.project.domain.Evaluation;
import com.cafe24.smart.project.domain.EvaluationCommand;
import com.cafe24.smart.project.domain.Funds;
import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.project.domain.ProjectEvaluation;
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
	
	@Autowired
	private ApproveService approveService;
	
	//프로젝트 등록 - 폼요청 겟방식
	@RequestMapping(value = "pr/add", method = RequestMethod.GET)
	public String prAddCtrl(Model model, HttpSession session) {
		
		Map<String, Object> mmMap = new HashMap<String, Object>();
		
		// 1.기안문서정보 세팅.
		List<Document> docList = approveService.docListServ(); //기안문서양식 리스트조회 
		
		// 2. 세션의 로그인한 팀장정보 세팅.
		int mmCode = (int)session.getAttribute("mmCode");
		mmMap = projectService.mmDetailServ(mmCode);
		
		log.debug("ProjectController prAddCtrl mmMap : " + mmMap);
		
		// 3. 조회값 세팅하여 view로 포워딩
		model.addAttribute("docList", docList);
		model.addAttribute("mmMap", mmMap);
		
		return "project/pr_addForm";
	}	

	// 프로젝트 등록 포스트요청 - 프로젝트, 자금, 인원 폼 동시 처리.
	@RequestMapping(value = "pr/add", method = RequestMethod.POST)
	public String prAddCtrl(Project project, ProjectMember projectMember, Funds funds) {
		
		log.debug("ProjectController prAddCtrl project : " + project);
		log.debug("ProjectController prAddCtrl projectMember : " + projectMember);
		log.debug("ProjectController prAddCtrl funds : " + funds);
		
		int result = projectService.prAddServ(projectMember, project, funds);
		
		log.debug("ProjectController prAddCtrl result : " + result);
		
		return "redirect:/pr/list";
	}	
	
	//프로젝트 리스트 - 겟요청
	@RequestMapping(value = "pr/list", method = RequestMethod.GET)
	public String prListCtrl(Model model, @RequestParam(value="prProgress", defaultValue="0") int prProgress) {
		
		log.debug("ProjectController prListCtrl prProgress : " + prProgress);
		
		List<Project> projectList = new ArrayList<Project>();
		
		//모든 프로젝트 내용 조회
		projectList = projectService.prListServ(prProgress);
		
		log.debug("ProjectController prListCtrl projectList : " + projectList);
		
		model.addAttribute("projectList", projectList);
		
		return "project/pr_list";
	}
	
	// 프로젝트 참여신청자등록 포스트요청
	@RequestMapping(value = "pr/addPm", method = RequestMethod.POST)
	public String pmAddCtrl(ProjectMember projectMember) {
	
		log.debug("ProjectController pmAddCtrl projectMember : " + projectMember);
		
		int result = projectService.pmAddServ(projectMember);
		
		log.debug("ProjectController pmAddCtrl result : " + result);
		
		// 세션에 회원정보 가져와서 회원정보 세팅해줘야함.
		return "redirect:/pr/list";
	}
		
	// 프로젝트 상세보기 - 겟요청
	@RequestMapping(value = "pr/detail", method = RequestMethod.GET)
	public String prDetailCtrl(Model model, @RequestParam("prCode") int prCode) {
		
		log.debug("ProjectController prDetailCtrl prCode : " + prCode);
		
		List<Wbs> wbsList = new ArrayList<Wbs>();
		
		// 프로젝트기본내용, 참여인원정보, 자금상세정보 모두 필요함.
		Project project = new Project();
		Map<String, Object> mmMap = new HashMap<String, Object>();
		
		project = projectService.prDetailServ(prCode);
		
		int pmCount = projectService.pmCountServ(prCode);
		
		mmMap = projectService.mmDetailServ(project.getPrMemberCode());
		
		log.debug("ProjectController prDetailCtrl project : " + project);
		log.debug("ProjectController prDetailCtrl pmCount : " + pmCount);
		log.debug("ProjectController prDetailCtrl mmMap : " + mmMap);
		
		// WBS내용 조회하기.
		wbsList = wbsService.wbsListServ(prCode);
	
		log.debug("ProjectController prDetailCtrl wbsList : " + wbsList);
		
		model.addAttribute("mmMap", mmMap);
		model.addAttribute("project", project);
		model.addAttribute("pmCount", pmCount);
		model.addAttribute("wbsList", wbsList);
		
		return "project/pr_detail";
	}
	
	// 프로젝트 수정 - 겟요청
	@RequestMapping(value = "pr/modify", method = RequestMethod.GET)
	public String prModifyCtrl(Model model, @RequestParam("prCode") int prCode) {
		
		log.debug("ProjectController prModifyCtrl prCode : " + prCode);
		
		List<Wbs> wbsList = new ArrayList<Wbs>();
		
		// 수정 폼으로 연결. 기존 값 깔아줘야됨.
		Map<String, Object> mmMap = new HashMap<String, Object>();
		Project project = new Project();
		
		project = projectService.prDetailServ(prCode);
		
		log.debug("ProjectController prModifyCtrl project : " + project);
		
		int pmCount = projectService.pmCountServ(prCode);
		
		log.debug("ProjectController prModifyCtrl pmCount : " + pmCount);
		
		// WBS내용 조회하기.
		wbsList = wbsService.wbsListServ(prCode);
		
		log.debug("ProjectController prModifyCtrl wbsList : " + wbsList);
		
		//팀장정보셋팅
		mmMap = projectService.mmDetailServ(project.getPrMemberCode());
		
		log.debug("ProjectController prModifyCtrl mmMap : " + mmMap);
		
		model.addAttribute("mmMap", mmMap);
		model.addAttribute("project", project);
		model.addAttribute("pmCount", pmCount);
		model.addAttribute("wbsList", wbsList);
		
		return "project/pr_modify";
	}
	
	//프로젝트 수정 - 포스트요청
	@RequestMapping(value = "pr/modify", method = RequestMethod.POST)
	public String prModifyCtrl(Project project) {
		
		log.debug("ProjectController prModifyCtrl project : " + project);
		
		// 수정 처리	
		int result = projectService.prModifyServ(project);
		
		log.debug("ProjectController prModifyCtrl result : " + result);
		
		return "redirect:/pr/list";
	}
	
	//프로젝트 참여인원 참여승인 여부수정 - 포스트요청(참여거절된 인원들도 관리 하게 되면 로직추가해야함.)
	@RequestMapping(value = "pm/addApproval", method = RequestMethod.POST)
	public String pmModifyCtrl(Model model, ProjectMemberCommand projectMemberCommand) {
		
		log.debug("ProjectController pmModifyCtrl projectMemberCommand : " + projectMemberCommand);
		
//		[pmCode_=4,5,6,7 , pmApproval_=대기,승인,대기,승인]*/
		
		// 수정 처리 후 최종승인된 인원 총 카운트 수와 해당 프로젝트코드 를 Map으로 리턴받아서 
		// 프로젝트 코드로 다시 해당 프로젝트 조회하여 결과와 카운트를 세팅하고 수정화면으로 포워드한다
		Map<String, Integer> result = new HashMap<String, Integer>();
		Project project = new Project();
		
		result = projectService.pmModifyApprovalServ(projectMemberCommand);
		project = projectService.prDetailServ(result.get("prCode"));
		
		log.debug("ProjectController pmModifyCtrl result : " + result);
		log.debug("ProjectController pmModifyCtrl project : " + project);
				
		model.addAttribute("pmCount", result.get("pmCount"));
		model.addAttribute("project", project);
		
		return "project/pr_modify";
	}
	
	//프로젝트삭제처리
	@RequestMapping(value = "pr/removePrAll", method = RequestMethod.POST)
	public String prRemoveCtrl(@RequestParam("prCode") int prCode) {
		
		log.debug("ProjectController prRemoveCtrl prCode : " + prCode);
		
		// 삭제 처리	
		int result = projectService.prRemoveServ(prCode);
		
		log.debug("ProjectController prRemoveCtrl result : " + result);
		
		return "redirect:/pr/list";
	}
	
	// 프로젝트 검색 - 겟요청(폼연결)
	@RequestMapping(value = "pr/search", method = RequestMethod.GET)
	public String prSearchCtrl(){
		
		return "project/pr_search";
	}
		
	// 평가보고서 등록 - 겟요청(본인프로젝트 조회 및 평가보고서 작성할 폼 선택하는 폼연결.)
	@RequestMapping(value = "ev/add", method = RequestMethod.GET)
	public String evAddCtrl(){
		
		return "project/ev_add";
	}
	
	// 평가보고서 등록 - 겟요청(평가보고서 입력폼연결)
	@RequestMapping(value = "ev/addForm", method = RequestMethod.GET)
	public String evAddFormCtrl(Model model, @RequestParam("prCode") int prCode) {
		
		log.debug("ProjectController evAddFormCtrl prCode : " + prCode);
		
		Map<String, Object> mmMap = new HashMap<String, Object>();
		Project project = new Project();
		List<ProjectMember> pmList = new ArrayList<ProjectMember>();
		
		project = projectService.prDetailServ(prCode); // 프로젝트 상세조회.
		mmMap = projectService.mmDetailServ(project.getPrMemberCode()); //팀장정보		
		pmList = projectService.pmListServ(prCode); //참여인원정보
		
		log.debug("ProjectController evAddFormCtrl project : " + project);
		log.debug("ProjectController evAddFormCtrl mmMap : " + mmMap);
		log.debug("ProjectController evAddFormCtrl pmList : " + pmList);
		
		//view에 뿌려줄 값 세팅.
		model.addAttribute("project", project);
		model.addAttribute("mmMap", mmMap);
		model.addAttribute("pmList", pmList);
		
		return "project/ev_addForm";
	}
	
	// 평가보고서 등록 - 포스트요청(프로젝트보고서, 인원평가보고서 등록)
	@RequestMapping(value = "ev/add", method = RequestMethod.POST)
	public String evAddCtrl(EvaluationCommand evauationCommand, ProjectEvaluation projectEvaluation) {
	
		log.debug("ProjectController evAddCtrl evauationCommand : " + evauationCommand);
		log.debug("ProjectController evAddCtrl projectEvaluation : " + projectEvaluation);
		
		// 두 매개변수 다 받는 서비스 레이어에 매서드를 호출하고
		// 서비스레이어에서 배열분해하고 각자 입력처리. 프로젝트 별도 입력처리.
		int result = projectService.evAddServ(evauationCommand, projectEvaluation);
		
		log.debug("ProjectController evAddCtrl result : " + result);
		
		return "redirect:/ev/add";
	}
	// 평가보고서 목록 - 겟요청(폼연결)
	@RequestMapping(value = "ev/list", method = RequestMethod.GET)
	public String evListCtrl(Model model, @RequestParam(value="prReport", defaultValue="완료") String prReport) {
		
		log.debug("ProjectController evListCtrl prReport : " + prReport);
		
		Map<String, Object> mmMap = new HashMap<String, Object>();
		List<Project> projectList = new ArrayList<Project>();
		
		//완료보고서 "완료"로 되있는 목록만 조회
		projectList = projectService.prListByReportServ(prReport);
		
		log.debug("ProjectController evListCtrl projectList : " + projectList);
		
		//완료목록에 prMemberCode로 팀장명 조회하기
		for(int i=0; i<projectList.size(); i++){
			mmMap = projectService.mmDetailServ(projectList.get(i).getPrMemberCode()); //맴버정보조회.
			
			projectList.get(i).setMmName((String)mmMap.get("mmName"));
			
			log.debug("ProjectController evListCtrl projectList.get(i).getMmName : " + projectList.get(i).getMmName());
		}
		
		model.addAttribute("projectList", projectList);
		
		return "wbs/ev_list";
	}

	//평가보고서 상세보기 - 포스트요청
	@RequestMapping(value = "ev/EvDetail", method = RequestMethod.POST)
	public String evDetailCtrl(Model model, @RequestParam("prCode") int prCode) {
		
		log.debug("ProjectController evDetailCtrl prCode : " + prCode);
		
		Map<String, Object> mmMap = new HashMap<String, Object>();
		Map<String, Object> evMmMap = new HashMap<String, Object>();
		List<Evaluation> evalList = new ArrayList<Evaluation>();
		ProjectEvaluation prEval = new ProjectEvaluation();
		
		//기본프로젝트 정보 조회, 참여인원조회
		Project project = new Project();
		
		project = projectService.prDetailServ(prCode); // 프로젝트 상세조회.
		mmMap = projectService.mmDetailServ(project.getPrMemberCode()); //팀장정보
		
		log.debug("ProjectController evDetailCtrl project : " + project);
		log.debug("ProjectController evDetailCtrl mmMap : " + mmMap);
		
		//pr코드로 ev, prEv조회하여 뷰로 포워딩~
		prEval = projectService.evPrDetailServ(prCode); //프로젝트 평가보고서
		evalList = projectService.evDetailServ(prCode); //플젝 참여인원 보고서
		
		log.debug("ProjectController evDetailCtrl prEval : " + prEval);
		log.debug("ProjectController evDetailCtrl evalList : " + evalList);
		
		// 플젝 참여인원 이름 세팅.
		for(int i=0; i<evalList.size(); i++){
			evMmMap = projectService.mmDetailServ(evalList.get(i).getMmCode());
			
			evalList.get(i).setMmName((String)evMmMap.get("mmName"));
		}
		
		model.addAttribute("project", project);
		model.addAttribute("mmMap", mmMap);
		model.addAttribute("prEval", prEval);
		model.addAttribute("evalList", evalList);
		
		return "project/ev_detail";
	}
}