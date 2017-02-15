package com.cafe24.smart.member.domain;

//사원관리
public class Member {
	private int mmCode;	
	private int ctCode;
	private int ptCode;
	private int dpCode;
	private String mmName;
	private int mmDailyPay;
	private String mmJoinDate;
	private String resignDate;
	private int mmAnnualLeave;
	private boolean mmArmy;
	private String mmEmail;
	private boolean mmMarriage;
	private String mmPassword;
	private String mmSign;
	private String mmAddress;
	private String mmTel;
	private String mmBank;
	private String mmAccount;
	
	public int getMmCode() {
		return mmCode;
	}
	
	public void setMmCode(int mmCode) {
		this.mmCode = mmCode;
	}
	
	public int getCtCode() {
		return ctCode;
	}
	
	public void setCtCode(int ctCode) {
		this.ctCode = ctCode;
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

	public String getMmName() {
		return mmName;
	}

	public void setMmName(String mmName) {
		this.mmName = mmName;
	}

	public int getMmDailyPay() {
		return mmDailyPay;
	}

	public void setMmDailyPay(int mmDailyPay) {
		this.mmDailyPay = mmDailyPay;
	}

	public String getMmJoinDate() {
		return mmJoinDate;
	}

	public void setMmJoinDate(String mmJoinDate) {
		this.mmJoinDate = mmJoinDate;
	}

	public String getResignDate() {
		return resignDate;
	}

	public void setResignDate(String resignDate) {
		this.resignDate = resignDate;
	}

	public int getMmAnnualLeave() {
		return mmAnnualLeave;
	}

	public void setMmAnnualLeave(int mmAnnualLeave) {
		this.mmAnnualLeave = mmAnnualLeave;
	}

	public boolean isMmArmy() {
		return mmArmy;
	}

	public void setMmArmy(boolean mmArmy) {
		this.mmArmy = mmArmy;
	}

	public String getMmEmail() {
		return mmEmail;
	}

	public void setMmEmail(String mmEmail) {
		this.mmEmail = mmEmail;
	}

	public boolean isMmMarriage() {
		return mmMarriage;
	}

	public void setMmMarriage(boolean mmMarriage) {
		this.mmMarriage = mmMarriage;
	}

	public String getMmPassword() {
		return mmPassword;
	}

	public void setMmPassword(String mmPassword) {
		this.mmPassword = mmPassword;
	}

	public String getMmSign() {
		return mmSign;
	}

	public void setMmSign(String mmSign) {
		this.mmSign = mmSign;
	}

	public String getMmAddress() {
		return mmAddress;
	}

	public void setMmAddress(String mmAddress) {
		this.mmAddress = mmAddress;
	}

	public String getMmTel() {
		return mmTel;
	}
	
	public void setMmTel(String mmTel) {
		this.mmTel = mmTel;
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

	@Override
	public String toString() {
		return "Member [mmCode=" + mmCode + ", ctCode=" + ctCode + ", ptCode=" + ptCode + ", dpCode=" + dpCode
				+ ", mmName=" + mmName + ", mmDailyPay=" + mmDailyPay + ", mmJoinDate=" + mmJoinDate + ", resignDate="
				+ resignDate + ", mmAnnualLeave=" + mmAnnualLeave + ", mmArmy=" + mmArmy + ", mmEmail=" + mmEmail
				+ ", mmMarriage=" + mmMarriage + ", mmPassword=" + mmPassword + ", mmSign=" + mmSign + ", mmAddress="
				+ mmAddress + ", mmTel=" + mmTel + ", mmBank=" + mmBank + ", mmAccount=" + mmAccount + "]";
	}

	
}