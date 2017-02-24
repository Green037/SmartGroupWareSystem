package com.cafe24.smart.project.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
	
	//프로젝트 등록. - 세부자금내역, 팀장정보, 플젝정보 등록. 프로젝트 기간별 진행중인지 진행대기인지 파악하여 조건별 인서트.
	@Override
	public int prAddServ(ProjectMember projectMember, Project project, Funds funds) {
	// 현재날짜를 구해서 프로젝트 시작일과 종료일과 비교하여 대기,진행,완료 여부 파악하여 도메인클래스에 세팅한다.
		Date nowDate = new Date();
        
        String s = nowDate.toString();
        //System.out.println("현재날짜 : "+ s);
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //비교를 위해 날짜표현식을 포멧팅한다.
        //System.out.println("현재날짜 : "+ sdf.format(nowDate));
        
        int compare = project.getPrStartDay().compareTo(sdf.format(nowDate)); // 플젝 시작일과 현재날짜를 비교한다. 
        int compareEndDay = project.getPrEndDay().compareTo(sdf.format(nowDate)); // 플젝 종료일과 현재날짜를 비교한다.
        //System.out.println("날짜비교결과 : "+compare+compareEndDay);
     
    // 비교후 리턴값이 -,0,+ 이므로 if문으로 각자 완료체크부분의 값을 세팅한다.
        if(compare > 0 && compareEndDay > 0){ // now < 시작일 < 종료일
        	project.setPrFinishCheck("대기");
        }else if(compare < 0 && compareEndDay > 0){ // 시작일 < now < 종료일
        	project.setPrFinishCheck("진행");
        }else if(compare <= 0 && compareEndDay <= 0){ // 시작일,종료일 <= now 
        	project.setPrFinishCheck("완료");
        }
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

	//프로젝트목록. 조건별분기- 인원모집중,진행중,완료된 목록 조건별 조회
	@Override
	public List<Project> prListServ(int prProgress) {
		List<Project> projectList = new ArrayList<Project>();
		String progress;
		
		// 입력조건별 호출할 메서드를 분기한다. 인원모집중인목록, 진행중인목록, 완료된목록 분기.
		if(prProgress == 1){ //인원모집중
			progress = "모집중";
			projectList = projectDao.selectByProgressPr(progress);
		}else if(prProgress == 2){ //진행중인목록
			progress = "진행";
			projectList = projectDao.selectByFinishPr(progress);
		}else if(prProgress == 3){ //완료된목록
			progress = "완료";
			projectList = projectDao.selectByFinishPr(progress);
		}else{
			projectList = projectDao.selectAllPr(); //전체조회
		}
		
		return projectList;
	}

	//프로젝트 참여신청
	@Override
	public int pmAddServ(ProjectMember projectMember) {
		projectMember.setPmApproval("대기");
		// 추후 사원테이블 연계시 사원정보 가져와서 직급확인하여 사원-초급, 대리-중급, 과장이상급 - 고급 으로 분류 하는 로직추가 해야함.
		// 최초 입력이므로 참여수락여부 대기로 해놓고 승인으로 바뀌면 프로젝트 시작일로 참여일 수정처리로직도 필요함.
		return projectDao.insertPm(projectMember);
	}

	//프로젝트 상세보기
	@Override
	public Project prDetailServ(int prCode) {
		// 프로젝트 조회
		Project project = new Project();
		project = projectDao.selectByPrCodePr(prCode);
		System.out.println(project);
		// 참여인원 조회
		
		// 상세자금 조회
		
		return project;
	}

	// 참여인원 상세보기
	@Override
	public List<ProjectMember> pmListServ(int prCode) {
		List<ProjectMember> pmList = new ArrayList<ProjectMember>();
		
		pmList = projectDao.selectByPrCodePm(prCode);
		System.out.println(pmList);
		return pmList;
	}

	//참여인원 신청된 인원 카운트
	@Override
	public int pmCountServ(int prCode) {
		// TODO Auto-generated method stub
		return projectDao.selectCountPm(prCode);
	}

	// 자금세부내역 보기
	@Override
	public List<Funds> fuListServ(int prCode) {
		// TODO Auto-generated method stub
		return projectDao.selectByPrCodeFu(prCode);
	}

	

}
