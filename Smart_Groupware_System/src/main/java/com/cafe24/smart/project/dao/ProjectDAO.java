package com.cafe24.smart.project.dao;

import java.util.List;
import java.util.Map;

import com.cafe24.smart.project.domain.Evaluation;
import com.cafe24.smart.project.domain.Funds;
import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.project.domain.ProjectEvaluation;
import com.cafe24.smart.project.domain.ProjectMember;

public interface ProjectDAO {
	List<Project> 						selectAllPr();
	List<Project> 						selectByProgressPr(String progress);
	List<Project> 						selectByFinishPr(String progress);
	List<Project> 						selectByReportPr(String prReport);
	List<Project> 						selectByRequirementPr(Project project);
	List<ProjectMember> 				selectByPrCodePm(int prCode);
	List<Funds> 						selectByPrCodeFu(int prCode);
	List<Evaluation>					selectByPrCodeEv(int prCode);
	
	ProjectEvaluation 					selectByPrCodePrEv(int prCode);
	Project 							selectByPrCodePr(int prCode);
	
	Funds 								selectByFuCode(int fuCode);
	
	Map<String, Object> 				selectByMmCodeMm(int mmCode);
	
	int 								selectCountPm(int prCode);
	int 								selectAllCountPm(int prCode);
	int 								selectCountWbs(int prCode);
	int 								selectCountFu(int prCode);
	
	int 								insertPr(Project project);
	int 								insertFu(Funds funds);
	int 								insertPm(ProjectMember projectMember);
	int 								insertEv(Evaluation evaluation);
	int 								insertEvPr(ProjectEvaluation projectEvaluation);
	
	int 								updatePr(Project project);
	int 								updateApprovalPm(ProjectMember projectMember);
	int 								updateFu(Funds funds);
	
	int 								deletePr(int prCode);
	int 								deletePm(int prCode);
	int 								deleteWbs(int prCode);
	int 								deleteFu(int prCode);
}