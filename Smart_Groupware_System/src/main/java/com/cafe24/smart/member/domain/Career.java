package com.cafe24.smart.member.domain;

//경력
public class Career {
	private int crCode;
	private int mmCode;
	private int maCode;
	private int miCode;
	private String crData;
	private String crService;
	private String crPastJoinDay;
	private String crPastResignDay;
	private String crResponsibility;
	private String maCodes;
	private String miCodes;
	public int getCrCode() {
		return crCode;
	}
	public void setCrCode(int crCode) {
		this.crCode = crCode;
	}
	public int getMmCode() {
		return mmCode;
	}
	public void setMmCode(int mmCode) {
		this.mmCode = mmCode;
	}
	public int getMaCode() {
		return maCode;
	}
	public void setMaCode(int maCode) {
		this.maCode = maCode;
	}
	public int getMiCode() {
		return miCode;
	}
	public void setMiCode(int miCode) {
		this.miCode = miCode;
	}
	public String getCrData() {
		return crData;
	}
	public void setCrData(String crData) {
		this.crData = crData;
	}
	public String getCrService() {
		return crService;
	}
	public void setCrService(String crService) {
		this.crService = crService;
	}
	public String getCrPastJoinDay() {
		return crPastJoinDay;
	}
	public void setCrPastJoinDay(String crPastJoinDay) {
		this.crPastJoinDay = crPastJoinDay;
	}
	public String getCrPastResignDay() {
		return crPastResignDay;
	}
	public void setCrPastResignDay(String crPastResignDay) {
		this.crPastResignDay = crPastResignDay;
	}
	public String getCrResponsibility() {
		return crResponsibility;
	}
	public void setCrResponsibility(String crResponsibility) {
		this.crResponsibility = crResponsibility;
	}
	public String getMaCodes() {
		return maCodes;
	}
	public void setMaCodes(String maCodes) {
		this.maCodes = maCodes;
	}
	public String getMiCodes() {
		return miCodes;
	}
	public void setMiCodes(String miCodes) {
		this.miCodes = miCodes;
	}
	@Override
	public String toString() {
		return "Career [crCode=" + crCode + ", mmCode=" + mmCode + ", maCode=" + maCode + ", miCode=" + miCode
				+ ", crData=" + crData + ", crService=" + crService + ", crPastJoinDay=" + crPastJoinDay
				+ ", crPastResignDay=" + crPastResignDay + ", crResponsibility=" + crResponsibility + ", maCodes="
				+ maCodes + ", miCodes=" + miCodes + "]";
	}
	


}