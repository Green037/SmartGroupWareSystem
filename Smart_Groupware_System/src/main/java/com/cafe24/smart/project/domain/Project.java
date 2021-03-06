package com.cafe24.smart.project.domain;

import java.util.List;

import com.cafe24.smart.wbs.domain.Wbs;

//프로젝트
public class Project {
	private int prCode;
	private int prMemberCode;
	private int dftCode;
	private String prName;
	private int prMember;
	private int prMoney;
	private String prGoal;
	private String prProgress;
	private String prCate;
	private String prRestration;
	private String prStartDay;
	private String prEndDay;
	private String prForProgress;
	private String prFinishCheck;
	private List<Wbs> wbs;
	private String prReport;
	private String mmName;

	public String getMmName() {
		return mmName;
	}

	public void setMmName(String mmName) {
		this.mmName = mmName;
	}

	public String getPrReport() {
		return prReport;
	}

	public void setPrReport(String prReport) {
		this.prReport = prReport;
	}

	public List<Wbs> getWbs() {
		return wbs;
	}

	public void setWbs(List<Wbs> wbs) {
		this.wbs = wbs;
	}

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

	public int getDftCode() {
		return dftCode;
	}

	public void setDftCode(int dftCode) {
		this.dftCode = dftCode;
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

	public String getPrForProgress() {
		return prForProgress;
	}

	public void setPrForProgress(String prForProgress) {
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
		return "Project [prCode=" + prCode + ", prMemberCode=" + prMemberCode + ", dftCode=" + dftCode + ", prName="
				+ prName + ", prMember=" + prMember + ", prMoney=" + prMoney + ", prGoal=" + prGoal + ", prProgress="
				+ prProgress + ", prCate=" + prCate + ", prRestration=" + prRestration + ", prStartDay=" + prStartDay
				+ ", prEndDay=" + prEndDay + ", prForProgress=" + prForProgress + ", prFinishCheck=" + prFinishCheck
				+ ", wbs=" + wbs + ", prReport=" + prReport + ", mmName=" + mmName + "]";
	}
}