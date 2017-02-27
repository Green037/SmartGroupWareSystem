package com.cafe24.smart.approve.service;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

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

	//기안 등록 : POST
	@Override
	public int apAddServ(Draft draft, Progress progress) {
		System.out.println("serv Dft>  test1");
		
		// draft.setAprCode(1);
		// apr_code default값 기본 설정 = 아무값없음 비교
		draft.setDftDegree(1);
		draft.setDftFinalState(draft.getDftDegree()+"차미결재대기");
		
		int result = approveDAO.insertDft(draft);
		System.out.println("serv Dft>  test2");	
		
			if(result != 0){
				progress.setDftCode(draft.getDftCode());
				progress.setProTurn(draft.getDftDegree());
				progress.setProPersonState(false);
				progress.setProState("대기");
				
				int resultPg = approveDAO.insertPg(progress);
				// System.out.println("----- serv total Insert> success");
				result = resultPg;
			}else{
				System.out.println("fail");
				// alert 경고 창 뜨기[실패했습니다]
				}
		return result;
	
	}
	
	//결재 진행 목록 :GET
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
		draft = approveDAO.selectContHv(dftCode);
		
		return draft;
	}


	//임시 목록 :GET
	@Override
	public List<Draft> temListServ() {
		System.out.println("serv temList> test1");
		List<Draft> temList= new ArrayList<Draft>();
		temList = approveDAO.SelectAllTem();
		System.out.println("serv temList> test2");
		System.out.println(temList);
		return temList;
	}
	

}
