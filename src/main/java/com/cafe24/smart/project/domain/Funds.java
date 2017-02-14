package com.cafe24.smart.project.domain;

//자금
public class Funds {
	private int fuCode;
	private String fuHistory;
	private int fuExpectedMoney;
	private int fuUsedMoney;
	private String fuAddReason;
	private char fuDraftCheck;

	public int getFuCode() {
		return fuCode;
	}
	
	public void setFuCode(int fuCode) {
		this.fuCode = fuCode;
	}
	
	public String getFuHistory() {
		return fuHistory;
	}
	
	public void setFuHistory(String fuHistory) {
		this.fuHistory = fuHistory;
	}
	
	public int getFuExpectedMoney() {
		return fuExpectedMoney;
	}
	
	public void setFuExpectedMoney(int fuExpectedMoney) {
		this.fuExpectedMoney = fuExpectedMoney;
	}
	
	public int getFuUsedMoney() {
		return fuUsedMoney;
	}
	
	public void setFuUsedMoney(int fuUsedMoney) {
		this.fuUsedMoney = fuUsedMoney;
	}
	
	public String getFuAddReason() {
		return fuAddReason;
	}
	
	public void setFuAddReason(String fuAddReason) {
		this.fuAddReason = fuAddReason;
	}

	public char getFuDraftCheck() {
		return fuDraftCheck;
	}

	public void setFuDraftCheck(char fuDraftCheck) {
		this.fuDraftCheck = fuDraftCheck;
	}

	@Override
	public String toString() {
		return "Funds [fuCode=" + fuCode + ", fuHistory=" + fuHistory + ", fuExpectedMoney=" + fuExpectedMoney
				+ ", fuUsedMoney=" + fuUsedMoney + ", fuAddReason=" + fuAddReason + ", fuDraftCheck=" + fuDraftCheck
				+ "]";
	}
}