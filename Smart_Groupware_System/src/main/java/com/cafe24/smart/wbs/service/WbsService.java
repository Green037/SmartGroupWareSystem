package com.cafe24.smart.wbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.wbs.domain.Wbs;

@Service
public interface WbsService {
	List<Project> 				prListServ(int mmCode);
	List<Wbs> 					wbsListServ(int prCode);
	
	Wbs 						wbsDetailServ(int wbsCode);
	Wbs 						wbsModifyServ(Wbs wbs);
	
	int 						checkMemberServ(Member member);
	
	String 						wbsAddServ(Wbs wbs);	
}