package com.cafe24.smart.approve.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.cafe24.smart.approve.service.ApproveService;
import com.cafe24.smart.project.controller.ProjectController;

public class ApproveRestController {

	private static final Logger log = LoggerFactory.getLogger(ProjectController.class);
	
	@Autowired
	private ApproveService approveService;
	
	//ajax 요청
}
