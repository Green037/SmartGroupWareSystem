package com.cafe24.smart.insurance.domain;

//연금보험
public class PensionInsurance {
	private int ppCode;
	private int ppYear;
	private double ppEmployee;
	private double ppOwner;

	public int getPpCode() {
		return ppCode;
	}
	
	public void setPpCode(int ppCode) {
		this.ppCode = ppCode;
	}
	
	public int getPpYear() {
		return ppYear;
	}

	public void setPpYear(int ppYear) {
		this.ppYear = ppYear;
	}

	public double getPpEmployee() {
		return ppEmployee;
	}
	
	public void setPpEmployee(double ppEmployee) {
		this.ppEmployee = ppEmployee;
	}
	
	public double getPpOwner() {
		return ppOwner;
	}

	public void setPpOwner(double ppOwner) {
		this.ppOwner = ppOwner;
	}

	@Override
	public String toString() {
		return "PensionInsurance [ppCode=" + ppCode + ", ppYear=" + ppYear + ", ppEmployee=" + ppEmployee + ", ppOwner="
				+ ppOwner + "]";
	}
}