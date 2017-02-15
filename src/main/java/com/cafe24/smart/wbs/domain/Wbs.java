package com.cafe24.smart.wbs.domain;

//작업분해도
public class Wbs {
	private int wbsCode;
	private String wbsCate;
	private String wbsName;
	private String wbsContents;
	private String wbsStartDate;
	private String wbsEndDate;
	private int wbsWorkingDays;
	private int wbsProgress;
	private String wbsUncompleatedReason;
	private String wbsFinalEndDate;

	public int getWbsCode() {
		return wbsCode;
	}
	
	public void setWbsCode(int wbsCode) {
		this.wbsCode = wbsCode;
	}
	
	public String getWbsCate() {
		return wbsCate;
	}

	public void setWbsCate(String wbsCate) {
		this.wbsCate = wbsCate;
	}

	public String getWbsName() {
		return wbsName;
	}

	public void setWbsName(String wbsName) {
		this.wbsName = wbsName;
	}
	
	public String getWbsContents() {
		return wbsContents;
	}

	public void setWbsContents(String wbsContents) {
		this.wbsContents = wbsContents;
	}

	public String getWbsStartDate() {
		return wbsStartDate;
	}

	public void setWbsStartDate(String wbsStartDate) {
		this.wbsStartDate = wbsStartDate;
	}

	public String getWbsEndDate() {
		return wbsEndDate;
	}

	public void setWbsEndDate(String wbsEndDate) {
		this.wbsEndDate = wbsEndDate;
	}

	public int getWbsWorkingDays() {
		return wbsWorkingDays;
	}

	public void setWbsWorkingDays(int wbsWorkingDays) {
		this.wbsWorkingDays = wbsWorkingDays;
	}

	public int getWbsProgress() {
		return wbsProgress;
	}

	public void setWbsProgress(int wbsProgress) {
		this.wbsProgress = wbsProgress;
	}

	public String getWbsUncompleatedReason() {
		return wbsUncompleatedReason;
	}

	public void setWbsUncompleatedReason(String wbsUncompleatedReason) {
		this.wbsUncompleatedReason = wbsUncompleatedReason;
	}
	
	public String getWbsFinalEndDate() {
		return wbsFinalEndDate;
	}

	public void setWbsFinalEndDate(String wbsFinalEndDate) {
		this.wbsFinalEndDate = wbsFinalEndDate;
	}

	@Override
	public String toString() {
		return "Wbs [wbsCode=" + wbsCode + ", wbsCate=" + wbsCate + ", wbsName=" + wbsName + ", wbsContents="
				+ wbsContents + ", wbsStartDate=" + wbsStartDate + ", wbsEndDate=" + wbsEndDate + ", wbsWorkingDays="
				+ wbsWorkingDays + ", wbsProgress=" + wbsProgress + ", wbsUncompleatedReason=" + wbsUncompleatedReason
				+ ", wbsFinalEndDate=" + wbsFinalEndDate + "]";
	}	
}