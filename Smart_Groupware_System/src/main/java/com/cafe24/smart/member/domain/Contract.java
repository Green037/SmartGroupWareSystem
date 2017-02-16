package com.cafe24.smart.member.domain;

//계약형태
public class Contract {
	private int ctCode;
	private String ctType;
	
	public int getCtCode() {
		return ctCode;
	}
	
	public void setCtCode(int ctCode) {
		this.ctCode = ctCode;
	}
	
	public String getCtType() {
		return ctType;
	}
	
	public void setCtType(String ctType) {
		this.ctType = ctType;
	}

	@Override
	public String toString() {
		return "Contract [ctCode=" + ctCode + ", ctType=" + ctType + "]";
	}
}