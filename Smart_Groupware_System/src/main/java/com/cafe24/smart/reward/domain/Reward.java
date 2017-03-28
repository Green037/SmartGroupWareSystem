package com.cafe24.smart.reward.domain;

//인사 고과
public class Reward {
	private int reCode;
	private int mmCode;
	private char reGrade;
	private String reDate;
	private String reDocument;
	private int reMmCode;
	
	public int getReCode() {
		return reCode;
	}
	
	public void setReCode(int reCode) {
		this.reCode = reCode;
	}
	
	public int getMmCode() {
		return mmCode;
	}
	
	public void setMmCode(int mmCode) {
		this.mmCode = mmCode;
	}

	public char getReGrade() {
		return reGrade;
	}

	public void setReGrade(char reGrade) {
		this.reGrade = reGrade;
	}

	public String getReDate() {
		return reDate;
	}
	
	public void setReDate(String reDate) {
		this.reDate = reDate;
	}

	public String getReDocument() {
		return reDocument;
	}

	public void setReDocument(String reDocument) {
		this.reDocument = reDocument;
	}
	
	public int getReMmCode() {
		return reMmCode;
	}
	
	public void setReMmCode(int reMmCode) {
		this.reMmCode = reMmCode;
	}
	
	@Override
	public String toString() {
		return "Reward [reCode=" + reCode + 
				", reGrade=" + reGrade + ", reDate=" + reDate + ", reDocument=" + reDocument
				+ ", reMmCode=" + reMmCode + "]";
	}
}