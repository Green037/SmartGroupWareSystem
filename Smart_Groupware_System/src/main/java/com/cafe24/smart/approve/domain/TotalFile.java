package com.cafe24.smart.approve.domain;

import org.springframework.web.multipart.MultipartFile;

public class TotalFile {
	
	private MultipartFile dftFile;
	private MultipartFile docFile;
	
	public MultipartFile getDftFile() {
		return dftFile;
	}
	public void setDftFile(MultipartFile dftFile) {
		this.dftFile = dftFile;
	}
	public MultipartFile getDocFile() {
		return docFile;
	}
	public void setDocFile(MultipartFile docFile) {
		this.docFile = docFile;
	}
	@Override
	public String toString() {
		return "totalFile [dftFile=" + dftFile + ", docFile=" + docFile + "]";
	}
	
	

}
