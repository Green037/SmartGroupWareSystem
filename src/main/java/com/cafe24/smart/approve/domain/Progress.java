package com.cafe24.smart.approve.domain;

//진행
public class Progress {
	private int proCode;
	private int dftCode;
	private int mmCode;
	private int docCode;
	private int aprCode;
	private String proTime;
	private String proReason;
	private String proState;
	private boolean proPersonState;
	private int proTurn;
	private String proRealTime;
	
	public int getProCode() {
		return proCode;
	}
	
	public void setProCode(int proCode) {
		this.proCode = proCode;
	}
	
	public int getDftCode() {
		return dftCode;
	}
	
	public void setDftCode(int dftCode) {
		this.dftCode = dftCode;
	}
	
	public int getMmCode() {
		return mmCode;
	}
	
	public void setMmCode(int mmCode) {
		this.mmCode = mmCode;
	}
	
	public int getDocCode() {
		return docCode;
	}

	public void setDocCode(int docCode) {
		this.docCode = docCode;
	}
	
	public int getAprCode() {
		return aprCode;
	}

	public void setAprCode(int aprCode) {
		this.aprCode = aprCode;
	}

	public String getProTime() {
		return proTime;
	}

	public void setProTime(String proTime) {
		this.proTime = proTime;
	}
	
	public String getProReason() {
		return proReason;
	}
	
	public void setProReason(String proReason) {
		this.proReason = proReason;
	}

	public String getProState() {
		return proState;
	}

	public void setProState(String proState) {
		this.proState = proState;
	}
	
	public boolean isProPersonState() {
		return proPersonState;
	}
	
	public void setProPersonState(boolean proPersonState) {
		this.proPersonState = proPersonState;
	}
	
	public int getProTurn() {
		return proTurn;
	}
	
	public void setProTurn(int proTurn) {
		this.proTurn = proTurn;
	}

	public String getProRealTime() {
		return proRealTime;
	}

	public void setProRealTime(String proRealTime) {
		this.proRealTime = proRealTime;
	}
	
	@Override
	public String toString() {
		return "Progress [proCode=" + proCode + ", dftCode=" + dftCode + ", mmCode=" + mmCode + ", docCode=" + docCode
				+ ", aprCode=" + aprCode + ", proTime=" + proTime + ", proReason=" + proReason + ", proState="
				+ proState + ", proPersonState=" + proPersonState + ", proTurn=" + proTurn + ", proRealTime="
				+ proRealTime + "]";
	}
}