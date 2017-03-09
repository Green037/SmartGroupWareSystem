package com.cafe24.smart.reward.domain;

//성과급
public class Incentive {
	private int inCode;
	private String reDate;
	private int mmCode;
	private String inKind;
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
	
	public String getReDate() {
		return reDate;
	}
	
	public Incentive setReDate(String reDate) {
		this.reDate = reDate;
		
		return this;
	}
	
	public int getMmCode() {
		return mmCode;
	}
	
	public Incentive setMmCode(int mmCode) {
		this.mmCode = mmCode;
		
		return this;
	}
	
	public String getInKind() {
		return inKind;
	}

	public Incentive setInKind(String inKind) {
		this.inKind = inKind;
		
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
		return "Incentive [inCode=" + inCode + ", reDate=" + reDate + ", mmCode=" + mmCode + ", inKind=" + inKind
				+ ", inBonus=" + inBonus + ", inPossible=" + inPossible + ", inDate=" + inDate
				+ ", inMmCode=" + inMmCode + "]";
	}
}