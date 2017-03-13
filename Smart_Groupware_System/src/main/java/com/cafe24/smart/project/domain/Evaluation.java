package com.cafe24.smart.project.domain;

//평가
public class Evaluation {
	private int evCode;
	private int evIntegrity;
	private int evProfessional;
	private int evSociability;
	private String evEval;
	private int prCode;
	private int mmCode;
	private int evTotalScore;
	
	public int getEvCode() {
		return evCode;
	}
	public void setEvCode(int evCode) {
		this.evCode = evCode;
	}
	public int getEvIntegrity() {
		return evIntegrity;
	}
	public void setEvIntegrity(int evIntegrity) {
		this.evIntegrity = evIntegrity;
	}
	public int getEvProfessional() {
		return evProfessional;
	}
	public void setEvProfessional(int evProfessional) {
		this.evProfessional = evProfessional;
	}
	public int getEvSociability() {
		return evSociability;
	}
	public void setEvSociability(int evSociability) {
		this.evSociability = evSociability;
	}
	public String getEvEval() {
		return evEval;
	}
	public void setEvEval(String evEval) {
		this.evEval = evEval;
	}
	public int getPrCode() {
		return prCode;
	}
	public void setPrCode(int prCode) {
		this.prCode = prCode;
	}
	public int getMmCode() {
		return mmCode;
	}
	public void setMmCode(int mmCode) {
		this.mmCode = mmCode;
	}
	public int getEvTotalScore() {
		return evTotalScore;
	}
	public void setEvTotalScore(int evTotalScore) {
		this.evTotalScore = evTotalScore;
	}
	@Override
	public String toString() {
		return "Evaluation [evCode=" + evCode + ", evIntegrity=" + evIntegrity + ", evProfessional=" + evProfessional
				+ ", evSociability=" + evSociability + ", evEval=" + evEval + ", prCode=" + prCode + ", mmCode="
				+ mmCode + ", evTotalScore=" + evTotalScore + "]";
	}

}