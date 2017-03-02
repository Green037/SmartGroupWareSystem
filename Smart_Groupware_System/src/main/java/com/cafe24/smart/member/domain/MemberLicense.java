package com.cafe24.smart.member.domain;

//사원 자격증
public class MemberLicense {
	private int mlCode;
	private int mmCode;
	private int lcCode;
	private String mlIssueDate;
	private String lcCodes;
	
	public int getMlCode() {
		return mlCode;
	}

	public void setMlCode(int mlCode) {
		this.mlCode = mlCode;
	}

	public int getLcCode() {
		return lcCode;
	}

	public String getLcCodes() {
		return lcCodes;
	}

	public void setLcCodes(String lcCodes) {
		this.lcCodes = lcCodes;
	}

	public void setLcCode(int lcCode) {
		this.lcCode = lcCode;
	}

	public String getMlIssueDate() {
		return mlIssueDate;
	}

	public void setMlIssueDate(String mlIssueDate) {
		this.mlIssueDate = mlIssueDate;
	}
	
	public int getMmCode() {
		return mmCode;
	}

	public void setMmCode(int mmCode) {
		this.mmCode = mmCode;
	}

	@Override
	public String toString() {
		return "MemberLicense [mlCode=" + mlCode + ", mmCode=" + mmCode + ", lcCode=" + lcCode + ", mlIssueDate="
				+ mlIssueDate + ", lcCodes=" + lcCodes + "]";
	}
		
}