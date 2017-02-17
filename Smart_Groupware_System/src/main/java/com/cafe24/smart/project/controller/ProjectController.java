package com.cafe24.smart.project.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProjectController {
	
	private static final Logger log = LoggerFactory.getLogger(ProjectController.class);
	
	@RequestMapping(value = "pr/add", method = RequestMethod.GET)
	public String add() {
						
		return "project/pr_addForm";
	}	
}