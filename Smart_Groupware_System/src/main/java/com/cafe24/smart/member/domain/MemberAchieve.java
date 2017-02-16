package com.cafe24.smart.member.domain;

//사원 학력
public class MemberAchieve {
	private int mcCode;
	private int mmCode;
	private int acCode;
	private String mcSchoolName;
	private String mcAdmissionDate;
	private String mcGraduationDate;
	private String mcMajor;
	private double mcJumsu;
	private String mcGrade;
	
	public int getMcCode() {
		return mcCode;
	}
	
	public void setMcCode(int mcCode) {
		this.mcCode = mcCode;
	}
	
	public int getAcCode() {
		return acCode;
	}
	
	public void setAcCode(int acCode) {
		this.acCode = acCode;
	}
	
	public String getMcSchoolName() {
		return mcSchoolName;
	}
	
	public void setMcSchoolName(String mcSchoolName) {
		this.mcSchoolName = mcSchoolName;
	}
	
	public String getMcAdmissionDate() {
		return mcAdmissionDate;
	}
	
	public void setMcAdmissionDate(String mcAdmissionDate) {
		this.mcAdmissionDate = mcAdmissionDate;
	}
	
	public String getMcGraduationDate() {
		return mcGraduationDate;
	}
	
	public void setMcGraduationDate(String mcGraduationDate) {
		this.mcGraduationDate = mcGraduationDate;
	}
	
	public String getMcMajor() {
		return mcMajor;
	}

	public void setMcMajor(String mcMajor) {
		this.mcMajor = mcMajor;
	}
	
	public double getMcJumsu() {
		return mcJumsu;
	}
	
	public void setMcJumsu(double mcJumsu) {
		this.mcJumsu = mcJumsu;
	}
	
	public String getMcGrade() {
		return mcGrade;
	}
	
	public void setMcGrade(String mcGrade) {
		this.mcGrade = mcGrade;
	}
	
	public int getmmCode() {
		return mmCode;
	}
	
	public void setmmCode(int mmCode) {
		this.mmCode = mmCode;
	}

	@Override
	public String toString() {
		return "MemberAchieve [mcCode=" + mcCode + ", acCode=" + acCode + ", mcSchoolName=" + mcSchoolName
				+ ", mcAdmissionDate=" + mcAdmissionDate + ", mcGraduationDate=" + mcGraduationDate + ", mcMajor="
				+ mcMajor + ", mcJumsu=" + mcJumsu + ", mcGrade=" + mcGrade + ", mmCode=" + mmCode + "]";
	}

	
}