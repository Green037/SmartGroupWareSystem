package com.cafe24.smart.wbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.project.dao.ProjectDAO;
import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.wbs.dao.WbsDAO;
import com.cafe24.smart.wbs.service.WbsService;

@Service
public class WbsServiceImpl implements WbsService {
	
	@Autowired
	private WbsDAO wbsDao;
	
	
	// 입력받은 팀장 코드, 비번 비교하여 일치하는 사원정보 조회.
	@Override
	public int checkMemberServ(Member member) {
		// 1.입력된 사원코드로 사원정보 조회하는 메서드 호출
		String mmPassword = member.getMmPassword();
		System.out.println(mmPassword);
		
		member = wbsDao.selectByMmCodeMm(member);
		System.out.println("사원조회결과"+member);
		
		// 2.조회된 정보중 비밀번호 일치하는 사원정보 확인 로직. 3.일치하는 사원정보의 사원코드리턴.
		int check = 0;
		if(member != null){
			if(member.getMmPassword().equals(mmPassword)){
				return member.getMmCode();
			}else if(member.getMmPassword() != mmPassword){
				check = 10000; //10000은 비번불일치
				System.out.println("비번불일치");
			}
		}else if(member == null){
			check = 0;//0은 아이디불일치
			System.out.println("아이디불일치");
		}
		System.out.println("check값 확인 : "+check);
		return check; 
	}

	//팀장코드로 프로젝트 리스트 조회
	@Override
	public List<Project> prListServ(int mmCode) {
		// TODO Auto-generated method stub
		return wbsDao.selectByMmCodePr(mmCode);
	}

}
