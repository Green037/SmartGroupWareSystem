package com.cafe24.smart.approve.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.metadata.GenericTableMetaDataProvider;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.smart.approve.dao.ApproveDAO;
import com.cafe24.smart.approve.domain.Approval;
import com.cafe24.smart.approve.domain.Document;
import com.cafe24.smart.approve.domain.Draft;
import com.cafe24.smart.approve.domain.Progress;
import com.cafe24.smart.approve.domain.TotalFile;
import com.cafe24.smart.approve.domain.TotalInfo;
import com.cafe24.smart.member.domain.Department;
import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.member.domain.Position;
import com.cafe24.smart.util.UtilFile;

@Service
public class ApproveServiceImpl implements ApproveService {
	
	@Autowired
	private ApproveDAO approveDAO;
	
	// ----- 메소드 : 현재 시간 출력
	Date today = new Date (); 
	SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss", Locale.KOREA );
	
	
	//기안 요청 : GET ---- DOCUMENT
	@Override
	public List<Document> apAddSelServ() {
		//System.out.println("serv temContent> test1");
		List<Document> doc = new ArrayList<Document>();
		doc = approveDAO.selectAllDoc();
		
		//System.out.println("serv temContent> test2");
	
		return doc;
	}

	//기안 요청 : GET ---- Department
	@Override
	public List<Department> apAddMmSelServ() {
		//System.out.println("serv apAddMmSelServ> test1");
		return approveDAO.selectAllApDep();
	}
	
	//기안 요청 : GET ---- POSITION
	@Override
	public List<Position> apADDPosSelServ() {
		//System.out.println("serv apADDPosSelServ> test1");
		return approveDAO.selectAllApPos();
	}
	
	// --- AJAX 기안 요청 : GET 
	@Override
	public List<Member> apMmAddServ(Position position, Department department) {

		Map<String,Integer> map = new HashMap<String,Integer>();
		
		map.put("dpCode", department.getDpCode());
		map.put("ptCode", position.getPtCode());
		
		return approveDAO.selectByApMm(map);
	}
	
	// --- AJAX 결재라인 등록 : POST
	@Override
	public int apAprAddServ(Approval approval) {
		System.out.println("ajax 넘어오니1");
		return approveDAO.insertApr(approval);
	}
	
	// --- ajax 결재라인 가져오기 : POST
	@Override
	public List<Approval> apAprListServ(int mmCode) {
		
		List<Approval> apr = new ArrayList<Approval>();
		apr = approveDAO.selectAllApr(mmCode);
		System.out.println(apr);
		
		return apr;
	}



 	
	
	//기안 등록 : POST
	@Override
	public int apAddServ(Draft draft, Progress progress, String uploadPath){
		System.out.println("serv Dft>  test1");
		
		UtilFile utilFile = new UtilFile();
		
//		System.out.println(uploadPath.lastIndexOf("/"));
//		System.out.println(uploadPath.substring(127));
//		System.out.println(draft.getDftFileOri());
		
		draft.setDftFileOri(uploadPath.substring(uploadPath.lastIndexOf("/")));
		draft.setDftFilePath(uploadPath);
		draft.setAprCode(0);
		draft.setDftDegree(1);
		draft.setDftDate(formatter.format(today));
		draft.setDftFinalState(draft.getDftDegree()+"차미결재대기");
		
		int result = approveDAO.insertDft(draft);
		System.out.println("serv Dft> test2");	
		
		// apr_code default값 기본 설정 = 아무값없음 비교

			if(result != 0){				
				progress.setProTime(draft.getDftDate());
				progress.setDftCode(draft.getDftCode());
				progress.setProTurn(draft.getDftDegree());
				progress.setProPersonState(false);
				progress.setProState(0);
				progress.setProApproval(draft.getAprApproval1());
				
				int resultPg = approveDAO.insertPg(progress);
				// System.out.println("----- serv total Insert> success");
				result = resultPg;
			}else{
			System.out.println("fail");
				// alert 경고 창 뜨기[실패했습니다]
				}
		
		return result;
	
	}
	

