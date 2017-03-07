package com.cafe24.smart.reward.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cafe24.smart.member.dao.MemberDAO;
import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.reward.dao.RewardDAO;
import com.cafe24.smart.reward.domain.Reward;

@Service
public class RewardServiceImpl implements RewardService {
	private static final Logger log = LoggerFactory.getLogger(RewardServiceImpl.class);
	
	@Autowired
	RewardDAO rewardDAO;
	
	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public List<Reward> reContentServ(int mmCode, String reDate) {
		
		System.out.println("RewardServiceImpl pcReContentServ mmCode : " + mmCode);
		
		return rewardDAO.selectAllRe(mmCode, reDate);
	}

	@Override
	public Member mmContentServ(int mmCode) {
		
		System.out.println("RewardServiceImpl mmContentServ mmCode : " + mmCode);
		
		return memberDAO.selectByMm(mmCode);
	}

	@Override
	public int reAddServ(Reward reward, HttpServletRequest request) {
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		System.out.println("RewardServiceImpl reAddServ iterator : " + iterator);
		
		MultipartFile multipartFile = null;
		
		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			
			if (multipartFile.isEmpty() == false) {
				System.out.println("-------file start------");
				System.out.println("file name : " + multipartFile.getName());
				System.out.println("file fileName : " + multipartFile.getOriginalFilename());
				System.out.println("file size : " + multipartFile.getSize());
				System.out.println("-------file end------");
			}
		}
		
		return rewardDAO.insertRe(reward);
	}

	
}