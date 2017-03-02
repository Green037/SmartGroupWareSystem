package com.cafe24.smart.wbs.service;

import org.springframework.stereotype.Service;

import com.cafe24.smart.member.domain.Member;

@Service
public interface WbsService {
	int checkMemberServ(Member member);
}
