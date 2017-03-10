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
	private int miCode;
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
	
}
