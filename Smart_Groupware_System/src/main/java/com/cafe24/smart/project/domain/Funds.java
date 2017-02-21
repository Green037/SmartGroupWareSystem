package com.cafe24.smart.project.domain;

//자금
public class Funds {
	private int fuCode;
	private int prCode;
	private String fuHistory;
	private String fuExpectedMoney;
	private int fuUsedMoney;
	private String fuAddReason;
	private String fuDraftCheck;

	public int getFuCode() {
		return fuCode;
	}
	
	public void setFuCode(int fuCode) {
		this.fuCode = fuCode;
	}
	
	public int getPrCode() {
		return prCode;
	}

	public void setPrCode(int prCode) {
		this.prCode = prCode;
	}

	public String getFuHistory() {
		return fuHistory;
	}
	
	public void setFuHistory(String fuHistory) {
		this.fuHistory = fuHistory;
	}
	
	public String getFuExpectedMoney() {
		return fuExpectedMoney;
	}

	public void setFuExpectedMoney(String fuExpectedMoney) {
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

	public String getFuDraftCheck() {
		return fuDraftCheck;
	}

	public void setFuDraftCheck(String fuDraftCheck) {
		this.fuDraftCheck = fuDraftCheck;
	}

	@Override
	public String toString() {
		return "Funds [fuCode=" + fuCode + ", prCode=" + prCode + ", fuHistory=" + fuHistory + ", fuExpectedMoney="
				+ fuExpectedMoney + ", fuUsedMoney=" + fuUsedMoney + ", fuAddReason=" + fuAddReason + ", fuDraftCheck="
				+ fuDraftCheck + "]";
	}
}