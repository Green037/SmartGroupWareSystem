package com.cafe24.smart.member.domain;

//직급
public class Position {
	private int ptCode;
	private int ptName;
	
	public int getPtCode() {
		return ptCode;
	}

	public void setPtCode(int ptCode) {
		this.ptCode = ptCode;
	}
	
	public int getPtName() {
		return ptName;
	}
	
	public void setPtName(int ptName) {
		this.ptName = ptName;
	}

	@Override
	public String toString() {
		return "Position [ptCode=" + ptCode + ", ptName=" + ptName + "]";
	}
}