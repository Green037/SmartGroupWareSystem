package com.cafe24.smart.project.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.smart.approve.domain.Draft;
import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.project.dao.ProjectDAO;
import com.cafe24.smart.project.domain.Evaluation;
import com.cafe24.smart.project.domain.EvaluationCommand;
import com.cafe24.smart.project.domain.Funds;
import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.project.domain.ProjectEvaluation;
import com.cafe24.smart.project.domain.ProjectMember;
import com.cafe24.smart.project.domain.ProjectMemberCommand;


@Service
public class ProjectServiceImpl implements ProjectService {
	
	@Autowired
	private ProjectDAO projectDao;
	
	
	// 프로젝트 시작일,종료일과 현재날짜 비교하여 진행상황 체크해주는 메서드
	public Project getFinishCheck(Project project){
		
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
		return project;
	}
	
	//프로젝트 등록. - 세부자금내역, 팀장정보, 플젝정보 등록. 프로젝트 기간별 진행중인지 진행대기인지 파악하여 조건별 인서트.
	@Override
	public int prAddServ(ProjectMember projectMember, Project project, Funds funds) {
		project = getFinishCheck(project);
		
     // dao에 각 프로젝트,펀드,인원 테이블에 입력하는 메서드를 선언하고 이곳에서 호출한다.
		project.setPrReport("미작성"); //첫입력이므로 완료보고서 미작성으로 등록
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
		//최초입력이므로 승인상태 무조건 대기로 입력.
		projectMember.setPmApproval("대기");
		/*System.out.println("입력받은 맴버정보 : "+projectMember);*/
		
		// 사원정보 가져와서 직급확인하여 사원-초급, 대리-중급, 과장이상급 - 고급 으로 분류 하는 로직추가 
		Map<String, Object> mmMap = new HashMap<String, Object>();
		mmMap = projectDao.selectByMmCodeMm(projectMember.getMmCode());
		/*System.out.println(mmMap);*/
		
		if(mmMap.get("ptName").equals("사원")){
			projectMember.setPmLevel("초급");
		}else if(mmMap.get("ptName").equals("대리")){
			projectMember.setPmLevel("중급");
		}else{
			projectMember.setPmLevel("고급");
		}
		/*System.out.println("최종 플젝 참여인원 수정정보 : "+projectMember);*/
		
		return projectDao.insertPm(projectMember);
	}

	//프로젝트 상세보기
	@Override
	public Project prDetailServ(int prCode) {
		// 프로젝트 조회
		Project project = new Project();
		project = projectDao.selectByPrCodePr(prCode);
		//System.out.println(project);
		
		// 참여인원 조회
		
		// 상세자금 조회
		
		return project;
	}