	//[총 결재 목록]진행 목록 :GET ---- ######수정######
	@Override
	public List<Draft> pgListServ(int apProgress, int mmCode) {
		System.out.println("serv pgList> test1" );
		
		//전체 리스트
		List<Draft> pgList = new ArrayList<Draft>();
		//조건별 리스트 목록
		Map<String, Integer> map = new HashMap<String, Integer>();
				
		int progress;
		
		//System.out.println(apProgress);
		
		if(apProgress == 1){//결재 대기 목록
			progress = 0;
			map.put("progress", progress);
			map.put("mmCode",mmCode);
			pgList = approveDAO.selectByHv(map);
			
		}else if(apProgress==2){//결재 반려 목록
			progress = 2;
			map.put("progress", progress);
			map.put("mmCode",mmCode);
			pgList = approveDAO.selectByHv(map);
			
		}else if(apProgress==3){//결재 완료 목록
			progress = 1;
			map.put("progress", progress);
			map.put("mmCode",mmCode);
			pgList = approveDAO.selectByHv(map);
			
		}else{
			pgList = approveDAO.selectAllPg(mmCode);
			
			for(int i=0; i<pgList.size(); i++){
				String mmName = approveDAO.selectDetailMm(pgList.get(i).getMmCode());
				String pMmName = approveDAO.selectDetailPMn(pgList.get(i).getProApproval());
				
				pgList.get(i).setMmName(mmName);
				pgList.get(i).setpMmName(pMmName);
			}
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
/*		draft = approveDAO.selectContHv(dftCode);*/
		
		draft = approveDAO.selectContHv(dftCode);

		
		System.out.println(draft);
		
			if(draft != null){
				System.out.println("serv hvDetail> test");
				//-----결재자 정보 가져오기 : progress의 pro_approval 컬럼에서 가져온다
				progress = approveDAO.selectDetailHv(dftCode);
				
				draft.setProApproval(progress.getProApproval());
				draft.setProReason(progress.getProReason());
				
				String mmName = approveDAO.selectDetailMm(draft.getMmCode());
				String dpName = approveDAO.selectDetailDp(draft.getMmCode());
				String ptName = approveDAO.selectDetailPt(draft.getMmCode());
				String pMmName = approveDAO.selectDetailPMn(progress.getProApproval());
				String pDpName = approveDAO.selectDetailPDp(progress.getProApproval());
				String pPtName = approveDAO.selectDetailPPt(progress.getProApproval());
				
				draft.setMmName(mmName);
				draft.setDpName(dpName);
				draft.setPtName(ptName);
				draft.setProApprovalName(pMmName);
				draft.setpDpName(pDpName);
				draft.setpPtName(pPtName);
					
//				System.out.println("이름가져오기:"+pMmName);
//				System.out.println("부서가져오기:"+pDpName);
//				System.out.println("직급가져오기:"+pPtName);
//				
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
		
		if(draft.getAprApproval1() !=0 && draft.getAprApproval2() ==0 && draft.getAprApproval3() ==0){//결재자가 1명일 경우
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
			
		}else if(draft.getAprApproval1() !=0 && draft.getAprApproval2() !=0 && draft.getAprApproval3() ==0){//결재자가 2명일 경우
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
						progress.setProApproval(draft.getAprApproval2());
						break;
					
					case 3:
						progress.setProApproval(draft.getAprApproval3());
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
			
		}else if(draft.getAprApproval1() !=0 && draft.getAprApproval2() !=0 && draft.getAprApproval3() !=0){// 결재자가 3명일 경우
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
						progress.setProApproval(draft.getAprApproval2());
						break;
					
					case 3:
						progress.setProApproval(draft.getAprApproval3());
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
		//System.out.println("serv temList> test1");
		
//		Draft draft = new Draft();
		List<Draft> temList= new ArrayList<Draft>();
	
		temList = approveDAO.selectAllTem();
//		System.out.println(temList);
//		System.out.println(temList.get(0).getMmCode());
		
		for( int i=0; i<temList.size(); i++){
			String mmName = approveDAO.selectDetailMm(temList.get(i).getMmCode());
			String dpName = approveDAO.selectDetailDp(temList.get(i).getMmCode());
			String docFileGroup = approveDAO.selectDetailDoc(temList.get(i).getDftCode());
//			System.out.println(mmName);
//			System.out.println(dpName);
//			System.out.println(docFileGroup);
			temList.get(i).setMmName(mmName);
			temList.get(i).setDpName(dpName);
			temList.get(i).setDocFileGroup(docFileGroup);
		}

		
		return temList;
	}

	//임시 상세보기 : GET
	@Override
	public List<Draft> temContServ(int dftCode) {
		//System.out.println("serv temContent> test1");
		List<Draft> temContent= new ArrayList<Draft>();
		temContent = approveDAO.selectContTem(dftCode);
		
//		System.out.println(temContent.get(0).getMmCode());
		String mmName = approveDAO.selectDetailMm(temContent.get(0).getMmCode());
		
		temContent.get(0).setMmName(mmName);
		
		//System.out.println(temContent);
		

		return temContent;
	}
	
	//임시 상세보기 : GET = SELECT Document 값 가져오기 
	@Override
	public String temDocSeleServ(int dftCode) {
		
		return approveDAO.selectDetailDoc(dftCode);
	}

	//문서 양식 등록 : POST
	@Override
	public int apDocAddServ(Document document, String uploadPath) {
		System.out.println("serv apDocAddReServ> test1");
		

	/*	UtilFile utilFile = new UtilFile();*/

		int result = 0;
		

		UtilFile utilFile = new UtilFile();

		

		document.setDocFileGroup(document.getDocFileGroup());
		document.setDocFileOri(uploadPath.substring(uploadPath.lastIndexOf("/")+1, uploadPath.lastIndexOf(".")));
		document.setDocFilePath(uploadPath);
	
		//System.out.println("테스트중 : "+uploadPath.lastIndexOf("_"));
		
		result = approveDAO.insertDoc(document);

		return result;
	}

	//문서 양식 목록 : GET
	@Override
	public List<Document> docListServ() {
		
		//System.out.println("srv docListServ > test1");
		List<Document> docList = new ArrayList<Document>();
		docList = approveDAO.selectAllDoc(); // 문서코드/문서구분 불러오기
		
		//System.out.println(docList);
		
		return docList;

	}





	}	


