package com.cafe24.smart.approve.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.smart.HomeController;
import com.cafe24.smart.approve.domain.Draft;
import com.cafe24.smart.approve.domain.Progress;
import com.cafe24.smart.approve.service.ApproveService;

@Controller
public class ApproveController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ApproveService approveService;
	
	//add_dftForm_GET
	@RequestMapping(value ="/ap/add", method = RequestMethod.GET)
	public String Add(){		
		return "/approve/ap_dftAdd";
	}
	
	//add_draft_POST
	@RequestMapping(value ="ap/add", method = RequestMethod.POST)
	public String apAddCtrl(Draft draft, Progress progress){
		System.out.println("ctrl dftAdd > test");
		int result = approveService.apAddServ(draft, progress);
		return "home";
	}
		
	//list_Progress_GET
	@RequestMapping(value ="/ap/pgList", method = RequestMethod.GET)
	public String apProListCtrl(Model model){	
		System.out.println("ctrl pgList> test");
		List<Progress> pgList = new ArrayList<Progress>();
		pgList = approveService.pgListServ();
		
		model.addAttribute("pgList", pgList);
		return "/approve/ap_proList";
	}
	
	//list_have_GET
	@RequestMapping(value="/ap/hvList", method=RequestMethod.GET)
	public String apHaveListCtrl(Model model){	
		System.out.println("ctrl hvList> test");
		List<Progress> hvList = new ArrayList<Progress>();
		hvList = approveService.hvListServ();

		return "/approve/ap_haveList";
	}
}