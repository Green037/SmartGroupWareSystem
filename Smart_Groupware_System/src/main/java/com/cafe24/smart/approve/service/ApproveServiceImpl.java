package com.cafe24.smart.approve.service;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.smart.approve.dao.ApproveDAO;
import com.cafe24.smart.approve.domain.Approval;
import com.cafe24.smart.approve.domain.Document;
import com.cafe24.smart.approve.domain.Draft;
import com.cafe24.smart.approve.domain.Progress;
import com.cafe24.smart.member.domain.Department;
import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.member.domain.Position;
import com.cafe24.smart.util.UtilFile;

@Service
public class ApproveServiceImpl implements ApproveService {
	
	@Autowired
	private ApproveDAO approveDAO;
	
	// ----- 메서드 : 현재 시간 출력
	Date today = new Date (); 
	SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss", Locale.KOREA );

	// ----- 메서드 : 결재 목록 이름 셋팅
	private List<Draft> setName(List<Draft> pgList){
		
		for(int i=0; i<pgList.size(); i++){
			String mmName = approveDAO.selectDetailMm(pgList.get(i).getMmCode());
			String pMmName = approveDAO.selectDetailPMn(pgList.get(i).getProApproval());
			
			pgList.get(i).setMmName(mmName);
			pgList.get(i).setpMmName(pMmName);
		}
		return pgList;
		
	}
	
	
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
	
	// --- [AJAX] 직급/부서명 가져오기 : GET 
	@Override
	public List<Member> apMmAddServ(Position position, Department department) {

		Map<String,Integer> map = new HashMap<String,Integer>();
		
		map.put("dpCode", department.getDpCode());
		map.put("ptCode", position.getPtCode());
		
		return approveDAO.selectByApMm(map);
	}
	
	// --- [AJAX] 결재라인 등록 : POST
	@Override
	public int apAprAddServ(Approval approval) {
		System.out.println("ajax 넘어오니1");
		return approveDAO.insertApr(approval);
	}
	
	// --- [AJAZ] 결재라인 가져오기 mmCode : POST
	@Override
	public List<Approval> apAprListServ(int mmCode) {
		
		List<Approval> apr = new ArrayList<Approval>();
		apr = approveDAO.selectAllApr(mmCode);
		
		for(int i =0; i<apr.size(); i++){
		
			apr.get(i).setAprName1(approveDAO.selectDetailMm(apr.get(i).getAprApproval1()));
			apr.get(i).setAprName2(approveDAO.selectDetailMm(apr.get(i).getAprApproval2()));
			apr.get(i).setAprName3(approveDAO.selectDetailMm(apr.get(i).getAprApproval3()));
		}		
		return apr;
	}
	
