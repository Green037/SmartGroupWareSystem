package com.cafe24.smart.member.domain;

//상위업종
public class MajorTypeOfBusiness {
	private int maCode;
	private String maType;
	
	public int getMaCode() {
		return maCode;
	}
	
	public void setMaCode(int maCode) {
		this.maCode = maCode;
	}
	
	public String getMaType() {
		return maType;
	}
	
	public void setMaType(String maType) {
		this.maType = maType;
	}
	
	@Override
	public String toString() {
		return "MajorTypeOfBusiness [maCode=" + maCode + ", maType=" + maType + "]";
	}
}