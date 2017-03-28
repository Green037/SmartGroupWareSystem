package com.cafe24.smart.insurance.domain;

//국민건강보험
public class NationalHealthInsurance {
	private int nhiCode;
	private int nhiYear;
	private double nhiEmployee;
	private double nhiOwner;
	private double nhiLongEmployee;
	private double nhiLongOwner;

	public int getNhiCode() {
		return nhiCode;
	}
	
	public void setNhiCode(int nhiCode) {
		this.nhiCode = nhiCode;
	}
	
	public int getNhiYear() {
		return nhiYear;
	}
	
	public void setNhiYear(int nhiYear) {
		this.nhiYear = nhiYear;
	}
	
	public double getNhiEmployee() {
		return nhiEmployee;
	}

	public void setNhiEmployee(double nhiEmployee) {
		this.nhiEmployee = nhiEmployee;
	}
	
	public double getNhiOwner() {
		return nhiOwner;
	}
	
	public void setNhiOwner(double nhiOwner) {
		this.nhiOwner = nhiOwner;
	}

	public double getNhiLongEmployee() {
		return nhiLongEmployee;
	}
	
	public void setNhiLongEmployee(double nhiLongEmployee) {
		this.nhiLongEmployee = nhiLongEmployee;
	}
	
	public double getNhiLongOwner() {
		return nhiLongOwner;
	}
	
	public void setNhiLongOwner(double nhiLongOwner) {
		this.nhiLongOwner = nhiLongOwner;
	}
	
	@Override
	public String toString() {
		return "NationalHealthInsurance [nhiCode=" + nhiCode + ", nhiYear=" + nhiYear + ", nhiEmployee=" + nhiEmployee
				+ ", nhiOwner=" + nhiOwner + ", nhiLongEmployee=" + nhiLongEmployee + ", nhiLongOwner=" + nhiLongOwner
				+ "]";
	}
}