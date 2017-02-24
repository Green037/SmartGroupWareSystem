package com.cafe24.smart.approve.service;

import java.util.List;

import org.springframework.ui.Model;

import com.cafe24.smart.approve.domain.Draft;
import com.cafe24.smart.approve.domain.Progress;

public interface ApproveService {

	//draft add
	int apAddServ(Draft draft, Progress progress);
	
	//progress List
	List<Progress> pgListServ();

	//have List
	List<Progress> hvListServ();
	
}
