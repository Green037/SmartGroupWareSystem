package com.cafe24.smart.payment.domain;

//급여
public class PaymentView {
	private int paCode;
	private int pcCode;
	private int cmCode;
	private int mmDailyPay;
	private int paDay;
	private String inGruop;
	private int paInsurance;
	private int paIncentive;
	private int paSalary;
	private int paSumSalary;
	private int paEmployee;
	private int paOwner;
	private int finalSalary;
	private String paCalculateDate;
	private String mmBank;
	private String mmAccount;
	private boolean paPossible;
	private String paDate;
	private int paMmCode;

	public int getPaCode() {
		return paCode;
	}

	public void setPaCode(int paCode) {
		this.paCode = paCode;
	}

	public int getPcCode() {
		return pcCode;
	}
	
	public void setPcCode(int pcCode) {
		this.pcCode = pcCode;
	}

	public int getCmCode() {
		return cmCode;
	}
	
	public void setCmCode(int cmCode) {
		this.cmCode = cmCode;
	}
	
	public int getMmDailyPay() {
		return mmDailyPay;
	}
	
	public void setMmDailyPay(int mmDailyPay) {
		this.mmDailyPay = mmDailyPay;
	}
		
	public int getPaDay() {
		return paDay;
	}

	public void setPaDay(int paDay) {
		this.paDay = paDay;
	}

	public String getInGruop() {
		return inGruop;
	}

	public void setInGruop(String inGruop) {
		this.inGruop = inGruop;
	}

	public int getPaInsurance() {
		return paInsurance;
	}
	
	public void setPaInsurance(int paInsurance) {
		this.paInsurance = paInsurance;
	}

	public int getPaIncentive() {
		return paIncentive;
	}

	public void setPaIncentive(int paIncentive) {
		this.paIncentive = paIncentive;
	}

	public int getPaSalary() {
		return paSalary;
	}

	public void setPaSalary(int paSalary) {
		this.paSalary = paSalary;
	}
	
	public int getPaSumSalary() {
		return paSumSalary;
	}

	public void setPaSumSalary(int paSumSalary) {
		this.paSumSalary = paSumSalary;
	}
	
	public int getPaEmployee() {
		return paEmployee;
	}

	public void setPaEmployee(int paEmployee) {
		this.paEmployee = paEmployee;
	}

	public int getPaOwner() {
		return paOwner;
	}

	public void setPaOwner(int paOwner) {
		this.paOwner = paOwner;
	}
	
	public int getFinalSalary() {
		return finalSalary;
	}
	
	public void setFinalSalary(int finalSalary) {
		this.finalSalary = finalSalary;
	}
	
	public String getPaCalculateDate() {
		return paCalculateDate;
	}

	public void setPaCalculateDate(String paCalculateDate) {
		this.paCalculateDate = paCalculateDate;
	}

	public String getMmBank() {
		return mmBank;
	}

	public void setMmBank(String mmBank) {
		this.mmBank = mmBank;
	}
	
	public String getMmAccount() {
		return mmAccount;
	}
	
	public void setMmAccount(String mmAccount) {
		this.mmAccount = mmAccount;
	}
	
	public boolean isPaPossible() {
		return paPossible;
	}

	public void setPaPossible(boolean paPossible) {
		this.paPossible = paPossible;
	}
	
	public String getPaDate() {
		return paDate;
	}
	
	public void setPaDate(String paDate) {
		this.paDate = paDate;
	}
	
	public int getPaMmCode() {
		return paMmCode;
	}

	public void setPaMmCode(int paMmCode) {
		this.paMmCode = paMmCode;
	}

	@Override
	public String toString() {
		return "PaymentView [paCode=" + paCode + ", pcCode=" + pcCode + ", cmCode=" + cmCode + ", mmDailyPay="
				+ mmDailyPay + ", paDay=" + paDay + ", inGruop=" + inGruop + ", paInsurance=" + paInsurance
				+ ", paIncentive=" + paIncentive + ", paSalary=" + paSalary + ", paSumSalary=" + paSumSalary
				+ ", paEmployee=" + paEmployee + ", paOwner=" + paOwner + ", finalSalary=" + finalSalary
				+ ", paCalculateDate=" + paCalculateDate + ", mmBank=" + mmBank + ", mmAccount=" + mmAccount
				+ ", paPossible=" + paPossible + ", paDate=" + paDate + ", paMmCode=" + paMmCode + "]";
	}
}