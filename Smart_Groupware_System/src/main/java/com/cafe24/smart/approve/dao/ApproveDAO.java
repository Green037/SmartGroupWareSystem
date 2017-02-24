package com.cafe24.smart.approve.dao;

import java.util.List;

import com.cafe24.smart.approve.domain.Draft;
import com.cafe24.smart.approve.domain.Progress;

public interface ApproveDAO {

	//insert draft( + progress) 
	int insertDft(Draft draft);
	int insertPg(Progress progress);

	//progress list
	List<Progress> selectAllPg();
	
	//have list
	List<Progress> selectAllhv();

}