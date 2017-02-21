package com.cafe24.smart.member.dao;

import java.util.List;

import com.cafe24.smart.member.domain.Achieve;
import com.cafe24.smart.member.domain.License;

public interface MemberDAO {
//	int insertMm(Member member);
	List<Achieve> selectAc();
	List<License> selectLc();
}