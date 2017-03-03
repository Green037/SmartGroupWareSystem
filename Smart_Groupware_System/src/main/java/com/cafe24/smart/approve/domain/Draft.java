package com.cafe24.smart.approve.domain;

import org.springframework.web.multipart.MultipartFile;

//기안
public class Draft {
	private int dftCode;
	private int aprCode;
	private int docCode;
	private int mmCode;
	private String dftTitle;
	private int dftDegree;
	private String dftDate;
	private int dftApproval1;
	private int dftApproval2;
	private int dftApproval3;
	private String dftFinalState;
	private String dftCheck;

	//----- view
	private int proApproval;
	private String proRealTime;
	private String url;

	
	public int getDftCode() {
		return dftCode;
	}
	public void setDftCode(int dftCode) {
		this.dftCode = dftCode;
	}
	public int getAprCode() {
		return aprCode;
	}
	public void setAprCode(int aprCode) {
		this.aprCode = aprCode;
	}
	public int getDocCode() {
		return docCode;
	}
	public void setDocCode(int docCode) {
		this.docCode = docCode;
	}
	public int getMmCode() {
		return mmCode;
	}
	public void setMmCode(int mmCode) {
		this.mmCode = mmCode;
	}
	public String getDftTitle() {
		return dftTitle;
	}
	public void setDftTitle(String dftTitle) {
		this.dftTitle = dftTitle;
	}
	public int getDftDegree() {
		return dftDegree;
	}
	public void setDftDegree(int dftDegree) {
		this.dftDegree = dftDegree;
	}
	public String getDftDate() {
		return dftDate;
	}
	public void setDftDate(String dftDate) {
		this.dftDate = dftDate;
	}
	public int getDftApproval1() {
		return dftApproval1;
	}
	public void setDftApproval1(int dftApproval1) {
		this.dftApproval1 = dftApproval1;
	}
	public int getDftApproval2() {
		return dftApproval2;
	}
	public void setDftApproval2(int dftApproval2) {
		this.dftApproval2 = dftApproval2;
	}
	public int getDftApproval3() {
		return dftApproval3;
	}
	public void setDftApproval3(int dftApproval3) {
		this.dftApproval3 = dftApproval3;
	}
	public String getDftFinalState() {
		return dftFinalState;
	}
	public void setDftFinalState(String dftFinalState) {
		this.dftFinalState = dftFinalState;
	}
	public String getDftCheck() {
		return dftCheck;
	}
	public void setDftCheck(String dftCheck) {
		this.dftCheck = dftCheck;
	}

	// ----- view
	public int getProApproval() {
		return proApproval;
	}
	public void setProApproval(int proApproval) {
		this.proApproval = proApproval;
	}
	public String getProRealTime() {
		return proRealTime;
	}
	public void setProRealTime(String proRealTime) {
		this.proRealTime = proRealTime;
	}
	
	// ----- 주소를 담아서 return하기 위해 생성
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	@Override
	public String toString() {
		return "Draft [dftCode=" + dftCode + ", aprCode=" + aprCode + ", docCode=" + docCode + ", mmCode=" + mmCode
				+ ", dftTitle=" + dftTitle + ", dftDegree=" + dftDegree + ", dftDate=" + dftDate + ", dftApproval1="
				+ dftApproval1 + ", dftApproval2=" + dftApproval2 + ", dftApproval3=" + dftApproval3
				+ ", dftFinalState=" + dftFinalState + ", dftCheck=" + dftCheck + ", proApproval=" + proApproval
				+ ", proRealTime=" + proRealTime + "]";
	}
		
}