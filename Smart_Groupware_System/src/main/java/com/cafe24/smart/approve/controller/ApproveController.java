package com.cafe24.smart.approve.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.cafe24.smart.approve.domain.Document;
import com.cafe24.smart.approve.domain.Draft;
import com.cafe24.smart.approve.domain.Progress;
import com.cafe24.smart.approve.service.ApproveService;

@Controller
public class ApproveController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ApproveService approveService;
	
	//기안 등록 : GET
	/*문서결재신청 폼을 가져오기 위한 메소드 return값을 String으로 준 이유는 url을 지정하기 위해서*/
	@RequestMapping(value ="ap/add", method = RequestMethod.GET)
	public String Add(){
		return "/approve/ap_dftAdd";   
	}
	
	//기안 등록 : POST
	/*draft와 progress 매개변수를 준 이유는 draft 테이블에 추가되면서 progress 테이블에도 dft_code를 참고해서 progress에서 추가되어야하기 떄문에*/
	@RequestMapping(value ="ap/add", method = RequestMethod.POST)
	public String apAddCtrl(Draft draft, Progress progress){
		
		System.out.println("ctrl dftAdd > test");
		System.out.println(draft.getDftDate());
		int result = approveService.apAddServ(draft, progress);
		
		return "home";
	}
		
	//진행 목록 : GET
	@RequestMapping(value ="ap/pgList", method = RequestMethod.GET)
	public String apProListCtrl(Model model){	
		System.out.println("ctrl pgList> test");
		List<Progress> pgList = new ArrayList<Progress>();
		pgList = approveService.pgListServ();
		model.addAttribute("pgList", pgList);
		
		return "/approve/ap_proList";
	}
	
	//결재 목록 : GET 
	@RequestMapping(value="ap/hvList", method=RequestMethod.GET)
	public String apHaveListCtrl(Model model){	
		System.out.println("ctrl hvList> test");
		List<Progress> hvList = new ArrayList<Progress>();
		hvList = approveService.hvListServ();
		model.addAttribute("hvList", hvList);
		System.out.println(hvList);
		
		return "/approve/ap_haveList";
	}
	
	//결재 정보 [승인/반려 Content] : GET
	@RequestMapping(value="ap/hvContent", method=RequestMethod.GET)
	public String aphvDetailCtrl(Model model, @RequestParam("dftCode") int dftCode){
		System.out.println("ctrl hvCont> test");
		Draft draft = new Draft();
		draft = approveService.hvContServ(dftCode);
		//System.out.println(draft);
		
		model.addAttribute("draft", draft);
	
		return "/approve/ap_haveContent";
	
	}
	
	//결재 정보[승인/반려] : POST
	@RequestMapping(value ="ap/proAdd", method = RequestMethod.POST)
	public String proAdd(Draft draft, Progress progress,@RequestParam("dftCode") int dftCode){
		System.out.println("ctrl proAdd> test");
		
		int result = approveService.apProAddServ(draft, progress, dftCode);
		
		return "home";   
	}
	
	//임시 문서함 : GET
	@RequestMapping(value="ap/temList", method=RequestMethod.GET)
	public String temList(Model model){
		System.out.println("ctrl temList> test");
		List<Draft> temList = new ArrayList<Draft>();
		temList = approveService.temListServ();
		model.addAttribute("temList", temList);
		
		return "/approve/ap_temList";
		
	}
	
	//문서함 : GET
	@RequestMapping(value ="ap/docList", method = RequestMethod.GET)
	public String docList(){
		System.out.println("ctrl docList> test");
		List<Document> docList = new ArrayList<Document>();
		
		return "/approve/ap_docList";   
	}
	
	//문서양식 등록 : get
	@RequestMapping(value ="ap/docAdd", method = RequestMethod.GET)
	public String docAdd(){
		System.out.println("ctrl docList> test");
		
		return "/approve/ap_docAdd";   
	}
	

}