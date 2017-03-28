package com.cafe24.smart.wbs.domain;

//작업분해도
public class Wbs {
	private int wbsCode;
	private int prCode;
	private String wbsCate;
	private String wbsName;
	private String wbsContents;
	private String wbsStartDate;
	private String wbsEndDate;
	private long wbsWorkingDays;
	private int wbsProgress;
	private String wbsUncompletedReason;
	private String wbsFinalEndDate;
	private String wbsStatus;
	private String wbsProgresses;

	public String getWbsProgresses() {
		return wbsProgresses;
	}

	public void setWbsProgresses(String wbsProgresses) {
		this.wbsProgresses = wbsProgresses;
	}

	public String getWbsStatus() {
		return wbsStatus;
	}

	public void setWbsStatus(String wbsStatus) {
		this.wbsStatus = wbsStatus;
	}

	public int getWbsCode() {
		return wbsCode;
	}
	
	public void setWbsCode(int wbsCode) {
		this.wbsCode = wbsCode;
	}
	
	public int getPrCode() {
		return prCode;
	}

	public void setPrCode(int prCode) {
		this.prCode = prCode;
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

	public long getWbsWorkingDays() {
		return wbsWorkingDays;
	}

	public void setWbsWorkingDays(long wbsWorkingDays) {
		this.wbsWorkingDays = wbsWorkingDays;
	}

	public int getWbsProgress() {
		return wbsProgress;
	}

	public void setWbsProgress(int wbsProgress) {
		this.wbsProgress = wbsProgress;
	}

	public String getWbsUncompletedReason() {
		return wbsUncompletedReason;
	}

	public void setWbsUncompletedReason(String wbsUncompletedReason) {
		this.wbsUncompletedReason = wbsUncompletedReason;
	}

	public String getWbsFinalEndDate() {
		return wbsFinalEndDate;
	}

	public void setWbsFinalEndDate(String wbsFinalEndDate) {
		this.wbsFinalEndDate = wbsFinalEndDate;
	}

	@Override
	public String toString() {
		return "Wbs [wbsCode=" + wbsCode + ", prCode=" + prCode + ", wbsCate=" + wbsCate + ", wbsName=" + wbsName
				+ ", wbsContents=" + wbsContents + ", wbsStartDate=" + wbsStartDate + ", wbsEndDate=" + wbsEndDate
				+ ", wbsWorkingDays=" + wbsWorkingDays + ", wbsProgress=" + wbsProgress + ", wbsUncompletedReason="
				+ wbsUncompletedReason + ", wbsFinalEndDate=" + wbsFinalEndDate + ", wbsStatus=" + wbsStatus
				+ ", wbsProgresses=" + wbsProgresses + "]";
	}
	
}