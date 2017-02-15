package com.cafe24.smart.project.domain;

//프로젝트
public class Project {
	private int prCode;
	private int prMemberCode;
	private int drfCode;
	private String prName;
	private int prMember;
	private int prMoney;
	private String prGoal;
	private String prProgress;
	private String prCate;
	private String prRestration;
	private String prStartDay;
	private String prEndDay;
	private boolean prForProgress;
	private String prFinishCheck;
	
	public int getPrCode() {
		return prCode;
	}
	
	public void setPrCode(int prCode) {
		this.prCode = prCode;
	}
	
	public int getPrMemberCode() {
		return prMemberCode;
	}
	
	public void setPrMemberCode(int prMemberCode) {
		this.prMemberCode = prMemberCode;
	}
	
	public int getDrfCode() {
		return drfCode;
	}
	
	public void setDrfCode(int drfCode) {
		this.drfCode = drfCode;
	}
	
	public String getPrName() {
		return prName;
	}
	
	public void setPrName(String prName) {
		this.prName = prName;
	}
	
	public int getPrMember() {
		return prMember;
	}
	
	public void setPrMember(int prMember) {
		this.prMember = prMember;
	}
	
	public int getPrMoney() {
		return prMoney;
	}
	
	public void setPrMoney(int prMoney) {
		this.prMoney = prMoney;
	}
	
	public String getPrGoal() {
		return prGoal;
	}

	public void setPrGoal(String prGoal) {
		this.prGoal = prGoal;
	}
	
	public String getPrProgress() {
		return prProgress;
	}
	
	public void setPrProgress(String prProgress) {
		this.prProgress = prProgress;
	}
	
	public String getPrCate() {
		return prCate;
	}
	
	public void setPrCate(String prCate) {
		this.prCate = prCate;
	}
	
	public String getPrRestration() {
		return prRestration;
	}
	
	public void setPrRestration(String prRestration) {
		this.prRestration = prRestration;
	}
	
	public String getPrStartDay() {
		return prStartDay;
	}
	
	public void setPrStartDay(String prStartDay) {
		this.prStartDay = prStartDay;
	}
	
	public String getPrEndDay() {
		return prEndDay;
	}
	
	public void setPrEndDay(String prEndDay) {
		this.prEndDay = prEndDay;
	}
	
	public boolean isPrForProgress() {
		return prForProgress;
	}
	
	public void setPrForProgress(boolean prForProgress) {
		this.prForProgress = prForProgress;
	}
	
	public String getPrFinishCheck() {
		return prFinishCheck;
	}
	
	public void setPrFinishCheck(String prFinishCheck) {
		this.prFinishCheck = prFinishCheck;
	}
	
	@Override
	public String toString() {
		return "Project [prCode=" + prCode + ", prMemberCode=" + prMemberCode + ", drfCode=" + drfCode + ", prName="
				+ prName + ", prMember=" + prMember + ", prMoney=" + prMoney + ", prGoal=" + prGoal + ", prProgress="
				+ prProgress + ", prCate=" + prCate + ", prRestration=" + prRestration + ", prStartDay=" + prStartDay
				+ ", prEndDay=" + prEndDay + ", prForProgress=" + prForProgress + ", prFinishCheck=" + prFinishCheck
				+ "]";
	}
}