package com.cafe24.smart.project.service;

import org.springframework.stereotype.Service;

import com.cafe24.smart.project.domain.Funds;
import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.project.domain.ProjectMember;

@Service
public interface ProjectService {
	int prAddServ(ProjectMember projectMember, Project project, Funds funds);

}
