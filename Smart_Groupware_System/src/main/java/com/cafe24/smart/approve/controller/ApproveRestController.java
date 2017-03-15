package com.cafe24.smart.approve.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cafe24.smart.approve.domain.Approval;
import com.cafe24.smart.approve.domain.Document;
import com.cafe24.smart.approve.domain.Draft;
import com.cafe24.smart.approve.service.ApproveService;
import com.cafe24.smart.member.domain.Department;
import com.cafe24.smart.member.domain.Member;
import com.cafe24.smart.member.domain.Position;
import com.cafe24.smart.project.controller.ProjectController;
import com.cafe24.smart.util.UtilFile;

@RestController
public class ApproveRestController {

	private static final Logger log = LoggerFactory.getLogger(ProjectController.class);
	
	@Autowired
	private ApproveService approveService;

	// 문서양식 등록 : POST
	@RequestMapping(value ="ap/addDoc", method = RequestMethod.POST)
	public Map apDocAddReCtrl(@RequestParam("uploadFile") MultipartFile uploadFile,
							  MultipartHttpServletRequest request, Document document){
		
		HashMap resultMap = new HashMap();
		List<Document> selDoc = new ArrayList<Document>();
		UtilFile utilFile = new UtilFile();
		
		String uploadPath = utilFile.fileUpload(request, uploadFile, selDoc);
//		System.out.println("ajax - ctrl apDocAddReCtrl> test");

		int result = approveService.apDocAddServ(document, uploadPath);
		
		if(result != 0){
			resultMap.put("check","성공");
//			generate mapper에서 document에서 select해와서 resultMap에다 담아줘서 가져옴
//			System.out.println("방금입력한document pk값:"+document.getDocCode());
			selDoc = approveService.apDocSelServ(document);
			
//			System.out.println("방금입력한 안녕2"+selDoc);
			resultMap.put("selDoc", selDoc);
			
		}else{
			resultMap.put("check","실패");
		}

		
		return resultMap; 
	}
	
	// 결재선 web 선택
	@RequestMapping(value ="ap/addMm", method = RequestMethod.POST)
	public List<Member> apMmAddReCtrl(Position position, Department department){
		//System.out.println("rectrl apMmAddReCtrl > tets");
		
		List<Member> member = new ArrayList<Member>();		
		//System.out.println(position);
		//System.out.println(department);
		member = approveService.apMmAddServ(position,department);

		
		return member;
	}
	
	// 결재선 등록
	@RequestMapping(value ="ap/addApr", method = RequestMethod.POST)
	public int apAprAddReCtrl(Approval approval){
			
//		System.out.println(approval);
		int apr = 0;
		
			if(approval.getAprApproval1()==0){
				apr = 0;
			}else{
				apr = approveService.apAprAddServ(approval);
			}
//			System.out.println(apr);
				
			return apr;
		}
	
	// 기안자 사원코드로 결재선 가져오기[복수]
	@RequestMapping(value ="ap/listApr", method = RequestMethod.POST)
	public List<Approval> apAprListReCtrl(@RequestParam("mmCode") int mmCode){
//		System.out.println("ajax");			
//		System.out.println(mmCode);
		
		List<Approval> apr = new ArrayList<Approval>();		
		apr = approveService.apAprListServ(mmCode);

		//System.out.println(apr);
			
		return apr;
	}
	
	// 결재라인코드(pk값) 결재선 가져오기[단수]
	@RequestMapping(value="ap/selApr", method = RequestMethod.POST)
	public Map apAprSelReCtrl(@RequestParam("aprCode") int aprCode){
//		System.out.println("select값 가져오기");
		
		Map resultMap = new HashMap();
		resultMap = approveService.apAprSelServ(aprCode);
		
//		System.out.println("결재서 resultMap 값 :"+resultMap);

		return resultMap;
	}
	
	//apList에서 검색
	@RequestMapping(value="ap/searchDft", method = RequestMethod.POST)
	public List<Draft> apSearchListCtrl(Draft draft, @RequestParam("docFileGroup") String docFileGroup){
		
//		System.out.println("ajax test");
//		System.out.println("넘어온 값 확인 : "+draft);
//		System.out.println("넘어온 값 확인 : "+docFileGroup);
		Map map = new HashMap();
		List<Draft> serachList = new ArrayList<Draft>();
		
		System.out.println("form:"+draft);
		
		//System.out.println(docFileGroup);
		serachList = approveService.apSearchServ(draft ,docFileGroup);
		System.out.println("검색:"+serachList);
	
		return serachList;
		
	}
}