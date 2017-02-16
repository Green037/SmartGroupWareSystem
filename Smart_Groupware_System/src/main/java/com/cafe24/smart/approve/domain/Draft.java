package com.cafe24.smart.approve.domain;

//기안
public class Draft {
	private int dftCode;
	private int aprCode;
	private int docCode;
	private String mmCode;
	private String dftTitle;
	private int dftDegree;
	private String dftDate;
	private boolean dftApproval1;
	private boolean dftApproval2;
	private boolean dftApproval3;
	private String dftFinalState;
	private boolean dftCheck;
	private String dftFile;

	public int getDftCode() {
		return dftCode;
	}

	public void setDftCode(int dftCode) {
		this.dftCode = dftCode;
	}
	
	public String getMmCode() {
		return mmCode;
	}

	public void setMmCode(String mmCode) {
		this.mmCode = mmCode;
	}
	
	public int getDocCode() {
		return docCode;
	}

	public void setDocCode(int docCode) {
		this.docCode = docCode;
	}

	public int getAprCode() {
		return aprCode;
	}

	public void setAprCode(int aprCode) {
		this.aprCode = aprCode;
	}

	public String getDftTitle() {
		return dftTitle;
	}

	public void setDftTitle(String dftTitle) {
		this.dftTitle = dftTitle;
	}

	public String getDftDate() {
		return dftDate;
	}

	public void setDftDate(String dftDate) {
		this.dftDate = dftDate;
	}

	public int getDftDegree() {
		return dftDegree;
	}

	public void setDftDegree(int dftDegree) {
		this.dftDegree = dftDegree;
	}
	
	public boolean isDftApproval1() {
		return dftApproval1;
	}

	public void setDftApproval1(boolean dftApproval1) {
		this.dftApproval1 = dftApproval1;
	}

	public boolean isDftApproval2() {
		return dftApproval2;
	}

	public void setDftApproval2(boolean dftApproval2) {
		this.dftApproval2 = dftApproval2;
	}

	public boolean isDftApproval3() {
		return dftApproval3;
	}

	public void setDftApproval3(boolean dftApproval3) {
		this.dftApproval3 = dftApproval3;
	}
	
	public String getDftFinalState() {
		return dftFinalState;
	}

	public void setDftFinalState(String dftFinalState) {
		this.dftFinalState = dftFinalState;
	}

	public boolean isDftCheck() {
		return dftCheck;
	}

	public void setDftCheck(boolean dftCheck) {
		this.dftCheck = dftCheck;
	}

	public String getDftFile() {
		return dftFile;
	}

	public void setDftFile(String dftFile) {
		this.dftFile = dftFile;
	}

	@Override
	public String toString() {
		return "Draft [dftCode=" + dftCode + ", aprCode=" + aprCode + ", docCode=" + docCode + ", mmCode=" + mmCode
				+ ", dftTitle=" + dftTitle + ", dftDegree=" + dftDegree + ", dftDate=" + dftDate + ", dftApproval1="
				+ dftApproval1 + ", dftApproval2=" + dftApproval2 + ", dftApproval3=" + dftApproval3
				+ ", dftFinalState=" + dftFinalState + ", dftCheck=" + dftCheck + ", dftFile=" + dftFile + "]";
	}
}