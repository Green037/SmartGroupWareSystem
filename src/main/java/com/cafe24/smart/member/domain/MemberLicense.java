package com.cafe24.smart.member.domain;

//사원 자격증
public class MemberLicense {
	private int mlCode;
	private String lcCode;
	private String mlIssueDate;

	public int getMlCode() {
		return mlCode;
	}

	public void setMlCode(int mlCode) {
		this.mlCode = mlCode;
	}

	public String getLcCode() {
		return lcCode;
	}

	public void setLcCode(String lcCode) {
		this.lcCode = lcCode;
	}

	public String getMlIssueDate() {
		return mlIssueDate;
	}

	public void setMlIssueDate(String mlIssueDate) {
		this.mlIssueDate = mlIssueDate;
	}

	@Override
	public String toString() {
		return "MemberLicense [mlCode=" + mlCode + ", lcCode=" + lcCode + ", mlIssueDate=" + mlIssueDate + "]";
	}
}