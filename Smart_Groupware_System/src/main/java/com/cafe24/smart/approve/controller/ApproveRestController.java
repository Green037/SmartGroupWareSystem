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

import com.cafe24.smart.approve.domain.Document;
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

	//문서양식 등록 : POST
	@RequestMapping(value ="ap/addDoc", method = RequestMethod.POST)
	public Map apDocAddReCtrl(@RequestParam("uploadFile") MultipartFile uploadFile,
							  MultipartHttpServletRequest request, Document document){
		
		HashMap resultMap = new HashMap();
		UtilFile utilFile = new UtilFile();
		
		String uploadPath = utilFile.fileUpload(request, uploadFile, document);
		//System.out.println("ajax - ctrl apDocAddReCtrl> test");

		int result = approveService.apDocAddServ(document, uploadPath);
		
		if(result != 0){
			resultMap.put("check", "성공");
		}else{
			resultMap.put("check", "실패");
		}
		
		//select값 : 최근 document pk값 들고옥
		//System.out.println(result);
		//return값을 map으로 가져와서 입력성공/실패를 같이 넣어 jsp로 전달
		
		return resultMap; 
	}
	
	//결재선 사원 추가
	@RequestMapping(value ="ap/addMm", method = RequestMethod.POST)
	public List<Member> apMmAddReCtrl(Position position, Department department){
		System.out.println("ajax 넘어오니");
		
		
		List<Member> member = new ArrayList<Member>();
		
		//System.out.println(position);
		//System.out.println(department);
		member = approveService.apMmAddServ(position,department);

		
		return member;
	}

	
}
