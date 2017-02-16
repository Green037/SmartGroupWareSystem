package com.cafe24.smart.member.domain;

//부서
public class Department {
	private int dpCode;
	private String dpType;

	public int getDpCode() {
		return dpCode;
	}
	
	public void setDpCode(int dpCode) {
		this.dpCode = dpCode;
	}

	public String getDpType() {
		return dpType;
	}
	
	public void setDpType(String dpType) {
		this.dpType = dpType;
	}

	@Override
	public String toString() {
		return "Depart [dpCode=" + dpCode + ", dpType=" + dpType + "]";
	}
}