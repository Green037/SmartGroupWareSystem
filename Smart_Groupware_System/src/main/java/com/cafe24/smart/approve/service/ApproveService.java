package com.cafe24.smart.approve.service;

import java.io.IOException;
import java.util.List;

import com.cafe24.smart.approve.domain.Document;
import com.cafe24.smart.approve.domain.Draft;
import com.cafe24.smart.approve.domain.Progress;
import com.cafe24.smart.approve.domain.TotalFile;
import com.cafe24.smart.approve.domain.TotalInfo;

public interface ApproveService {
	
	//기안 페이지 요청
	List<Document> apAddSelServ();

	//기안 등록
	int apAddServ(Draft draft, Progress progress, TotalInfo totalInfo, TotalFile totalFile);
	
	//총 목록 (대기/반려/완료)
	List<Draft> pgListServ(int apProgress);

	//임시 목록
	List<Draft> temListServ();
	
	//임시 목록 상세보기
	List<Draft> temContServ(int dftCode);

	//결재/반려/완료 페이지 요청
	Draft hvContServ(int dftCode);
	
	//결재 승인/반려 요청
	int apProAddServ(Draft draft, Progress progress, int dftCode);
	
	//문서 양식 등록
	int apDocAddServ(Document document, TotalInfo totalInfo, TotalFile totalFile);
	//문서 양식 목록
	List<Document> docListServ();


}
