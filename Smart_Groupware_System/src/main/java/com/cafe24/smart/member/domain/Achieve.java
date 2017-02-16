package com.cafe24.smart.member.domain;

//학력
public class Achieve {
	private int acCode;
	private String acName;

	public int getAcCode() {
		return acCode;
	}

	public void setAcCode(int acCode) {
		this.acCode = acCode;
	}

	public String getAcName() {
		return acName;
	}
	public void setAcName(String acName) {
	
		this.acName = acName;
	}
	
	@Override
	public String toString() {
		return "Achievement [acCode=" + acCode + ", acName=" + acName + "]";
	}
}