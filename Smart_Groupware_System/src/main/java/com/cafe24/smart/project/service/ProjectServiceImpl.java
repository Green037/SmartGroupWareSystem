package com.cafe24.smart.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.smart.project.dao.ProjectDAO;
import com.cafe24.smart.project.domain.Funds;
import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.project.domain.ProjectMember;


@Service
public class ProjectServiceImpl implements ProjectService {
	
	@Autowired
	private ProjectDAO projectDao;
	
	@Override
	public int prAddServ(ProjectMember projectMember, Project project, Funds funds) {
		// dao에 각 프로젝트,펀드,인원 테이블에 입력하는 메서드를 선언하고 이곳에서 호출한다.
		int result = projectDao.insertPr(project);
		//System.out.println("프로젝트 입력결과 : "+result);
		//System.out.println("최근입력된 코드값 : "+project.getPrCode());
		
		//자금 입력값 ,부분 구분자로 분리하여 세팅하기
		String[] fuHistory = new String(funds.getFuHistory()).split(",");
		String[] fuExpectedMoney = new String(funds.getFuExpectedMoney()).split(",");
		
		for(int i=0; i< fuHistory.length; i++){
			if(fuHistory[i].equals("") && fuExpectedMoney[i].equals("")){
				//System.out.println("값이 없슴.!");
			}else{
				Funds fund = new Funds();
				fund.setFuHistory(fuHistory[i]);
				fund.setFuExpectedMoney(fuExpectedMoney[i]);
				fund.setPrCode(project.getPrCode());
				//System.out.println(fuHistory[i]+fuExpectedMoney[i]);
				result = projectDao.insertFu(fund);
				//System.out.println("펀드입력결과 : "+result);
			}
		}
		
		projectMember.setPrCode(project.getPrCode());
		result = projectDao.insertPm(projectMember);
		//System.out.println("팀장정보입력확인 : "+ result);
		
		return result;
	}

	

}
