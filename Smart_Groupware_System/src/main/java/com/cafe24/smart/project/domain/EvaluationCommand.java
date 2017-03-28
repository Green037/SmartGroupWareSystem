package com.cafe24.smart.project.domain;

public class EvaluationCommand {
	private String evIntegritys;
	private String evProfessionals;
	private String evSociabilitys;
	private String evEvals;
	private String mmCodes;
	private String evTotalScores;
	
	@Override
	public String toString() {
		return "EvaluationCommand [evIntegritys=" + evIntegritys + ", evProfessionals=" + evProfessionals
				+ ", evSociabilitys=" + evSociabilitys + ", evEvals=" + evEvals + ", mmCodes=" + mmCodes
				+ ", evTotalScores=" + evTotalScores + "]";
	}
	public String getEvIntegritys() {
		return evIntegritys;
	}
	public void setEvIntegritys(String evIntegritys) {
		this.evIntegritys = evIntegritys;
	}
	public String getEvProfessionals() {
		return evProfessionals;
	}
	public void setEvProfessionals(String evProfessionals) {
		this.evProfessionals = evProfessionals;
	}
	public String getEvSociabilitys() {
		return evSociabilitys;
	}
	public void setEvSociabilitys(String evSociabilitys) {
		this.evSociabilitys = evSociabilitys;
	}
	public String getEvEvals() {
		return evEvals;
	}
	public void setEvEvals(String evEvals) {
		this.evEvals = evEvals;
	}
	public String getMmCodes() {
		return mmCodes;
	}
	public void setMmCodes(String mmCodes) {
		this.mmCodes = mmCodes;
	}
	public String getEvTotalScores() {
		return evTotalScores;
	}
	public void setEvTotalScores(String evTotalScores) {
		this.evTotalScores = evTotalScores;
	}
	
	
}
