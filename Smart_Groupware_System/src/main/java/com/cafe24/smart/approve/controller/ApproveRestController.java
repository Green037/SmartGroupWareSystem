package com.cafe24.smart.approve.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.smart.approve.domain.Document;
import com.cafe24.smart.approve.domain.TotalFile;
import com.cafe24.smart.approve.domain.TotalInfo;
import com.cafe24.smart.approve.service.ApproveService;
import com.cafe24.smart.project.controller.ProjectController;

@RestController
public class ApproveRestController {

	private static final Logger log = LoggerFactory.getLogger(ProjectController.class);
	
	@Autowired
	private ApproveService approveService;

	//문서양식 등록 : POST
	@RequestMapping(value ="ap/addDocument", method = RequestMethod.POST)
	public Document apDocAddReCtrl(Document document, TotalFile totalFile){
		
		System.out.println("ctrl apDocAddReCtrl> test");
		System.out.println("----"+totalFile);
		System.out.println("----"+document);
		int result = approveService.apDocAddServ(document,totalFile);
		
		//select값 : 최근 document pk값 들고옥
		
		//System.out.println(result);
		
		//return값을 map으로 가져와서 입력성공/실패를 같이 넣어 jsp로 전달
		return document; 
	}
}
