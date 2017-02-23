package com.cafe24.smart.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.smart.project.domain.Project;
import com.cafe24.smart.project.domain.ProjectMember;
import com.cafe24.smart.project.service.ProjectService;

@RestController
public class ProjectRestController {
	
	private static final Logger log = LoggerFactory.getLogger(ProjectController.class);
	
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping(value = "pm/detail", method = RequestMethod.POST)
	public List<ProjectMember> pmListCtrl(@RequestParam("prCode") int prCode) {
		//System.out.println("h2");
		System.out.println("넘어온 프로젝트코드값 : "+prCode);
		List<ProjectMember> pmList = new ArrayList<ProjectMember>(); 
		Map<String,List<ProjectMember>> pmMap = new HashMap<String,List<ProjectMember>>();
		
		pmList = projectService.pmListServ(prCode);
		
		return pmList;
	}
}
