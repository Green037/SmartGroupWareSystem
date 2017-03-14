package com.cafe24.smart.insurance.domain;

//산재보험
public class OccupationalHealthSafetyInsurance {
	private int ohiCode;
	private double ohiBasic;
	private int ohiYear;
	private double ohiExtra;
	private double ohiHelp;

	public int getOhiCode() {
		return ohiCode;
	}

	public void setOhiCode(int ohiCode) {
		this.ohiCode = ohiCode;
	}
	
	public double getOhiBasic() {
		return ohiBasic;
	}

	public void setOhiBasic(double ohiBasic) {
		this.ohiBasic = ohiBasic;
	}

	public int getOhiYear() {
		return ohiYear;
	}

	public void setOhiYear(int ohiYear) {
		this.ohiYear = ohiYear;
	}
	
	public double getOhiExtra() {
		return ohiExtra;
	}
	
	public void setOhiExtra(double ohiExtra) {
		this.ohiExtra = ohiExtra;
	}
	
	public double getOhiHelp() {
		return ohiHelp;
	}
	
	public void setOhiHelp(double ohiHelp) {
		this.ohiHelp = ohiHelp;
	}

	@Override
	public String toString() {
		return "OccupationalHealthSafetyInsurance [ohiCode=" + ohiCode + ", ohiBasic=" + ohiBasic + ", ohiYear="
				+ ohiYear + ", ohiExtra=" + ohiExtra + ", ohiHelp=" + ohiHelp + "]";
	}
}