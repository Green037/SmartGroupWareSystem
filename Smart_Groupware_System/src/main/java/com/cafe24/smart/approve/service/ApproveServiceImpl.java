package com.cafe24.smart.approve.service;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.print.attribute.standard.DateTimeAtCompleted;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cafe24.smart.approve.dao.ApproveDAO;
import com.cafe24.smart.approve.domain.Draft;
import com.cafe24.smart.approve.domain.Progress;


@Service
public class ApproveServiceImpl implements ApproveService {
	
	@Autowired
	private ApproveDAO approveDAO;
	
	// 현재 시간 출력
	Date today = new Date (); 
	SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss", Locale.KOREA );
	
	//기안 등록 : POST
	@Override
	public int apAddServ(Draft draft, Progress progress) {
		System.out.println("serv Dft>  test1");
		
		// draft.setAprCode(1);
		// apr_code default값 기본 설정 = 아무값없음 비교
		
		//----- date를 로직에서 따로 처리 : progress 테이블에 입려과 동시에 insert 해주기 위해서
		draft.setDftDate(formatter.format(today));
		draft.setDftDegree(1);
		draft.setDftFinalState(draft.getDftDegree()+"차미결재대기");
		
		int result = approveDAO.insertDft(draft);
		System.out.println("serv Dft>  test2");	
		
			if(result != 0){
				progress.setProTime(draft.getDftDate());
				progress.setDftCode(draft.getDftCode());
				progress.setProTurn(draft.getDftDegree());
				progress.setProPersonState(false);
				progress.setProState(0);
				progress.setProApproval(draft.getDftApproval1());
				
				int resultPg = approveDAO.insertPg(progress);
				// System.out.println("----- serv total Insert> success");
				result = resultPg;
			}else{
				System.out.println("fail");
				// alert 경고 창 뜨기[실패했습니다]
				}
		return result;
	
	}
	
