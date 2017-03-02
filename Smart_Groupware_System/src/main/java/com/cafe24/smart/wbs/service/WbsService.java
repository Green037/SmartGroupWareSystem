package com.cafe24.smart.wbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.project.domain.Project;

@Service
public interface WbsService {
	int checkMemberServ(Member member);
	List<Project> prListServ(int mmCode);
}
