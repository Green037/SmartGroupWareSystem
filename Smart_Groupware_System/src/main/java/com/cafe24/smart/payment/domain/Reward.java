package com.cafe24.smart.payment.domain;

//인사 고과
public class Reward {
	private int reCode;
	private int prCode;
	private int dpCode;
	private int ptCode;
	private int ctCode;
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
	
	public int getDpCode() {
		return dpCode;
	}
	
	public void setDpCode(int dpCode) {
		this.dpCode = dpCode;
	}

	public int getPtCode() {
		return ptCode;
	}
	
	public void setPtCode(int ptCode) {
		this.ptCode = ptCode;
	}
	
	public int getCtCode() {
		return ctCode;
	}
	
	public void setCtCode(int ctCode) {
		this.ctCode = ctCode;
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

	public int getPrCode() {
		return prCode;
	}
	
	public void setPrCode(int prCode) {
		this.prCode = prCode;
	}
	
	@Override
	public String toString() {
		return "Reward [reCode=" + reCode + ", dpCode=" + dpCode + ", ptCode=" + ptCode + ", ctCode=" + ctCode
				+ ", mmCode=" + mmCode + ", reGrade=" + reGrade + ", reDate=" + reDate + ", reDocument=" + reDocument
				+ ", reMmCode=" + reMmCode + ", prCode=" + prCode + "]";
	}
}