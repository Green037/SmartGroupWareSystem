package com.cafe24.smart.wbs.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.wbs.domain.Wbs;

@Repository
public interface WbsDAO {
	List<Project> 				selectByMmCodePr(int mmCode);
	List<Wbs> 					selectByPrCodeWbs(int prCode);
	
	Member 						selectByMmCodeMm(Member member);
	Wbs 						selectByWbsCodeWbs(int wbsCode);
	
	int 						insertWbs(Wbs wbs);
	int 						updateWbs(Wbs wbs);
}