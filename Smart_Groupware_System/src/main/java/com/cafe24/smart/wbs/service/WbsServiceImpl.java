package com.cafe24.smart.wbs.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.project.dao.ProjectDAO;
import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.wbs.dao.WbsDAO;
import com.cafe24.smart.wbs.domain.Wbs;
import com.cafe24.smart.wbs.service.WbsService;

@Service
public class WbsServiceImpl implements WbsService {
	
	@Autowired
	private WbsDAO wbsDao;
	
	//날짜 차이 구하는 메서드.
	public int diffOfDate(String startDay, String endDay) throws Exception
	  {
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
	 
	    Date beginDate = formatter.parse(startDay);
	    Date endDate = formatter.parse(endDay);
	 
	    long different = endDate.getTime() - beginDate.getTime();
	    long differentDays = different / (24 * 60 * 60 * 1000);
	    System.out.println("날짜차이는 : "+differentDays);
	    
	    int differentDay= (int)differentDays;
	    System.out.println("날짜차이는 : "+differentDay);
	    
	    return differentDay;
	  }
	// 입력받은 팀장 코드, 비번 비교하여 일치하는 사원정보 조회.
	@Override
	public int checkMemberServ(Member member) {
		// 1.입력된 사원코드로 사원정보 조회하는 메서드 호출
		String mmPassword = member.getMmPassword();
		//System.out.println(mmPassword);
		
		member = wbsDao.selectByMmCodeMm(member);
		//System.out.println("사원조회결과"+member);
		
		// 2.조회된 정보중 비밀번호 일치하는 사원정보 확인 로직. 3.일치하는 사원정보의 사원코드리턴.
		int check = 0;
		if(member != null){
			if(member.getMmPassword().equals(mmPassword)){
				return member.getMmCode();
			}else if(member.getMmPassword() != mmPassword){
				check = 10000; //10000은 비번불일치
				//System.out.println("비번불일치");
			}
		}else if(member == null){
			check = 0;//0은 아이디불일치
			//System.out.println("아이디불일치");
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

	//wbs 입력
	@Override
	public String wbsAddServ(Wbs wbs) {
	// prCode제외하고 다 중복값 입력이므로 뽀개서 각 세팅하고 한번씩 입력처리 계속 해주는 로직을 만든다.
		String check = "성공";
		//1.프로젝트 코드는 모든 입력값에 동일 하므로 일단 따로 변수 만들어서 값을 넣어준다.
		int prCode = wbs.getPrCode();
		
		//2. 중복값 뽀개기
		String[] wbsCates = new String(wbs.getWbsCate()).split(",");
		String[] wbsName = new String(wbs.getWbsName()).split(",");
		String[] wbsContents = new String(wbs.getWbsContents()).split(",");
		String[] wbsStartDate = new String(wbs.getWbsStartDate()).split(",");
		String[] wbsEndDate = new String(wbs.getWbsEndDate()).split(",");
		String[] wbsProgress = new String(wbs.getWbsProgresses()).split(",");
		String[] wbsStatus = new String(wbs.getWbsStatus()).split(",");
		
		ArrayList<Integer> resultList =new ArrayList<Integer>();
		for(int i=0; i<wbsCates.length; i++){
			wbs = new Wbs();
		// 3.세트별 값세팅.
			wbs.setPrCode(prCode);
			wbs.setWbsCate(wbsCates[i]);
			wbs.setWbsName(wbsName[i]);
			wbs.setWbsContents(wbsContents[i]);
			wbs.setWbsStartDate(wbsStartDate[i]);
			wbs.setWbsEndDate(wbsEndDate[i]);
			wbs.setWbsProgress(Integer.parseInt(wbsProgress[i]));
			wbs.setWbsStatus(wbsStatus[i]);
			try { // 종료일, 시작일 연산하여 날짜 차이를 구하는 메서드 diffOfDate 
				wbs.setWbsWorkingDays(diffOfDate(wbsStartDate[i],wbsEndDate[i]));
			} catch (Exception e) {
				e.printStackTrace();
			}
		// 4.입력하는 메서드 호출
			resultList.add(wbsDao.insertWbs(wbs)); 
			System.out.println(i+"번째 입력확인 : "+ resultList.get(i));
		}
		
		// 성공여부 "성공","실패"로 리턴한다.
		for(int j=0; j<resultList.size(); j++){
			if(resultList.get(j) == 0){
				check = "실패";
				return check;
			}
		}
		return check;
	}
	
	//prCode 사용하여 wbs전체 목록 조회
	@Override
	public List<Wbs> wbsListServ(int prCode) {
		// TODO Auto-generated method stub
		return wbsDao.selectByPrCodeWbs(prCode);
	}
	
	//wbsCode사용하여 해당 데이터 조회
	@Override
	public Wbs wbsDetailServ(int wbsCode) {
		// TODO Auto-generated method stub
		return wbsDao.selectByWbsCodeWbs(wbsCode);
	}

}
