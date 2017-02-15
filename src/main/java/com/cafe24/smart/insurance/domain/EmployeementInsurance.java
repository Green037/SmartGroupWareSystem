package com.cafe24.smart.insurance.domain;

//고용보험
public class EmployeementInsurance {
	private int eiCode;
	private int eiYear;
	private double eiEmployee;
	private double eiOwner1;
	private double eiOwner2;
	private double eiOwner3;
	private double eiOwner4;
	
	public int getEiCode() {
		return eiCode;
	}
	
	public void setEiCode(int eiCode) {
		this.eiCode = eiCode;
	}
	
	public int getEiYear() {
		return eiYear;
	}
	
	public void setEiYear(int eiYear) {
		this.eiYear = eiYear;
	}
	
	public double getEiEmployee() {
		return eiEmployee;
	}
	
	public void setEiEmployee(double eiEmployee) {
		this.eiEmployee = eiEmployee;
	}
	
	public double getEiOwner1() {
		return eiOwner1;
	}
	
	public void setEiOwner1(double eiOwner1) {
		this.eiOwner1 = eiOwner1;
	}
	
	public double getEiOwner2() {
		return eiOwner2;
	}
	
	public void setEiOwner2(double eiOwner2) {
		this.eiOwner2 = eiOwner2;
	}
	
	public double getEiOwner3() {
		return eiOwner3;
	}
	
	public void setEiOwner3(double eiOwner3) {
		this.eiOwner3 = eiOwner3;
	}
	
	public double getEiOwner4() {
		return eiOwner4;
	}
	
	public void setEiOwner4(double eiOwner4) {
		this.eiOwner4 = eiOwner4;
	}
	
	@Override
	public String toString() {
		return "EmployeementInsurance [eiCode=" + eiCode + ", eiYear=" + eiYear + ", eiEmployee=" + eiEmployee
				+ ", eiOwner1=" + eiOwner1 + ", eiOwner2=" + eiOwner2 + ", eiOwner3=" + eiOwner3 + ", eiOwner4="
				+ eiOwner4 + "]";
	}
}