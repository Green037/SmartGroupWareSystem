package com.cafe24.smart.approve.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.cafe24.smart.approve.domain.Approval;
import com.cafe24.smart.approve.domain.Document;
import com.cafe24.smart.approve.domain.Draft;
import com.cafe24.smart.approve.domain.Progress;
import com.cafe24.smart.approve.domain.TotalFile;
import com.cafe24.smart.approve.domain.TotalInfo;
import com.cafe24.smart.member.domain.Department;
import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.member.domain.Position;

public interface ApproveService {
	
	//기안 페이지 요청[1.Document 2.department 3.position]
	List<Document> apAddSelServ();
	List<Department> apAddMmSelServ();
	List<Position> apADDPosSelServ();
	
		// [ajax] 기안 페이지 요청 : 결재선 사원 가져오기
		List<Member> apMmAddServ(Position position, Department department);
		// [ajax] 기안 페이지 결재선 등록 
		int apAprAddServ(Approval approval);
		// [ajax] 결재선 가져오기
		List<Approval> apAprListServ(int mmCode);
		
	//기안 등록
	int apAddServ(Draft draft, Progress progress, String uploadPath);
	
	//총 목록 (대기/반려/완료)
	List<Draft> pgListServ(int apProgress, int mmCode);

	//임시 목록
	List<Draft> temListServ();
	
	//임시 목록 상세보기
	List<Draft> temContServ(int dftCode);
	//임시 목록 문서구분 select가져오기
	String temDocSeleServ(int dftCode);
	

	//결재/반려/완료 페이지 요청
	Draft hvContServ(int dftCode);
	
	//결재 승인/반려 요청
	int apProAddServ(Draft draft, Progress progress, int dftCode);
	
	//문서 양식 등록
	int apDocAddServ(Document document,String uploadPath);
	//문서 양식 목록
	List<Document> docListServ();



	

	

}
