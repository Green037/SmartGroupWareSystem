package com.cafe24.smart.wbs.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.project.domain.Project;

@Repository
public interface WbsDAO {
	Member selectByMmCodeMm(Member member);
	List<Project> selectByMmCodePr(int mmCode);

}