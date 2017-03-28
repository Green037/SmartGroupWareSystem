package com.cafe24.smart.payment.domain;

//급여
public class PaymentView {
	private int pcCode; // 급여상세코드
	private int mmCode; // 사원코드
	private int mmDailyPay; // 일급
	private int paDay; // 근무일수
	private int paInsurance; // 보험총금액
	private int paIncentive; // 성과급
	private int paSalary; // 기본급
	private int paSumSalary; // 실급여
	private String paCalculateDate; // 급여산정일
	private String mmBank; // 계좌은행
	private String mmAccount; // 계좌번호
	private boolean paPossible; // 지급여부
	private String paDate; // 급여지급일
	private int paMmCode; // 담당사원코드

	public int getPcCode() {
		return pcCode;
	}

	public PaymentView setPcCode(int pcCode) {
		this.pcCode = pcCode;
		
		return this;
	}

	public int getMmCode() {
		return mmCode;
	}

	public PaymentView setMmCode(int mmCode) {
		this.mmCode = mmCode;
		
		return this;
	}

	public int getMmDailyPay() {
		return mmDailyPay;
	}

	public PaymentView setMmDailyPay(int mmDailyPay) {
		this.mmDailyPay = mmDailyPay;
		
		return this;
	}

	public int getPaDay() {
		return paDay;
	}

	public PaymentView setPaDay(int paDay) {
		this.paDay = paDay;
		
		return this;
	}

	public int getPaInsurance() {
		return paInsurance;
	}

	public PaymentView setPaInsurance(int paInsurance) {
		this.paInsurance = paInsurance;
		
		return this;
	}

	public int getPaIncentive() {
		return paIncentive;
	}

	public PaymentView setPaIncentive(int paIncentive) {
		this.paIncentive = paIncentive;
		
		return this;
	}

	public int getPaSalary() {
		return paSalary;
	}

	public PaymentView setPaSalary(int paSalary) {
		this.paSalary = paSalary;
		
		return this;
	}

	public int getPaSumSalary() {
		return paSumSalary;
	}

	public PaymentView setPaSumSalary(int paSumSalary) {
		this.paSumSalary = paSumSalary;
		
		return this;
	}

	public String getPaCalculateDate() {
		return paCalculateDate;
	}

	public PaymentView setPaCalculateDate(String paCalculateDate) {
		this.paCalculateDate = paCalculateDate;
		
		return this;
	}

	public String getMmBank() {
		return mmBank;
	}

	public PaymentView setMmBank(String mmBank) {
		this.mmBank = mmBank;
		
		return this;
	}

	public String getMmAccount() {
		return mmAccount;
	}

	public PaymentView setMmAccount(String mmAccount) {
		this.mmAccount = mmAccount;
		
		return this;
	}

	public boolean isPaPossible() {
		return paPossible;
	}

	public PaymentView setPaPossible(boolean paPossible) {
		this.paPossible = paPossible;
		
		return this;
	}

	public String getPaDate() {
		return paDate;
	}

	public PaymentView setPaDate(String paDate) {
		this.paDate = paDate;
		
		return this;
	}

	public int getPaMmCode() {
		return paMmCode;
	}

	public PaymentView setPaMmCode(int paMmCode) {
		this.paMmCode = paMmCode;
		
		return this;
	}

	@Override
	public String toString() {
		return "PaymentView [pcCode=" + pcCode + ", mmCode=" + mmCode + ", mmDailyPay="
				+ mmDailyPay + ", paDay=" + paDay + ", paInsurance=" + paInsurance + ", paIncentive=" + paIncentive
				+ ", paSalary=" + paSalary + ", paSumSalary=" + paSumSalary + ", paCalculateDate=" + paCalculateDate
				+ ", mmBank=" + mmBank + ", mmAccount=" + mmAccount + ", paPossible=" + paPossible + ", paDate="
				+ paDate + ", paMmCode=" + paMmCode + "]";
	}
}