	//[총 결재 목록]진행 목록 :GET
	@Override
	public List<Draft> pgListServ(int apProgress) {
		System.out.println("serv pgList> test1" );
		
		List<Draft> pgList = new ArrayList<Draft>();
		int progress;
		
		System.out.println(apProgress);
		
		if(apProgress == 1){//결재 대기 목록
			progress = 0;
			pgList = approveDAO.selectByHv(progress);
		}else if(apProgress==2){//결재 반려 목록
			progress = 2;
			pgList = approveDAO.selectByHv(progress);
		}else if(apProgress==3){//결재 완료 목록
			progress = 1;
			pgList = approveDAO.selectByHv(progress);
		}else{
			pgList = approveDAO.selectAllPg();
		}
		System.out.println("serv pgList> test2");
		//System.out.println(pgList);
	
		return pgList;
	}
	
	
	//결재 신청[승인/반려] Form
	@Override
	public Draft hvContServ(int dftCode) {
		System.out.println("serv hvCont> test1");
		
		Draft draft = new Draft();
		Progress progress= new Progress();
		
		//-----결재 신청 정보 가져오기 
		draft = approveDAO.selectContHv(dftCode);
			if(draft != null){
				System.out.println("serv hvDetail> test");
				//-----결재자 정보 가져오기 : progress의 pro_approval 컬럼에서 가져온다
				progress = approveDAO.selectDetailHv(dftCode);
				draft.setProApproval(progress.getProApproval());
				
				//각 조건마다 다른 View 
				switch(progress.getProState()){
					case 0 :
					// 대기
						draft.setUrl("/approve/ap_haveContent");
						break;
					case 1 :
					// 승인
						draft.setUrl("/approve/ap_comContent");
						break;
					case 2 :
					//반려
						draft.setUrl("/approve/ap_returnContent");
						break;
					}
			}else{
				System.out.println("fail");
			}
		System.out.println("serv hvCont> test2");
		
		return draft;
	}
	
	
	//결재 요청[승인/반려] *** 중복코드 메소드화 ***
	@Override
	public int apProAddServ(Draft draft, Progress progress, int dftCode) {
		System.out.println("serv proAdd> test1");
		int result = 0;
		int totalCount = 0;
		
		//-----결재자 가져오기
		draft = approveDAO.selectCountHv(dftCode);
		
		//-----결재 시간/결재여부 setting
		progress.setProRealTime(formatter.format(today));
		progress.setProPersonState(true);
		
		if(draft.getDftApproval1() !=0 && draft.getDftApproval2() ==0 && draft.getDftApproval3() ==0){//결재자가 1명일 경우
			totalCount = 1;
			
			if(progress.getProState()==1){//----- 승인
				//----- 승인 progress update
				result = approveDAO.modifyPro(progress);
				
				//----- 승인 : draft update
				//System.out.println("serv proModify 승인> test1");
				draft.setDftFinalState(draft.getDftDegree()+"차결재최종승인");
				result = approveDAO.modifyDft(draft);
				//System.out.println("serv dftModfy 승인> test2");
			
			}else if(progress.getProState()==2){//----- 반려
				//----- 반려 : progress update
				result = approveDAO.modifyPro(progress);
				
				//----- 반려 : daft update
				draft.setDftFinalState(draft.getDftDegree()+"차결재반려");
				result = approveDAO.modifyDft(draft);
				//System.out.println("serv dftModfy 반려> test3");
			}
			
		}else if(draft.getDftApproval1() !=0 && draft.getDftApproval2() !=0 && draft.getDftApproval3() ==0){//결재자가 2명일 경우
			totalCount = 2;
			//----- totalCount와 degree를 비교
			//----- if(degree < totalCount)
			//----- dftFinalState/dftdegree/proApproval update
			System.out.println("2명 결재자 지금 테스트중");
			
			//2-1 진행중인 결재일 경우
			if(draft.getDftDegree() < totalCount){
				//----- 다음 결재를 위해서 미결재로 setting
				progress.setProPersonState(false);
				result = approveDAO.modifyPro(progress);
				
				if(progress.getProState()==1){//----- 승인
					draft.setDftDegree(draft.getDftDegree()+1);
					draft.setDftFinalState(draft.getDftDegree()+"차미결재대기");
					result = approveDAO.modifyDft(draft);
					
					//----- progress에 proTurn에 draft의 dftDegree[+1] UPDATE
					progress.setProTurn(draft.getDftDegree());
					progress.setProState(0);
					//----- progress 다음 결재자 등록
					switch(progress.getProTurn()){
					case 2:
						progress.setProApproval(draft.getDftApproval2());
						break;
					
					case 3:
						progress.setProApproval(draft.getDftApproval3());
						break;
					}
					
					result = approveDAO.modifyProApv(progress);
					
					System.out.println("serv dftModify 2-1_승인> test");
					
				}else if(progress.getProState()==2){//----- 반려
					draft.setDftFinalState(draft.getDftDegree()+"차결재반려");
					result = approveDAO.modifyDft(draft);
					System.out.println("serv dftModfiy 2-2 반려> test");
				}
			
			//2-2 최종 결재일 경우
			}else if(draft.getDftDegree() == totalCount){
				if(progress.getProState()==1){//----- 승인
					//----- 승인 progress update
					result = approveDAO.modifyPro(progress);
					
					//----- 승인 : draft update
					//System.out.println("serv proModify 승인> test1");
					draft.setDftFinalState(draft.getDftDegree()+"차결재최종승인");
					result = approveDAO.modifyDft(draft);
					//System.out.println("serv dftModfy 승인> test2");
				
				}else if(progress.getProState()==2){//----- 반려
					//----- 반려 : progress update
					result = approveDAO.modifyPro(progress);
					
					//----- 반려 : daft update
					draft.setDftFinalState(draft.getDftDegree()+"차결재반려");
					result = approveDAO.modifyDft(draft);
					//System.out.println("serv dftModfy 반려> test3");
				}	
			}
			
		}else if(draft.getDftApproval1() !=0 && draft.getDftApproval2() !=0 && draft.getDftApproval3() !=0){// 결재자가 3명일 경우
			totalCount = 3;
			//totalCount와 degree를 비교 후 최종승인
			//----- if(degree < totalCount)
			//----- dftFinalState update
			System.out.println("3명 결재자 지금 테스트중");
			
			//----- 진행중일 경우
			if(draft.getDftDegree() < totalCount){
				//----- 다음 결재를 위해서 미결재로 setting
				progress.setProPersonState(false);
				result = approveDAO.modifyPro(progress);
				
				if(progress.getProState()==1){//----- 승인
					draft.setDftDegree(draft.getDftDegree()+1);
					draft.setDftFinalState(draft.getDftDegree()+"차미결재대기");
					result = approveDAO.modifyDft(draft);
					
					//----- progress에 proTurn에 draft의 dftDegree[+1] UPDATE
					progress.setProTurn(draft.getDftDegree());
					progress.setProState(0);
					
					//----- progress 다음 결재자 등록
					switch(progress.getProTurn()){
					case 2:
						progress.setProApproval(draft.getDftApproval2());
						break;
					
					case 3:
						progress.setProApproval(draft.getDftApproval3());
						break;
					}
					
					result = approveDAO.modifyProApv(progress);
					
					System.out.println("serv dftModify 3-1_승인> test");
					
				}else if(progress.getProState()==2){//----- 반려
					draft.setDftFinalState(draft.getDftDegree()+"차결재반려");
					result = approveDAO.modifyDft(draft);
					System.out.println("serv dftModfiy 3-2 반려> test");
				}
			
			//----- 최종 결재일 경우
			}else if(draft.getDftDegree() == totalCount){
				if(progress.getProState()==1){//----- 승인
					//----- 승인 progress update
					result = approveDAO.modifyPro(progress);
					
					//----- 승인 : draft update
					//System.out.println("serv proModify 승인> test1");
					draft.setDftFinalState(draft.getDftDegree()+"차결재최종승인");
					result = approveDAO.modifyDft(draft);
					//System.out.println("serv dftModfy 승인> test2");
				
				}else if(progress.getProState()==2){//----- 반려
					//----- 반려 : progress update
					result = approveDAO.modifyPro(progress);
					
					//----- 반려 : daft update
					draft.setDftFinalState(draft.getDftDegree()+"차결재반려");
					result = approveDAO.modifyDft(draft);
					//System.out.println("serv dftModfy 반려> test3");
				}	
			}
		
		}else{
			totalCount = 0;
			System.out.println("serv apProAddServ error> test ");
		}
		
		return result;
	}
		
	
	//임시 목록 :GET
	@Override
	public List<Draft> temListServ() {
		System.out.println("serv temList> test1");
		List<Draft> temList= new ArrayList<Draft>();
		temList = approveDAO.selectAllTem();
		System.out.println("serv temList> test2");
		System.out.println(temList);
		return temList;
	}

	
}
