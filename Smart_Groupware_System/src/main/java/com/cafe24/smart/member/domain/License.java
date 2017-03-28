package com.cafe24.smart.member.domain;

//자격증
public class License {
	private int lcCode;
	private String lcName;
	private String lcOrganization;
	private String lcType;
	private String lcNote;
	
	
	public int getLcCode() {
		return lcCode;
	}
	
	public void setLcCode(int lcCode) {
		this.lcCode = lcCode;
	}
	
	public String getLcName() {
		return lcName;
	}
	
	public void setLcName(String lcName) {
		this.lcName = lcName;
	}
	
	public String getLcOrganization() {
		return lcOrganization;
	}
	
	public void setLcOrganization(String lcOrganization) {
		this.lcOrganization = lcOrganization;
	}
	
	public String getLcType() {
		return lcType;
	}
	
	public void setLcType(String lcType) {
		this.lcType = lcType;
	}
	
	public String getLcNote() {
		return lcNote;
	}
	
	public void setLcNote(String lcNote) {
		this.lcNote = lcNote;
	}

	@Override
	public String toString() {
		return "License [lcCode=" + lcCode + ", lcName=" + lcName + ", lcOrganization=" + lcOrganization + ", lcType="
				+ lcType + ", lcNote=" + lcNote + "]";
	}
}