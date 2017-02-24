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
import org.springframework.web.bind.annotation.RequestParam;

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
		/*문서결재신청 폼을 가져오기 위한 메소드
		 * return값을 String으로 준 이유는 url을 지정하기 위해서*/
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
		model.addAttribute("hvList", hvList);
		
		return "/approve/ap_haveList";
	}
	
	//Content_have_Get
	@RequestMapping(value="/ap/hvContent", method=RequestMethod.GET)
	public String aphvDetailCtrl(Model model, @RequestParam("dftCode") int dftCode){
		System.out.println("ctrl hvCont> test");
		List<Draft> hvContent = new ArrayList<Draft>();
		//-----------여기까지하고 쉬는시간--------------//
		
		return "/approve/ap_haveContent";
	
	}
	
	//list_tem_GET
	@RequestMapping(value="/ap/temList", method=RequestMethod.GET)
	public String temList(Model model){
		System.out.println("ctrl temList> test");
		List<Draft> temList = new ArrayList<Draft>();
		temList = approveService.temListServ();
		model.addAttribute("temList", temList);
		
		return "/approve/ap_temList";
		
	}
	
}