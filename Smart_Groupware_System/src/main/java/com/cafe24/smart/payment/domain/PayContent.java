package com.cafe24.smart.payment.domain;

import java.util.List;

//급여상세
public class PayContent {
	private int pcCode;
	private int mmCode;
	private String pcDate;
	private List<Pay> payList;
	private int paMmCode;
	
	public int getPcCode() {
		return pcCode;
	}

	public void setPcCode(int pcCode) {
		this.pcCode = pcCode;
	}
	
	public int getMmCode() {
		return mmCode;
	}
	
	public void setMmCode(int mmCode) {
		this.mmCode = mmCode;
	}
	
	public String getPcDate() {
		return pcDate;
	}

	public void setPcDate(String pcDate) {
		this.pcDate = pcDate;
	}

	public List<Pay> getPayList() {
		return payList;
	}

	public void setPayList(List<Pay> payList) {
		this.payList = payList;
	}

	public int getPaMmCode() {
		return paMmCode;
	}
	
	public void setPaMmCode(int paMmCode) {
		this.paMmCode = paMmCode;
	}

	@Override
	public String toString() {
		return "PayContent [pcCode=" + pcCode + ", mmCode=" + mmCode + ", pcDate=" + pcDate + ", payList=" + payList
				+ ", paMmCode=" + paMmCode + "]";
	}
}