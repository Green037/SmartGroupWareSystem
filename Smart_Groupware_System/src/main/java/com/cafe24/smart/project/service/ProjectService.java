package com.cafe24.smart.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cafe24.smart.project.domain.Evaluation;
import com.cafe24.smart.project.domain.EvaluationCommand;
import com.cafe24.smart.project.domain.Funds;
import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.project.domain.ProjectEvaluation;
import com.cafe24.smart.project.domain.ProjectMember;
import com.cafe24.smart.project.domain.ProjectMemberCommand;

@Service
public interface ProjectService {
	List<Project> 					prListServ(int prProgress);
	List<Project> 					prSearchServ(Project project, String prSize);
	List<Project> 					prListByReportServ(String prReport);
	List<ProjectMember> 			pmListServ(int prCode);
	List<ProjectMember> 			pmAddListServ(int prCode);
	List<Funds> 					fuListServ(int prCode);
	List<Evaluation> 				evDetailServ(int prCode);

	Project 						prDetailServ(int prCode);
	
	ProjectEvaluation 				evPrDetailServ(int prCode);
	
	Funds 							fuModifyValueServ(int fuCode);
	
	Map<String, Integer> 			pmModifyApprovalServ(ProjectMemberCommand projectMemberCommand);
	Map<String, Object> 			mmDetailServ(int mmCode);
	
	int 							prAddServ(ProjectMember projectMember, Project project, Funds funds);
	int 							pmAddServ(ProjectMember projectMember);
	int 							fuAddServ(Funds funds);
	int 							evAddServ(EvaluationCommand evauationCommand, ProjectEvaluation projectEvaluation);
	
	int 							prRemoveServ(int prCode);
	int 							pmCountServ(int prCode);
	int 							prModifyServ(Project project);
	int 							fuModifyServ(Funds funds);
}