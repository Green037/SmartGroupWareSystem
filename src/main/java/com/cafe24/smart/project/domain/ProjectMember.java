package com.cafe24.smart.project.domain;

//프로젝트 인력
public class ProjectMember {
	private int pmCode;
	private int ptCode;
	private int dpCode;
	private int mmCode;
	private String pmLevel;
	private String pmField;
	private String pmStartDate;
	private String pmEndDate;
	private String pmNote;
	
	public int getPmCode() {
		return pmCode;
	}
	
	public void setPmCode(int pmCode) {
		this.pmCode = pmCode;
	}
	
	public int getPtCode() {
		return ptCode;
	}

	public void setPtCode(int ptCode) {
		this.ptCode = ptCode;
	}
	
	public int getDpCode() {
		return dpCode;
	}
	
	public void setDpCode(int dpCode) {
		this.dpCode = dpCode;
	}
	
	public int getMmCode() {
		return mmCode;
	}
	
	public void setMmCode(int mmCode) {
		this.mmCode = mmCode;
	}
	
	public String getPmLevel() {
		return pmLevel;
	}
	
	public void setPmLevel(String pmLevel) {
		this.pmLevel = pmLevel;
	}
	
	public String getPmField() {
		return pmField;
	}
	
	public void setPmField(String pmField) {
		this.pmField = pmField;
	}
	
	public String getPmStartDate() {
		return pmStartDate;
	}
	
	public void setPmStartDate(String pmStartDate) {
		this.pmStartDate = pmStartDate;
	}
	
	public String getPmEndDate() {
		return pmEndDate;
	}
	
	public void setPmEndDate(String pmEndDate) {
		this.pmEndDate = pmEndDate;
	}
	
	public String getPmNote() {
		return pmNote;
	}
	
	public void setPmNote(String pmNote) {
		this.pmNote = pmNote;
	}
	
	@Override
	public String toString() {
		return "ProjectMember [pmCode=" + pmCode + ", ptCode=" + ptCode + ", dpCode=" + dpCode + ", mmCode=" + mmCode
				+ ", pmLevel=" + pmLevel + ", pmField=" + pmField + ", pmStartDate=" + pmStartDate + ", pmEndDate="
				+ pmEndDate + ", pmNote=" + pmNote + "]";
	}
}