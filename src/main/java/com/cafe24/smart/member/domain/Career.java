package com.cafe24.smart.member.domain;

//경력
public class Career {
	private int crCode;
	private String crData;
	private int crService;
	private String crPastJoinDay;
	private String crPastResignDay;
	private int maCode;
	private int miCode;

	public int getCrCode() {
		return crCode;
	}
	
	public void setCrCode(int crCode) {
		this.crCode = crCode;
	}
	
	public String getCrData() {
		return crData;
	}
	
	public void setCrData(String crData) {
		this.crData = crData;
	}
	
	public int getCrService() {
		return crService;
	}
	
	public void setCrService(int crService) {
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
	
	@Override
	public String toString() {
		return "Career [crCode=" + crCode + ", crData=" + crData + ", crService=" + crService + ", crPastJoinDay="
				+ crPastJoinDay + ", crPastResignDay=" + crPastResignDay + ", maCode=" + maCode + ", miCode=" + miCode
				+ "]";
	}
}