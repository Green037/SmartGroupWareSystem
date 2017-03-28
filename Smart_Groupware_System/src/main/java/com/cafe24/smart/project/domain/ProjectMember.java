package com.cafe24.smart.project.domain;

//프로젝트 인력
public class ProjectMember {
	private int pmCode;
	private int prCode;
	private int mmCode;
	private String pmLevel;
	private String pmField;
	private String pmStartDate;
	private String pmEndDate;
	private String pmNote;
	private String pmApproval;
	private String mmName;
	

	public String getMmName() {
		return mmName;
	}

	public void setMmName(String mmName) {
		this.mmName = mmName;
	}

	public String getPmApproval() {
		return pmApproval;
	}

	public void setPmApproval(String pmApproval) {
		this.pmApproval = pmApproval;
	}

	public int getPmCode() {
		return pmCode;
	}

	public void setPmCode(int pmCode) {
		this.pmCode = pmCode;
	}

	public int getPrCode() {
		return prCode;
	}

	public void setPrCode(int prCode) {
		this.prCode = prCode;
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
		return "ProjectMember [pmCode=" + pmCode + ", prCode=" + prCode + ", mmCode=" + mmCode + ", pmLevel=" + pmLevel
				+ ", pmField=" + pmField + ", pmStartDate=" + pmStartDate + ", pmEndDate=" + pmEndDate + ", pmNote="
				+ pmNote + ", pmApproval=" + pmApproval + ", mmName=" + mmName + "]";
	}

}