	// 참여인원 상세보기
	@Override
	public List<ProjectMember> pmListServ(int prCode) {
		List<ProjectMember> pmListAll = new ArrayList<ProjectMember>();
		List<ProjectMember> pmListApproval = new ArrayList<ProjectMember>();
		
		pmListAll = projectDao.selectByPrCodePm(prCode);
		// System.out.println(pmListAll);
		for(int i=0; i< pmListAll.size() ; i++){
			if(pmListAll.get(i).getPmApproval().equals("승인")){
				ProjectMember projectMember = new ProjectMember();
				projectMember.setPmLevel(pmListAll.get(i).getPmLevel());
				projectMember.setMmCode(pmListAll.get(i).getMmCode());
				projectMember.setPmNote(pmListAll.get(i).getPmNote());
				projectMember.setPmCode(pmListAll.get(i).getPmCode());
				projectMember.setMmName(pmListAll.get(i).getMmName());
				pmListApproval.add(projectMember);
				// System.out.println("승인자확인 : "+pmListApproval);
			}
		}
		return pmListApproval;
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

	// 프로젝트수정
	@Override
	public int prModifyServ(Project project) {
		// 현재날짜와 프로젝트 기간 비교후 진행,대기,완료 파악해서 세팅하는 메서드 getFinishCheck()호출
		project = getFinishCheck(project);
		
		return projectDao.updatePr(project);
	}

	// 참여인원 신청자 조회 -대기중인 목록만 조회
	@Override
	public List<ProjectMember> pmAddListServ(int prCode) {
		List<ProjectMember> pmListAll = new ArrayList<ProjectMember>();
		List<ProjectMember> pmListDisApproval = new ArrayList<ProjectMember>();
		
		pmListAll = projectDao.selectByPrCodePm(prCode);
		// System.out.println(pmListAll);
		for(int i=0; i< pmListAll.size() ; i++){
			if(pmListAll.get(i).getPmApproval() != null){
				if(!pmListAll.get(i).getPmApproval().equals("승인")){
					ProjectMember projectMember = new ProjectMember();
					projectMember.setPmLevel(pmListAll.get(i).getPmLevel());
					projectMember.setMmCode(pmListAll.get(i).getMmCode());
					projectMember.setPmNote(pmListAll.get(i).getPmNote());
					projectMember.setPmCode(pmListAll.get(i).getPmCode());
					projectMember.setPrCode(pmListAll.get(i).getPrCode());
					pmListDisApproval.add(projectMember);
					// System.out.println("대기자확인 : "+pmListApproval);
				}
			}
			
		}
		return pmListDisApproval;
	}

	// 참여신청한 인원중 승인된 인원 추려서 데이터 수정처리.
	@Override
	public Map<String, Integer> pmModifyApprovalServ(ProjectMemberCommand projectMemberCommand) {
		Map<String, Integer> pmModifyResult = new HashMap<String,Integer>();
		
		// 팝업창에서 변경된 참여인원의 코드와 승인여부를 split()를 사용하여 구분자를 지우고 배열형태로 분리한다.
		String[] pmCodes = new String(projectMemberCommand.getPmCode_()).split(",");
		String[] pmApprovals = new String(projectMemberCommand.getPmApproval_()).split(",");
		String[] prCodes = new String(projectMemberCommand.getPrCode_()).split(",");
		
		//반복문으로 분리한 배열값들중 승인여부가 "승인"으로 변경된 데이터만 추려서 수정처리한다.
		for(int i=0; i< pmCodes.length; i++){
			if(pmApprovals[i].equals("승인")){
				/*System.out.println(Integer.parseInt(pmCodes[i]));
				System.out.println(pmApprovals[i]);*/
				
				ProjectMember projectMember = new ProjectMember();
				projectMember.setPmCode(Integer.parseInt(pmCodes[i]));
				projectMember.setPmApproval(pmApprovals[i]);
				
				//승인으로 변경된 인원은 쿼리문에 현재날짜를 프로젝트 참여일로 입력해준다.
				int result = projectDao.updateApprovalPm(projectMember);
				//System.out.println("참여인원 승인처리 결과 : "+result);
			}
		}
		// 수정처리가 끝나면 프로젝트에 참여로 되어있는 인원의 총 카운트와 프로젝트코드를 구하여 리턴해준다.
		int pmCount = projectDao.selectCountPm(Integer.parseInt(prCodes[0]));
		/*System.out.println("조회하는 프로젝트 넘버 : "+Integer.parseInt(prCodes[0]));
		System.out.println("승인된 인원 총 카운트수 : "+pmCount);*/
		
		pmModifyResult.put("pmCount", pmCount);
		pmModifyResult.put("prCode", Integer.parseInt(prCodes[0]));
		
		return pmModifyResult;
	}

	//자금상세내역 조회
	@Override
	public Funds fuModifyValueServ(int fuCode) {
		// TODO Auto-generated method stub
		return projectDao.selectByFuCode(fuCode);
	}

	//자금내역 수정.
	@Override
	public int fuModifyServ(Funds funds) {
		// 입력값중 예상금액 값으로 "예상금액/총금액"형태로 넘어오므로 뒤에 "/총금액"을 버리도록한다.
		String[] expectedMoney = new String(funds.getFuExpectedMoney()).split("/");
		funds.setFuExpectedMoney(expectedMoney[0]);
		return projectDao.updateFu(funds);
	}

	//자금내역 입력.
	@Override
	public int fuAddServ(Funds funds) {
		// TODO Auto-generated method stub
		return projectDao.insertFu(funds);
	}

	//팀장정보조회
	@Override
	public Map<String, Object> mmDetailServ(int mmCode) {
		// TODO Auto-generated method stub
		return projectDao.selectByMmCodeMm(mmCode);
	}

	//프로젝트삭제 - 프로젝트,참여인원,WBS다 삭제해야함.
	@Override
	public int prRemoveServ(int prCode) {
		// 프로젝트를 삭제한다.
		int result = projectDao.deletePr(prCode);
		System.out.println("삭제결과 : "+result);
		
		if(result == 1){ //성공시 참여인원, WBS코드, 자금상세내역이 있다면 다 삭제한다.
			int pmCount = projectDao.selectAllCountPm(prCode);
			int fundsCount = projectDao.selectCountFu(prCode);
			int wbsCount = projectDao.selectCountWbs(prCode);
			/*System.out.println("(카운트확인)프로젝트 참여인원 카운트 : "+pmCount);
			System.out.println("(카운트확인)프로젝트 자금상세내역 카운트 : "+fundsCount);
			System.out.println("(카운트확인)프로젝트 WBS 카운트 : "+wbsCount);*/
			
			if(pmCount != 0){  // 1.참여인원 입력값이 있다면 삭제처리
				int pmResult = projectDao.deletePm(prCode);
				System.out.println("참여인원 삭제결과 : "+pmResult);
			}
			if(fundsCount != 0){  // 2.자금상세내역 입력값이 있다면 삭제처리
				int fuResult = projectDao.deleteFu(prCode);
				System.out.println("자금상세내역 삭제결과 : "+fuResult);
			}
			if(wbsCount != 0){  // 3.WBS 입력값이 있다면 삭제처리
				int wbsResult = projectDao.deleteWbs(prCode);
				System.out.println("WBS 삭제결과 : "+wbsResult);
			}
		}
		return result;
	}

	//프로젝트검색
	@Override
	public List<Project> prSearchServ(Project project, String prSize) {
		// prSize 소중대 별로 규모 확인 소-인원4명이하 중- 5~10 대- 11이상 구분하여 다시 셋팅.
		if(prSize.equals("소")){
			project.setPrMember(3);
		}else if(prSize.equals("중")){
			project.setPrMember(10);
		}else if(prSize.equals("대")){
			project.setPrMember(12);
		}else if(prSize.equals("::선택::")){
			project.setPrMember(0);
		}
		// 입력값 null여부는 쿼리로 해결하고 처리한다. 입력값이 하나도 없다면 전체조회.
		
		return projectDao.selectByRequirementPr(project);
	}

	//평가보고서 등록
	@Override
	public int evAddServ(EvaluationCommand evauationCommand, ProjectEvaluation projectEvaluation) {
		// 1.프로젝트 보고서의 프로젝트 코드를 변수에 세팅한다.
		int prCode = projectEvaluation.getPrCode();
		System.out.println("서비스레이어 prCode 값 확인 : "+prCode);
		
		// 2.프로젝트 보고서 입력처리하는 매서드 호출.
		projectEvaluation.setPrApprovalCheck("미신청"); //최초입력이므로 일단 전자결제 승인체크는 미신청으로 세팅함.
		int prEvResult = projectDao.insertEvPr(projectEvaluation);
		System.out.println("플젝 보고서 입력확인 : "+prEvResult);
		
		if(prEvResult == 1){ // 입력 성공했으면 프로젝트테이블에 완료보고서 작성컬럼 완료로 업데이트.
			Project project = new Project();
			project.setPrCode(projectEvaluation.getPrCode());
			project.setPrReport("완료");
		
			// 업데이트하는 메서드 호출
			int updatePrResult = projectDao.updatePr(project);
			System.out.println("완료보고서 등록 프로젝트 테이블 수정여부 확인 : "+updatePrResult);
		}
		
		// 3.인원 평가보고서 데이터 분해하여 배열로 세팅하고 for문 안에서 한세트씩 입력처리.
		String[] evIntegritys = new String(evauationCommand.getEvIntegritys()).split(",");
		String[] evProfessionals = new String(evauationCommand.getEvProfessionals()).split(",");
		String[] evSociabilitys = new String(evauationCommand.getEvSociabilitys()).split(",");
		String[] evEvals = new String(evauationCommand.getEvEvals()).split(",");
		String[] mmCodes = new String(evauationCommand.getMmCodes()).split(",");
		String[] evTotalScores = new String(evauationCommand.getEvTotalScores()).split(",");
		
		for(int i=0; i<mmCodes.length; i++){
			Evaluation evaluation = new Evaluation();
			evaluation.setMmCode(Integer.parseInt(mmCodes[i]));
			evaluation.setEvIntegrity(Integer.parseInt(evIntegritys[i]));
			evaluation.setEvProfessional(Integer.parseInt(evProfessionals[i]));
			evaluation.setEvSociability(Integer.parseInt(evSociabilitys[i]));
			evaluation.setEvEval(evEvals[i]);
			evaluation.setEvTotalScore(Integer.parseInt(evTotalScores[i]));
			evaluation.setPrCode(prCode);
			
			int result = projectDao.insertEv(evaluation);
			System.out.println("인원평가 입력확인"+i+" : "+result);
		}
		return prEvResult;
	}

	// 완료보고서 등록된 프로젝트만 조회
	@Override
	public List<Project> prListByReportServ(String prReport) {
		// TODO Auto-generated method stub
		return projectDao.selectByReportPr(prReport);
	}

	// 플젝 참여인원들 평가보고서 조회
	@Override
	public List<Evaluation> evDetailServ(int prCode) {
		// TODO Auto-generated method stub
		return projectDao.selectByPrCodeEv(prCode);
	}

	// 플젝 평가보고서 조회
	@Override
	public ProjectEvaluation evPrDetailServ(int prCode) {
		// TODO Auto-generated method stub
		return projectDao.selectByPrCodePrEv(prCode);
	}
	
}
