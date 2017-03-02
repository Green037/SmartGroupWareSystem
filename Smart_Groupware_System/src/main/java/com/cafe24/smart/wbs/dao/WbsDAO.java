package com.cafe24.smart.wbs.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cafe24.smart.member.domain.Member;

@Repository
public interface WbsDAO {
	List<Member> selectByMmCodeMm(Member member);

}