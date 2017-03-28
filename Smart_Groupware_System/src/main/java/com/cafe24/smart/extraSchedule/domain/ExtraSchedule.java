package com.cafe24.smart.extraSchedule.domain;

//근외일정
public class ExtraSchedule {
	private int esCode;
	private int mmCode;
	private String esStartDate;
	private String esEndDate;
	private String esCostSort;
	private String esNote;
	private String mmName;

	public int getEsCode() {
		return esCode;
	}

	public void setEsCode(int esCode) {
		this.esCode = esCode;
	}

	public int getMmCode() {
		return mmCode;
	}

	public void setMmCode(int mmCode) {
		this.mmCode = mmCode;
	}

	public String getEsStartDate() {
		return esStartDate;
	}

	public void setEsStartDate(String esStartDate) {
		this.esStartDate = esStartDate;
	}

	public String getEsEndDate() {
		return esEndDate;
	}

	public void setEsEndDate(String esEndDate) {
		this.esEndDate = esEndDate;
	}

	public String getEsCostSort() {
		return esCostSort;
	}

	public void setEsCostSort(String esCostSort) {
		this.esCostSort = esCostSort;
	}

	public String getEsNote() {
		return esNote;
	}

	public void setEsNote(String esNote) {
		this.esNote = esNote;
	}

	public String getMmName() {
		return mmName;
	}

	public void setMmName(String mmName) {
		this.mmName = mmName;
	}

	@Override
	public String toString() {
		return "ExtraSchedule [esCode=" + esCode + ", mmCode=" + mmCode + ", esStartDate=" + esStartDate
				+ ", esEndDate=" + esEndDate + ", esCostSort=" + esCostSort + ", esNote=" + esNote + ", mmName="
				+ mmName + "]";
	}
}