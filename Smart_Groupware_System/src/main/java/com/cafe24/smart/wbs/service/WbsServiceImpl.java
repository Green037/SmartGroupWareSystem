package com.cafe24.smart.wbs.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.util.UtilDate;
import com.cafe24.smart.wbs.dao.WbsDAO;
import com.cafe24.smart.wbs.domain.Wbs;
import com.cafe24.smart.wbs.service.WbsService;

@Service
public class WbsServiceImpl implements WbsService {
	
	private static final Logger log = LoggerFactory.getLogger(WbsServiceImpl.class);
	
	@Autowired
	private WbsDAO wbsDao;
	
	//날짜 차이 구하는 메서드.
	public int diffOfDate(String startDay, String endDay) throws Exception {
		
		log.debug("WbsServiceImpl diffOfDate startDay : " + startDay);
		log.debug("WbsServiceImpl diffOfDate endDay : " + endDay);
		
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
	 
	    Date beginDate = formatter.parse(startDay);
	    Date endDate = formatter.parse(endDay);
	 
	    long different = endDate.getTime() - beginDate.getTime();
	    long differentDays = different / (24 * 60 * 60 * 1000);
	   
	    log.debug("WbsServiceImpl diffOfDate differentDays : " + differentDays);
	    
	    return (int) differentDays;
	}
	
	// 입력받은 팀장 코드, 비번 비교하여 일치하는 사원정보 조회.
	@Override
	public int checkMemberServ(Member member) {
		
		log.debug("WbsServiceImpl checkMemberServ member : " + member);
		
		// 1.입력된 사원코드로 사원정보 조회하는 메서드 호출
		String mmPassword = member.getMmPassword();
		
		log.debug("WbsServiceImpl checkMemberServ mmPassword : " + mmPassword);
		
		member = wbsDao.selectByMmCodeMm(member);
		
		log.debug("WbsServiceImpl checkMemberServ member : " + member);		
		
		// 2.조회된 정보중 비밀번호 일치하는 사원정보 확인 로직. 3.일치하는 사원정보의 사원코드리턴.
		int check = 0;
		
		if (member != null) {
			if (member.getMmPassword().equals(mmPassword)) {
				
				return member.getMmCode();
			} else if(member.getMmPassword() != mmPassword) {
				//10000은 비번불일치
				check = 10000; 
			}
		} else if (member == null) {
			//0은 아이디불일치
			check = 0;
		}
		
		log.debug("WbsServiceImpl checkMemberServ check : " + check);	
		
		return check; 
	}

	//팀장코드로 프로젝트 리스트 조회
	@Override
	public List<Project> prListServ(int mmCode) {
		
		log.debug("WbsServiceImpl prListServ mmCode : " + mmCode);	
		
		return wbsDao.selectByMmCodePr(mmCode);
	}

	//wbs 입력
	@Override
	public String wbsAddServ(Wbs wbs) {
		
		log.debug("WbsServiceImpl wbsAddServ wbs : " + wbs);		
		
		// prCode제외하고 다 중복값 입력이므로 뽀개서 각 세팅하고
		// 한번씩 입력처리 계속 해주는 로직을 만든다.
		String check = "성공";
		// 1.프로젝트 코드는 모든 입력값에 동일 하므로 일단 따로 변수 만들어서 값을 넣어준다.
		int prCode = wbs.getPrCode();
		
		// 2. 중복값 뽀개기
		String[] wbsCates = new String(wbs.getWbsCate()).split(",");
		String[] wbsName = new String(wbs.getWbsName()).split(",");
		String[] wbsContents = new String(wbs.getWbsContents()).split(",");
		String[] wbsStartDate = new String(wbs.getWbsStartDate()).split(",");
		String[] wbsEndDate = new String(wbs.getWbsEndDate()).split(",");
		String[] wbsProgress = new String(wbs.getWbsProgresses()).split(",");
		String[] wbsStatus = new String(wbs.getWbsStatus()).split(",");
		
		ArrayList<Integer> resultList = new ArrayList<Integer>();
		UtilDate date = new UtilDate(); //날짜관련 연산하는 유틸클래스
		
		for (int i = 0; i < wbsCates.length; i++) {
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
			wbs.setWbsWorkingDays(date.getMinusDate(wbsStartDate[i],wbsEndDate[i]));
			
			// 4.입력하는 메서드 호출
			resultList.add(wbsDao.insertWbs(wbs)); 
			
			log.debug("WbsServiceImpl wbsAddServ resultList : " + resultList.get(i));	
		}
		
		// 성공여부 "성공","실패"로 리턴한다.
		for (int j = 0; j < resultList.size(); j++) {
			if (resultList.get(j) == 0) {
				check = "실패";
				
				return check;
			}
		}
		
		log.debug("WbsServiceImpl wbsAddServ check : " + check);	
		
		return check;
	}
	
	//prCode 사용하여 wbs전체 목록 조회
	@Override
	public List<Wbs> wbsListServ(int prCode) {
		
		log.debug("WbsServiceImpl wbsListServ prCode : " + prCode);	
		
		return wbsDao.selectByPrCodeWbs(prCode);
	}
	
	//wbsCode사용하여 해당 데이터 조회
	@Override
	public Wbs wbsDetailServ(int wbsCode) {
		
		log.debug("WbsServiceImpl wbsDetailServ wbsCode : " + wbsCode);	
		
		return wbsDao.selectByWbsCodeWbs(wbsCode);
	}
	
	// 수정처리후 성공하면 수정된 wbs정보를 조회해온다.
	@Override
	public Wbs wbsModifyServ(Wbs wbs) {
		
		log.debug("WbsServiceImpl wbsModifyServ wbs : " + wbs);	
		
		// 시작 종료일 날짜차이를 구하고 세팅하고 진행률 100프로면 완료로 세팅해준다.
		UtilDate utilDate = new UtilDate();
		
		Long wbsWorkingDays = utilDate.getMinusDate(wbs.getWbsStartDate(), wbs.getWbsEndDate());
		
		log.debug("WbsServiceImpl wbsModifyServ wbsWorkingDays : " + wbsWorkingDays);	
		
		wbs.setWbsWorkingDays(wbsWorkingDays);
		
		if (wbs.getWbsProgress() == 100) {
			wbs.setWbsStatus("완료");
		} else {
			wbs.setWbsStatus("진행중");
		}
		
		log.debug("WbsServiceImpl wbsModifyServ getWbsStatus : " + wbs.getWbsStatus());	
		
		//수정 성공시 수정된 내용을 리턴하기
		int result = wbsDao.updateWbs(wbs);
		
		log.debug("WbsServiceImpl wbsModifyServ result : " + result);	
		
		if (result == 1) {
			return wbs;
		} else {
			return null;
		}
	}
}