	//  --- [AJAZ] 결재라인 가져오기 : 사원조회 : POST
	@Override
	public Map apAprSelServ(int aprCode) {
		
		List<Approval> apr = new ArrayList<Approval>();
		Map map1 = new HashMap();
		Map map2 = new HashMap();
		Map map3 = new HashMap();
		Map totalMap = new HashMap();
		
		apr = approveDAO.selectbyReApr(aprCode);
		
		map1 = approveDAO.selectByPersonal(apr.get(0).getAprApproval1());
		map2 = approveDAO.selectByPersonal(apr.get(0).getAprApproval2());
		map3 = approveDAO.selectByPersonal(apr.get(0).getAprApproval3());
		
		totalMap.put("map1", map1);
		totalMap.put("map2", map2);
		totalMap.put("map3", map3);
		
		System.out.println("이름부서직급다가져오기:"+totalMap);
			
		return totalMap;
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
		
		if(apProgress==1){//결재 대기 목록
			progress = 0;
			map.put("progress", progress);
			map.put("mmCode",mmCode);
			pgList = approveDAO.selectByHv(map);
			pgList = setName(pgList);
			
					
		}else if(apProgress==2){//결재 반려 목록
			progress = 2;
			map.put("progress", progress);
			map.put("mmCode",mmCode);
			pgList = approveDAO.selectByHv(map);
			pgList = setName(pgList);
			
		}else if(apProgress==3){//결재 완료 목록
			progress = 1;
			map.put("progress", progress);
			map.put("mmCode",mmCode);
			pgList = approveDAO.selectByHv(map);
			
			pgList = setName(pgList);
			
		}else{// 전체목록
			pgList = approveDAO.selectAllPg(mmCode);
			pgList = setName(pgList);// 사원정보 셋팅
//			System.out.println("전체목록 결과값:"+pgList);
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
		System.out.println("목록 상세보기:"+draft);
		
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
	
	// 임시 목록 
	@Override
	public List<Draft> temListServ(int mmCode) {
		//System.out.println("serv temList> test1");
		
		List<Draft> temList= new ArrayList<Draft>();
		System.out.println("임시 목록 사원코드 :"+mmCode);
	
		temList = approveDAO.selectAllTem(mmCode);
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

	// 임시문서 상세보기 
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
	
	// 임시문서  상세보기 (문서값 가져오기) 
	@Override
	public String temDocSeleServ(int dftCode) {
		return approveDAO.selectDetailDoc(dftCode);
	}
	
	// 임시 상세보기 (이름값 가져오기)
	@Override
	public Map temContNameServ(List<Draft> draft) {
		
		Map map = new HashMap();
		String name1 = approveDAO.selectDetailMm(draft.get(0).getAprApproval1());
		String name2 = approveDAO.selectDetailMm(draft.get(0).getAprApproval2());
		String name3 = approveDAO.selectDetailMm(draft.get(0).getAprApproval3());
		map.put("name1", name1);
		map.put("name2", name2);
		map.put("name3", name3);
		
//		System.out.println("이름값구하기:"+map);
		
		return map;
	}
	
	// 임시 상세보기 (직급명 가져오기)
	@Override
	public Map temContPtServ(List<Draft> draft) {
		Map map = new HashMap();
		String pt1 = approveDAO.selectDetailPt(draft.get(0).getAprApproval1());
		String pt2 = approveDAO.selectDetailPt(draft.get(0).getAprApproval2());
		String pt3 = approveDAO.selectDetailPt(draft.get(0).getAprApproval3());
		map.put("pt1", pt1);
		map.put("pt2", pt2);
		map.put("pt3", pt3);
		
//		System.out.println("직급명:"+map);
		
		return map;
	}
	
	// 임시 상세보기 (부서명 가져오기)
	@Override
	public Map temContDepServ(List<Draft> draft) {
		
		Map map = new HashMap();
		String dep1 = approveDAO.selectDetailDp(draft.get(0).getAprApproval1());
		String dep2 = approveDAO.selectDetailDp(draft.get(0).getAprApproval2());
		String dep3 = approveDAO.selectDetailDp(draft.get(0).getAprApproval3());
		map.put("dep1", dep1);
		map.put("dep2", dep2);
		map.put("dep3", dep3);
		
		System.out.println(map);
		return map;
	}

	// 문서 양식 등록
	@Override
	public int apDocAddServ(Document document, String uploadPath) {
		System.out.println("serv apDocAddReServ> test1");
		
		int result = 0;
		
		//파일 업로드를 위한 utilFile 클래스 선언
		UtilFile utilFile = new UtilFile();

/*		파일 업로드시에 파일분류/이름/경로 저장*/
		document.setDocFileGroup(document.getDocFileGroup());
		document.setDocFileOri(uploadPath.substring(uploadPath.lastIndexOf("_")+1, uploadPath.lastIndexOf(".")));
		document.setDocFilePath(uploadPath);
	
		//System.out.println("테스트중 : "+uploadPath.lastIndexOf("_"));
		result = approveDAO.insertDoc(document);

		return result;
	}

	// 문서 보관함 양식 insert 후select값 가져오기
	@Override
	public List<Document> apDocSelServ(Document document) {
		return approveDAO.selectListByDoc(document);
	}
	
	//문서 보관함 목록 
	@Override
	public List<Document> docListServ() {
		//System.out.println("srv docListServ > test1");
		List<Document> docList = new ArrayList<Document>();
		docList = approveDAO.selectAllDoc(); // 문서코드/문서구분 불러오기
		//System.out.println(docList);
		return docList;
	}

	//문서 보관함 : 다운로드
	@Override
	public Document apDownDocServ(int docCode) {
		return approveDAO.selectListByDoc(docCode);
	}
	
	//결재 문서 : 첨부파일 다운로드 
	@Override
	public Draft apDownDftServ(int dftCode) {
		return approveDAO.selectContHv(dftCode);
	}

	// 목록 검색 : 결재 목록
	@Override
	public List<Draft> apSearchServ(Draft draft ,String docFileGroup) {
		
//		System.out.println(apGroup);
		List<Draft> resultDft = new ArrayList<Draft>();
		// 결재 목록 검색에서 조건 설정
		System.out.println("넘어온값 확인draft:"+draft);
		draft.setDocFileGroup(docFileGroup); //문서분류세팅
		
		resultDft = approveDAO.selectBySearchGroup(draft);
		resultDft =setName(resultDft); // 사원이름 셋팅
		
	
		return resultDft;
	}

	// 목록 검색 : 문서 양식함
	@Override
	public List<Document> apSearchDocServ(String docFileGroup) {
//		System.out.println("문서양식함 serv:"+docFileGroup);
		List<Document> resultDoc = new ArrayList<Document>();
		// 문서 양식 조건
		resultDoc = approveDAO.selectBySearchDoc(docFileGroup);
		return resultDoc;
	}


	@Override
	public List<Draft> apSearchDftServ(Draft draft) {
		System.out.println("임시 검색:"+draft);
		List<Draft> resultDft = new ArrayList<Draft>();
		resultDft = approveDAO.selectBySearchTem(draft);
		
		//사원 이름과 부서가져오기
		
		
		return null;
	}

	}	

