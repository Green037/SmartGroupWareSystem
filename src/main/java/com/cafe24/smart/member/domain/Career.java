package com.cafe24.smart.member.domain;

//경력
public class Career {
	private int crCode;
	private String crData;
	private int crService;
	private String crPastJoinDay;
	private String crPastResignDay;
	private String crResponsibility;
	private int maCode;
	private int miCode;
	private int mmCode;

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
	
	public String getcrResponsibility() {
		return crResponsibility;
	}

	public void setcrResponsibility(String crResponsibility) {
		this.crResponsibility = crResponsibility;
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
	
	public int getmmCode() {
		return mmCode;
	}

	public void setmmCode(int mmCode) {
		this.mmCode = mmCode;
	}

	@Override
	public String toString() {
		return "Career [crCode=" + crCode + ", crData=" + crData + ", crService=" + crService + ", crPastJoinDay="
				+ crPastJoinDay + ", crPastResignDay=" + crPastResignDay + ", crResponsibility=" + crResponsibility
				+ ", maCode=" + maCode + ", miCode=" + miCode + ", mmCode=" + mmCode + "]";
	}

}