package com.cafe24.smart.payment.domain;

//급여상세
public class PayContent {
	private int pcCode;
	private int mmCode;
	private String pcDate;
	private int mmDailyPay;
	private int inAmount;
	private int eiAmount;
	private int nhiAmount;
	private int ppAmount;
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

	public int getMmDailyPay() {
		return mmDailyPay;
	}

	public void setMmDailyPay(int mmDailyPay) {
		this.mmDailyPay = mmDailyPay;
	}

	public int getInAmount() {
		return inAmount;
	}

	public void setInAmount(int inAmount) {
		this.inAmount = inAmount;
	}

	public int getEiAmount() {
		return eiAmount;
	}

	public void setEiAmount(int eiAmount) {
		this.eiAmount = eiAmount;
	}

	public int getNhiAmount() {
		return nhiAmount;
	}

	public void setNhiAmount(int nhiAmount) {
		this.nhiAmount = nhiAmount;
	}

	public int getPpAmount() {
		return ppAmount;
	}

	public void setPpAmount(int ppAmount) {
		this.ppAmount = ppAmount;
	}

	public int getPaMmCode() {
		return paMmCode;
	}

	public void setPaMmCode(int paMmCode) {
		this.paMmCode = paMmCode;
	}

	@Override
	public String toString() {
		return "PayContent [pcCode=" + pcCode + ", mmCode=" + mmCode + ", pcDate=" + pcDate + ", mmDailyPay="
				+ mmDailyPay + ", inAmount=" + inAmount + ", eiAmount=" + eiAmount + ", nhiAmount=" + nhiAmount
				+ ", ppAmount=" + ppAmount + ", paMmCode=" + paMmCode + "]";
	}
}