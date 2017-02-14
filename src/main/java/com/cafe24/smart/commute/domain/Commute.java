package com.cafe24.smart.commute.domain;

//근태
public class Commute {
	private int cmCode;
	private int mmCode;
	private String cmOnTime;
	private String cmOffTime;
	private String cmExeptionInput;
	private String cmSituation;
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
	
	public String getCmExeptionInput() {
		return cmExeptionInput;
	}
	
	public void setCmExeptionInput(String cmExeptionInput) {
		this.cmExeptionInput = cmExeptionInput;
	}
	
	public String getCmSituation() {
		return cmSituation;
	}
	
	public void setCmSituation(String cmSituation) {
		this.cmSituation = cmSituation;
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
				+ cmOffTime + ", cmExeptionInput=" + cmExeptionInput + ", cmSituation=" + cmSituation + ", cmGoOutTime="
				+ cmGoOutTime + ", cmReturnTime=" + cmReturnTime + "]";
	}
}