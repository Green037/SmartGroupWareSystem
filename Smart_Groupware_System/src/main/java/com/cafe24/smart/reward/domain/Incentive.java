package com.cafe24.smart.reward.domain;

//성과급
public class Incentive {
	private int inCode;
	private int reCode;
	private int mmCode;
	private int inBonus;
	private boolean inPossible;
	private String inDate;
	private int inMmCode;

	public int getInCode() {
		return inCode;
	}

	public void setInCode(int inCode) {
		this.inCode = inCode;
	}

	public int getReCode() {
		return reCode;
	}

	public void setReCode(int reCode) {
		this.reCode = reCode;
	}

	public int getMmCode() {
		return mmCode;
	}

	public void setMmCode(int mmCode) {
		this.mmCode = mmCode;
	}

	public int getInBonus() {
		return inBonus;
	}

	public void setInBonus(int inBonus) {
		this.inBonus = inBonus;
	}

	public boolean isInPossible() {
		return inPossible;
	}

	public void setInPossible(boolean inPossible) {
		this.inPossible = inPossible;
	}

	public String getInDate() {
		return inDate;
	}

	public void setInDate(String inDate) {
		this.inDate = inDate;
	}

	public int getInMmCode() {
		return inMmCode;
	}

	public void setInMmCode(int inMmCode) {
		this.inMmCode = inMmCode;
	}

	@Override
	public String toString() {
		return "Incentive [inCode=" + inCode + ", reCode=" + reCode + ", mmCode=" + mmCode + ", inBonus=" + inBonus
				+ ", inPossible=" + inPossible + ", inDate=" + inDate + ", inMmCode=" + inMmCode + "]";
	}
}