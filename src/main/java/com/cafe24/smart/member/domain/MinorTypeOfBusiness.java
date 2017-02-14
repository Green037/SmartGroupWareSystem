package com.cafe24.smart.member.domain;

//하위업종
public class MinorTypeOfBusiness {
	private int miCode;
	private String miType;
	
	public int getMiCode() {
		return miCode;
	}
	
	public void setMiCode(int miCode) {
		this.miCode = miCode;
	}

	public String getMiType() {
		return miType;
	}
	
	public void setMiType(String miType) {
		this.miType = miType;
	}
	
	@Override
	public String toString() {
		return "MinorTypeOfBusiness [miCode=" + miCode + ", miType=" + miType + "]";
	}
}