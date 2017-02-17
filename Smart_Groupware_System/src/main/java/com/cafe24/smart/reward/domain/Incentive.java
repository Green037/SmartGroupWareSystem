package com.cafe24.smart.reward.domain;

//성과급
public class Incentive {
	private int inCode;
	private int reDate;
	private int mmCode;
	private String inKind;
	private int inBonus;
	private boolean inPossible;
	private String inGroup;
	private String inDate;
	private int inMmCode;
	
	public int getInCode() {
		return inCode;
	}
	
	public void setInCode(int inCode) {
		this.inCode = inCode;
	}
	
	public int getReDate() {
		return reDate;
	}
	
	public void setReDate(int reDate) {
		this.reDate = reDate;
	}
	
	public int getMmCode() {
		return mmCode;
	}
	
	public void setMmCode(int mmCode) {
		this.mmCode = mmCode;
	}
	
	public String getInKind() {
		return inKind;
	}

	public void setInKind(String inKind) {
		this.inKind = inKind;
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

	public String getInGroup() {
		return inGroup;
	}
	
	public void setInGroup(String inGroup) {
		this.inGroup = inGroup;
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
		return "Incentive [inCode=" + inCode + ", reDate=" + reDate + ", mmCode=" + mmCode + ", inKind=" + inKind
				+ ", inBonus=" + inBonus + ", inPossible=" + inPossible + ", inGroup=" + inGroup + ", inDate=" + inDate
				+ ", inMmCode=" + inMmCode + "]";
	}
}