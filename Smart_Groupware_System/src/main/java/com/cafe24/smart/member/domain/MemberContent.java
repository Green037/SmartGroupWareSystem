package com.cafe24.smart.member.domain;

// 개인정보조회를 위한 dto
public class MemberContent {
	
// memberManagement 테이블	
	private int mmCode;
	private int ctCode;
	private int ptCode;
	private int dpCode;
	private String mmName;
	private int mmDailyPay;
	private String mmJoinDate;
	private String mmResignDate;
	private int mmAnnualLeave;
	private int mmArmy;
	private String mmEmail;
	private int mmMarriage;
	private String mmSign;
	private String mmAddress;
	private String mmTel;
	private String mmBank;
	private String mmAccount;
//memberAchieve 테이블
	private int mcCode;
	private int acCode;
	private String acName;
	private String mcSchoolName;
	private String mcAdmissionDate;
	private String mcGraduationDate;
	private String mcMajor;
	private double mcJumsu;
	private String mcGrade;
// career 테이블
	private int crCode;
	private int maCode;
	private String maType;
	public String getMaType() {
		return maType;
	}
	public void setMaType(String maType) {
		this.maType = maType;
	}
	public String getMiType() {
		return miType;
	}
	public void setMiType(String miType) {
		this.miType = miType;
	}
	private int miCode;
	private String miType;
	private String crData;
	private String crService;
	private String crPastJoinDay;
	private String crPastResignDay;
	private String crResponsibility;
// MemberLicense 테이블
	private int mlCode;
	private int lcCode;
	private String mlIssueDate;
	private String ctType; // 계약형태분류
	private String ptName; // 직급이름
	private String dpName; // 부서 이름
	private String lcName; // 자격증이름
	private String lcOrganization; //자격증 설명
	private String lcType;		   //자격증 분류
	private String lcNote;		  // 자격증비고
	public int getMmCode() {
		return mmCode;
	}
	public void setMmCode(int mmCode) {
		this.mmCode = mmCode;
	}
	public int getCtCode() {
		return ctCode;
	}
	public void setCtCode(int ctCode) {
		this.ctCode = ctCode;
	}
	public int getPtCode() {
		return ptCode;
	}
	public void setPtCode(int ptCode) {
		this.ptCode = ptCode;
	}
	public int getDpCode() {
		return dpCode;
	}
	public void setDpCode(int dpCode) {
		this.dpCode = dpCode;
	}
	public String getMmName() {
		return mmName;
	}
	public void setMmName(String mmName) {
		this.mmName = mmName;
	}
	public int getMmDailyPay() {
		return mmDailyPay;
	}
	public void setMmDailyPay(int mmDailyPay) {
		this.mmDailyPay = mmDailyPay;
	}
	public String getMmJoinDate() {
		return mmJoinDate;
	}
	public void setMmJoinDate(String mmJoinDate) {
		this.mmJoinDate = mmJoinDate;
	}
	public String getMmResignDate() {
		return mmResignDate;
	}
	public void setMmResignDate(String mmResignDate) {
		this.mmResignDate = mmResignDate;
	}
	public int getMmAnnualLeave() {
		return mmAnnualLeave;
	}
	public void setMmAnnualLeave(int mmAnnualLeave) {
		this.mmAnnualLeave = mmAnnualLeave;
	}
	public int getMmArmy() {
		return mmArmy;
	}
	public void setMmArmy(int mmArmy) {
		this.mmArmy = mmArmy;
	}
	public String getMmEmail() {
		return mmEmail;
	}
	public void setMmEmail(String mmEmail) {
		this.mmEmail = mmEmail;
	}
	public int getMmMarriage() {
		return mmMarriage;
	}
	public void setMmMarriage(int mmMarriage) {
		this.mmMarriage = mmMarriage;
	}
	public String getMmSign() {
		return mmSign;
	}
	public void setMmSign(String mmSign) {
		this.mmSign = mmSign;
	}
	public String getMmAddress() {
		return mmAddress;
	}
	public void setMmAddress(String mmAddress) {
		this.mmAddress = mmAddress;
	}
	public String getMmTel() {
		return mmTel;
	}
	public void setMmTel(String mmTel) {
		this.mmTel = mmTel;
	}
	public String getMmBank() {
		return mmBank;
	}
	public void setMmBank(String mmBank) {
		this.mmBank = mmBank;
	}
	public String getMmAccount() {
		return mmAccount;
	}
	public void setMmAccount(String mmAccount) {
		this.mmAccount = mmAccount;
	}
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
	public String getAcName() {
		return acName;
	}
	public void setAcName(String acName) {
		this.acName = acName;
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
	public int getCrCode() {
		return crCode;
	}
	public void setCrCode(int crCode) {
		this.crCode = crCode;
	}
	public int getMaCode() {
		return maCode;
	}
	public void setMaCode(int maCode) {
		this.maCode = maCode;
	}
	public int getMiCode() {
		return miCode;
	}
	public void setMiCode(int miCode) {
		this.miCode = miCode;
	}
	public String getCrData() {
		return crData;
	}
	public void setCrData(String crData) {
		this.crData = crData;
	}
	public String getCrService() {
		return crService;
	}
	public void setCrService(String crService) {
		this.crService = crService;
	}
	public String getCrPastJoinDay() {
		return crPastJoinDay;
	}
	public void setCrPastJoinDay(String crPastJoinDay) {
		this.crPastJoinDay = crPastJoinDay;
	}
	public String getCrPastResignDay() {
		return crPastResignDay;
	}
	public void setCrPastResignDay(String crPastResignDay) {
		this.crPastResignDay = crPastResignDay;
	}
	public String getCrResponsibility() {
		return crResponsibility;
	}
	public void setCrResponsibility(String crResponsibility) {
		this.crResponsibility = crResponsibility;
	}
	public int getMlCode() {
		return mlCode;
	}
	public void setMlCode(int mlCode) {
		this.mlCode = mlCode;
	}
	public int getLcCode() {
		return lcCode;
	}
	public void setLcCode(int lcCode) {
		this.lcCode = lcCode;
	}
	public String getMlIssueDate() {
		return mlIssueDate;
	}
	public void setMlIssueDate(String mlIssueDate) {
		this.mlIssueDate = mlIssueDate;
	}
	public String getCtType() {
		return ctType;
	}
	public void setCtType(String ctType) {
		this.ctType = ctType;
	}
	public String getPtName() {
		return ptName;
	}
	public void setPtName(String ptName) {
		this.ptName = ptName;
	}
	public String getDpName() {
		return dpName;
	}
	public void setDpName(String dpName) {
		this.dpName = dpName;
	}
	public String getLcName() {
		return lcName;
	}
	public void setLcName(String lcName) {
		this.lcName = lcName;
	}
	public String getLcOrganization() {
		return lcOrganization;
	}
	public void setLcOrganization(String lcOrganization) {
		this.lcOrganization = lcOrganization;
	}
	public String getLcType() {
		return lcType;
	}
	public void setLcType(String lcType) {
		this.lcType = lcType;
	}
	public String getLcNote() {
		return lcNote;
	}
	public void setLcNote(String lcNote) {
		this.lcNote = lcNote;
	}
	@Override
	public String toString() {
		return "MemberContent [mmCode=" + mmCode + ", ctCode=" + ctCode + ", ptCode=" + ptCode + ", dpCode=" + dpCode
				+ ", mmName=" + mmName + ", mmDailyPay=" + mmDailyPay + ", mmJoinDate=" + mmJoinDate + ", mmResignDate="
				+ mmResignDate + ", mmAnnualLeave=" + mmAnnualLeave + ", mmArmy=" + mmArmy + ", mmEmail=" + mmEmail
				+ ", mmMarriage=" + mmMarriage + ", mmSign=" + mmSign + ", mmAddress=" + mmAddress + ", mmTel=" + mmTel
				+ ", mmBank=" + mmBank + ", mmAccount=" + mmAccount + ", mcCode=" + mcCode + ", acCode=" + acCode
				+ ", acName=" + acName + ", mcSchoolName=" + mcSchoolName + ", mcAdmissionDate=" + mcAdmissionDate
				+ ", mcGraduationDate=" + mcGraduationDate + ", mcMajor=" + mcMajor + ", mcJumsu=" + mcJumsu
				+ ", mcGrade=" + mcGrade + ", crCode=" + crCode + ", maCode=" + maCode + ", maType=" + maType
				+ ", miCode=" + miCode + ", miType=" + miType + ", crData=" + crData + ", crService=" + crService
				+ ", crPastJoinDay=" + crPastJoinDay + ", crPastResignDay=" + crPastResignDay + ", crResponsibility="
				+ crResponsibility + ", mlCode=" + mlCode + ", lcCode=" + lcCode + ", mlIssueDate=" + mlIssueDate
				+ ", ctType=" + ctType + ", ptName=" + ptName + ", dpName=" + dpName + ", lcName=" + lcName
				+ ", lcOrganization=" + lcOrganization + ", lcType=" + lcType + ", lcNote=" + lcNote + "]";
	}

	
}
