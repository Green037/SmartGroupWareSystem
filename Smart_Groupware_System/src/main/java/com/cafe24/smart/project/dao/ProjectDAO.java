package com.cafe24.smart.project.dao;

import java.util.List;
import java.util.Map;

import com.cafe24.smart.member.domain.Member;
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
	Map<String, Object> selectByMmCodeMm(int mmCode);
	int deletePr(int prCode);
	int selectAllCountPm(int prCode);
	int selectCountWbs(int prCode);
	int selectCountFu(int prCode);
	int deletePm(int prCode);
	int deleteWbs(int prCode);
	int deleteFu(int prCode);
	List<Project> selectByRequirementPr(Project project);

}