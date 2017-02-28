package com.cafe24.smart.approve.service;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

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
	
	//진행 목록 :GET
	@Override
	public List<Progress> pgListServ() {
		//System.out.println("serv pgList> test1" );
		List<Progress> pgList = new ArrayList<Progress>();
		pgList = approveDAO.selectAllPg();
		//System.out.println("serv pgList> test2");
		//System.out.println(pgList);
	
		return pgList;
	}
	
	//결재 목록 :GET
	@Override
	public List<Progress> hvListServ() {
		System.out.println("serv hvList> test1" );
		List<Progress> hvList = new ArrayList<Progress>();
		hvList = approveDAO.selectAllhv();
		System.out.println(hvList);
		System.out.println("serv hvList> test2" );
		
		return hvList;
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
				//System.out.println(draft);
			}else{
				System.out.println("fail");
			}
		System.out.println("serv hvCont> test2");
		
		return draft;
	}
	
	//결재 요청[승인/반려]
	@Override
	public int apProAddServ(Draft draft, Progress progress, int dftCode) {
		System.out.println("serv proAdd> test1");
		int result = 0;
		int totalCount = 0;

		/*	draft = dao.조회하는 쿼리;*/

		if(draft.getDftApproval1() !=0 && draft.getDftApproval2() ==0 && draft.getDftApproval3() ==0){
			totalCount = 1;
			//totalCount와 degree를 비교 후 최종승인
			//----- if(degree < totalCount)
			//----- dftFinalState update
			draft.setDftFinalState("최종승인");
			/*draft = dao.조회하는 쿼리;*/
		}else if(draft.getDftApproval1() !=0 && draft.getDftApproval2() !=0 && draft.getDftApproval3() ==0){
			totalCount = 2;
			//totalCount와 degree를 비교
			//----- if(degree < totalCount)
			//----- dftFinalState/dftdegree/proApproval update
			
		}else if(draft.getDftApproval1() !=0 && draft.getDftApproval2() !=0 && draft.getDftApproval3() !=0){
			totalCount = 3;
			//totalCount와 degree를 비교 후 최종승인
			//----- if(degree < totalCount)
			//----- dftFinalState update
		}else{
			totalCount = 0;
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
