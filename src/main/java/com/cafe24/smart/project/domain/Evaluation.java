package com.cafe24.smart.project.domain;

//평가
public class Evaluation {
	private int evCode;
	private int prCode;
	private int pmCode;
	private int wbsCode;
	private int fuCode;
	private int evStandard1;
	private int evStandard2;
	private int evStandard3;
	private String evEval;
	
	public int getEvCode() {
		return evCode;
	}
	
	public void setEvCode(int evCode) {
		this.evCode = evCode;
	}
	
	public int getPrCode() {
		return prCode;
	}
	
	public void setPrCode(int prCode) {
		this.prCode = prCode;
	}
	
	public int getPmCode() {
		return pmCode;
	}
	
	public void setPmCode(int pmCode) {
		this.pmCode = pmCode;
	}
	
	public int getWbsCode() {
		return wbsCode;
	}
	
	public void setWbsCode(int wbsCode) {
		this.wbsCode = wbsCode;
	}
	
	public int getFuCode() {
		return fuCode;
	}
	
	public void setFuCode(int fuCode) {
		this.fuCode = fuCode;
	}
	
	public int getEvStandard1() {
		return evStandard1;
	}
	
	public void setEvStandard1(int evStandard1) {
		this.evStandard1 = evStandard1;
	}
	
	public int getEvStandard2() {
		return evStandard2;
	}
	
	public void setEvStandard2(int evStandard2) {
		this.evStandard2 = evStandard2;
	}
	
	public int getEvStandard3() {
		return evStandard3;
	}
	
	public void setEvStandard3(int evStandard3) {
		this.evStandard3 = evStandard3;
	}
	
	public String getEvEval() {
		return evEval;
	}
	
	public void setEvEval(String evEval) {
		this.evEval = evEval;
	}
	
	@Override
	public String toString() {
		return "Evaluation [evCode=" + evCode + ", prCode=" + prCode + ", pmCode=" + pmCode + ", wbsCode=" + wbsCode
				+ ", fuCode=" + fuCode + ", evStandard1=" + evStandard1 + ", evStandard2=" + evStandard2
				+ ", evStandard3=" + evStandard3 + ", evEval=" + evEval + "]";
	}
}