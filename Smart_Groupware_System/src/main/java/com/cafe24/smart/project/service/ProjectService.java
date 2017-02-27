package com.cafe24.smart.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cafe24.smart.project.domain.Funds;
import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.project.domain.ProjectMember;
import com.cafe24.smart.project.domain.ProjectMemberCommand;

@Service
public interface ProjectService {
	int prAddServ(ProjectMember projectMember, Project project, Funds funds);
	List<Project> prListServ(int prProgress);
	int pmAddServ(ProjectMember projectMember);
	Project prDetailServ(int prCode);
	List<ProjectMember> pmListServ(int prCode);
	int pmCountServ(int prCode);
	List<Funds> fuListServ(int prCode);
	int prModifyServ(Project project);
	public List<ProjectMember> pmAddListServ(int prCode);
	Map<String, Integer> pmModifyApprovalServ(ProjectMemberCommand projectMemberCommand);
}
