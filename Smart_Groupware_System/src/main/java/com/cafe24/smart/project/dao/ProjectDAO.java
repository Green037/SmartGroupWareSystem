package com.cafe24.smart.project.dao;

import java.util.List;

import com.cafe24.smart.project.domain.Funds;
import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.project.domain.ProjectMember;
import com.cafe24.smart.project.domain.ProjectMemberCommand;

public interface ProjectDAO {

	int insertPr(Project project);
	int insertFu(Funds funds);
	int insertPm(ProjectMember projectMember);
	List<Project> selectAllPr();
	List<Project> selectByProgressPr(String progress);
	List<Project> selectByFinishPr(String progress);
	Project selectByPrCodePr(int prCode);
	List<ProjectMember> selectByPrCodePm(int prCode);
	int selectCountPm(int prCode);
	List<Funds> selectByPrCodeFu(int prCode);
	int updatePr(Project project);
	int updateApprovalPm(ProjectMember projectMember);
	Funds selectByFuCode(int fuCode);
	int updateFu(Funds funds);

}