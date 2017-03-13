package com.cafe24.smart.project.domain;

public class ProjectEvaluation {
	private int prEvCode;
	private String prApprovalCheck;
	private int prCode;
	private int mmCode;
	private String evPrResult;
	
	public int getPrEvCode() {
		return prEvCode;
	}
	public void setPrEvCode(int prEvCode) {
		this.prEvCode = prEvCode;
	}
	public String getPrApprovalCheck() {
		return prApprovalCheck;
	}
	public void setPrApprovalCheck(String prApprovalCheck) {
		this.prApprovalCheck = prApprovalCheck;
	}
	public int getPrCode() {
		return prCode;
	}
	public void setPrCode(int prCode) {
		this.prCode = prCode;
	}
	public int getMmCode() {
		return mmCode;
	}
	public void setMmCode(int mmCode) {
		this.mmCode = mmCode;
	}
	public String getEvPrResult() {
		return evPrResult;
	}
	public void setEvPrResult(String evPrResult) {
		this.evPrResult = evPrResult;
	}
	@Override
	public String toString() {
		return "ProjectEvaluation [prEvCode=" + prEvCode + ", prApprovalCheck=" + prApprovalCheck + ", prCode=" + prCode
				+ ", mmCode=" + mmCode + ", evPrResult=" + evPrResult + "]";
	}
	
}
