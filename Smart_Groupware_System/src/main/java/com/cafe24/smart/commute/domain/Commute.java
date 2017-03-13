package com.cafe24.smart.commute.domain;

//근태
public class Commute {
	private int cmCode;
	private int mmCode;
	private String cmOnTime;
	private String cmOffTime;
	private String cmDate;
	private String cmExceptionInput;
	private String cmSituation;
	private String cmExceptionReason;
	private String cmGoOutTime;
	private String cmReturnTime;
	public int getCmCode() {
		return cmCode;
	}
	public void setCmCode(int cmCode) {
		this.cmCode = cmCode;
	}
	public int getMmCode() {
		return mmCode;
	}
	public void setMmCode(int mmCode) {
		this.mmCode = mmCode;
	}
	public String getCmOnTime() {
		return cmOnTime;
	}
	public void setCmOnTime(String cmOnTime) {
		this.cmOnTime = cmOnTime;
	}
	public String getCmOffTime() {
		return cmOffTime;
	}
	public void setCmOffTime(String cmOffTime) {
		this.cmOffTime = cmOffTime;
	}
	public String getCmDate() {
		return cmDate;
	}
	public void setCmDate(String cmDate) {
		this.cmDate = cmDate;
	}
	public String getCmExceptionInput() {
		return cmExceptionInput;
	}
	public void setCmExceptionInput(String cmExceptionInput) {
		this.cmExceptionInput = cmExceptionInput;
	}
	public String getCmSituation() {
		return cmSituation;
	}
	public void setCmSituation(String cmSituation) {
		this.cmSituation = cmSituation;
	}
	public String getCmExceptionReason() {
		return cmExceptionReason;
	}
	public void setCmExceptionReason(String cmExceptionReason) {
		this.cmExceptionReason = cmExceptionReason;
	}
	public String getCmGoOutTime() {
		return cmGoOutTime;
	}
	public void setCmGoOutTime(String cmGoOutTime) {
		this.cmGoOutTime = cmGoOutTime;
	}
	public String getCmReturnTime() {
		return cmReturnTime;
	}
	public void setCmReturnTime(String cmReturnTime) {
		this.cmReturnTime = cmReturnTime;
	}
	@Override
	public String toString() {
		return "Commute [cmCode=" + cmCode + ", mmCode=" + mmCode + ", cmOnTime=" + cmOnTime + ", cmOffTime="
				+ cmOffTime + ", cmDate=" + cmDate + ", cmExceptionInput=" + cmExceptionInput + ", cmSituation="
				+ cmSituation + ", cmExceptionReason=" + cmExceptionReason + ", cmGoOutTime=" + cmGoOutTime
				+ ", cmReturnTime=" + cmReturnTime + "]";
	}
	
}