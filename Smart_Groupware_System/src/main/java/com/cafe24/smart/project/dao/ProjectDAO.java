package com.cafe24.smart.project.dao;

import java.util.List;

import com.cafe24.smart.project.domain.Funds;
import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.project.domain.ProjectMember;

public interface ProjectDAO {
	int insertPr(Project project);
	int insertFu(Funds funds);
	int insertPm(ProjectMember projectMember);
	List<Project> selectAllPr();
	List<Project> selectByProgressPr(String progress);
	List<Project> selectByFinishPr(String progress);
	Project selectByPrCodePr(int prCode);
	List<ProjectMember> selectByPrCodePm(int prCode);
}