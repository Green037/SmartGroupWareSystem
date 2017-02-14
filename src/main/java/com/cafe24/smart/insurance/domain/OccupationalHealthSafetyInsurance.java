package com.cafe24.smart.insurance.domain;

//산재보험
public class OccupationalHealthSafetyInsurance {
	private int ohiCode;
	private int ohiYear;
	private int ohiExtra;
	private int ohiHelp;

	public int getOhiCode() {
		return ohiCode;
	}

	public void setOhiCode(int ohiCode) {
		this.ohiCode = ohiCode;
	}
	
	public int getOhiYear() {
		return ohiYear;
	}

	public void setOhiYear(int ohiYear) {
		this.ohiYear = ohiYear;
	}
	
	public int getOhiExtra() {
		return ohiExtra;
	}
	
	public void setOhiExtra(int ohiExtra) {
		this.ohiExtra = ohiExtra;
	}
	
	public int getOhiHelp() {
		return ohiHelp;
	}
	
	public void setOhiHelp(int ohiHelp) {
		this.ohiHelp = ohiHelp;
	}
	
	@Override
	public String toString() {
		return "OccupationalHealthSafetyInsurance [ohiCode=" + ohiCode + ", ohiYear=" + ohiYear + ", ohiExtra="
				+ ohiExtra + ", ohiHelp=" + ohiHelp + "]";
	}
}