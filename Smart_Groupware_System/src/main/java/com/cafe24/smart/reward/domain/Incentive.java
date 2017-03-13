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

	public Incentive setInCode(int inCode) {
		this.inCode = inCode;

		return this;
	}

	public int getReCode() {
		return reCode;
	}

	public Incentive setReCode(int reCode) {
		this.reCode = reCode;

		return this;
	}

	public int getMmCode() {
		return mmCode;
	}

	public Incentive setMmCode(int mmCode) {
		this.mmCode = mmCode;

		return this;
	}

	public int getInBonus() {
		return inBonus;
	}

	public Incentive setInBonus(int inBonus) {
		this.inBonus = inBonus;

		return this;
	}

	public boolean isInPossible() {
		return inPossible;
	}

	public Incentive setInPossible(boolean inPossible) {
		this.inPossible = inPossible;

		return this;
	}

	public String getInDate() {
		return inDate;
	}

	public Incentive setInDate(String inDate) {
		this.inDate = inDate;

		return this;
	}

	public int getInMmCode() {
		return inMmCode;
	}

	public Incentive setInMmCode(int inMmCode) {
		this.inMmCode = inMmCode;

		return this;
	}

	@Override
	public String toString() {
		return "Incentive [inCode=" + inCode + ", reCode=" + reCode + ", mmCode=" + mmCode + ", inBonus=" + inBonus
				+ ", inPossible=" + inPossible + ", inDate=" + inDate + ", inMmCode=" + inMmCode + "]";
	}
}