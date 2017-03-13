package com.cafe24.smart.approve.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cafe24.smart.approve.domain.Document;
import com.cafe24.smart.approve.domain.Draft;
import com.cafe24.smart.approve.domain.Progress;
import com.cafe24.smart.approve.service.ApproveService;
import com.cafe24.smart.member.domain.Department;
import com.cafe24.smart.member.domain.Position;
import com.cafe24.smart.util.UtilFile;

@Controller
public class ApproveController {
	private static final Logger logger = LoggerFactory.getLogger(ApproveController.class);
	
	@Autowired
	private ApproveService approveService;
	
	//기안 등록 : GET
	@RequestMapping(value ="ap/add", method = RequestMethod.GET)
	public String Add(Model model){
		
		//System.out.println("ctrl dftAdd GET> test");
		List<Document> doc = new ArrayList<Document>();
		List<Department> dep = new ArrayList<Department>();
		List<Position> pos = new ArrayList<Position>();
		
		doc = approveService.apAddSelServ();
		dep = approveService.apAddMmSelServ();
		pos = approveService.apADDPosSelServ();
		
		//System.out.println(doc);
		model.addAttribute("doc", doc);
		model.addAttribute("dep", dep);
		model.addAttribute("pos", pos);
		
		return "/approve/ap_dftAdd";   
	}
	
	//기안 등록 : POST
	@RequestMapping(value ="ap/add", method = RequestMethod.POST)
	public String apAddCtrl(@RequestParam("uploadFile") MultipartFile uploadFile,
							MultipartHttpServletRequest request,Draft draft, Progress progress){
			
		System.out.println("ctrl dftAdd > test");
		UtilFile utilFile = new UtilFile();
		
		String uploadPath = utilFile.fileUpload(request, uploadFile, draft);
		System.out.println("ctrl apAddCtrl> test2 :"+uploadPath);

		int result = approveService.apAddServ(draft, progress, uploadPath);
		
		return "redirect:/ap/list";
	}
		
	//결재 목록 [대기/반려/완료] : GET 
	@RequestMapping(value ="ap/list", method = RequestMethod.GET)
	public String apProListCtrl(Model model, @RequestParam(value="apProgress", defaultValue="0") int apProgress, HttpSession session){	
		//System.out.println("ctrl pgList> test");
		//System.out.println(apProgress);
	
		int mmCode = (int) session.getAttribute("mmCode");
		System.out.println(mmCode);
		
		List<Draft> pgList = new ArrayList<Draft>();
		pgList = approveService.pgListServ(apProgress, mmCode);
		
		//System.out.println(pgList);
		model.addAttribute("pgList", pgList);
	
		return "/approve/ap_list";
	}

	//결재 상세보기[대기/반려/완료] : GET
	@RequestMapping(value="ap/Content", method=RequestMethod.GET)
	public String apHvDetailCtrl(Model model,@RequestParam("dftCode") int dftCode){
	
		//System.out.println("ctrl hvCont> test");
		Draft draft = new Draft();
		String url;
		
		draft = approveService.hvContServ(dftCode);
		model.addAttribute("draft", draft);
		url = draft.getUrl();
	
		return url;
	
	}	

	//결재 요청[승인/반려] : POST
	@RequestMapping(value ="ap/proAdd", method = RequestMethod.POST)
	public String proAdd(Draft draft, Progress progress, @RequestParam("dftCode") int dftCode){

		//System.out.println("ctrl proAdd> test");
		int result = approveService.apProAddServ(draft, progress, dftCode);
		
		return "redirect:/ap/list";  
	}
	
	//임시 문서함 : GET
	@RequestMapping(value="ap/temList", method=RequestMethod.GET)
	public String temList(Model model){
		
		//System.out.println("ctrl temList> test");
		List<Draft> temList = new ArrayList<Draft>();
		temList = approveService.temListServ();
		model.addAttribute("temList", temList);
		
		return "/approve/ap_temList";
		
	}
	
	//임시 문서함 상세보기 : GET
	@RequestMapping(value ="ap/temContent", method = RequestMethod.GET)
	public String aptemDetailCtrl(Model model,@RequestParam("dftCode") int dftCode){
	
		//System.out.println("ctrl temContent> test");
		List<Draft> draft = new ArrayList<Draft>();	
		List<Document> doc = new ArrayList<Document>();
		
		List<Department> dep = new ArrayList<Department>();
		List<Position> pos = new ArrayList<Position>();
		String selectDoc = "";
		
		doc = approveService.apAddSelServ();
		dep = approveService.apAddMmSelServ();
		pos = approveService.apADDPosSelServ();
		draft = approveService.temContServ(dftCode);
		selectDoc = approveService.temDocSeleServ(dftCode);
	
	
		model.addAttribute("draft", draft);
		model.addAttribute("dep", dep);
		model.addAttribute("pos", pos);
		model.addAttribute("doc", doc);
		model.addAttribute("selectDoc", selectDoc);
		
//		System.out.println(draft);
		
		return "/approve/ap_temModify";   
	}

	
	//문서함 : GET
	@RequestMapping(value ="ap/docList", method = RequestMethod.GET)
	public String apdocListCtrl(Model model){
	
		//System.out.println("ctrl apdocListCtrl> test");
		List<Document> docList = new ArrayList<Document>();
		
		docList = approveService.docListServ();
		model.addAttribute("docList", docList);
		
		return "/approve/ap_docList";   
	}
	
	//기안 문서 : 첨부파일 다운로드
	@RequestMapping(value ="ap/downdftFile", method = RequestMethod.POST)
	public String apDownDftFile(@RequestParam("dftCode") int dftCode){
		//----- 다운로드 메서드 추가
		System.out.println("다운로드 test1");
		return null;
		
	};
		
}