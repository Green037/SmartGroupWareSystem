package com.cafe24.smart.payment.domain;

//급여상세
public class PayConent {
	private int pcCode;
	private int mmCode;
	private String pcDate;
	private String pcSection;
	private String pcClasificar;
	private String middleClasificar;
	private int pcAmount;
	private int paMmCode;
	
	public int getPcCode() {
		return pcCode;
	}

	public void setPcCode(int pcCode) {
		this.pcCode = pcCode;
	}
	
	public int getMmCode() {
		return mmCode;
	}
	
	public void setMmCode(int mmCode) {
		this.mmCode = mmCode;
	}
	
	public String getPcDate() {
		return pcDate;
	}
	
	public void setPcDate(String pcDate) {
		this.pcDate = pcDate;
	}
	
	public String getPcSection() {
		return pcSection;
	}

	public void setPcSection(String pcSection) {
		this.pcSection = pcSection;
	}
	
	public String getPcClasificar() {
		return pcClasificar;
	}
	
	public void setPcClasificar(String pcClasificar) {
		this.pcClasificar = pcClasificar;
	}
	
	public String getMiddleClasificar() {
		return middleClasificar;
	}
	
	public void setMiddleClasificar(String middleClasificar) {
		this.middleClasificar = middleClasificar;
	}
	
	public int getPcAmount() {
		return pcAmount;
	}
	
	public void setPcAmount(int pcAmount) {
		this.pcAmount = pcAmount;
	}

	public int getPaMmCode() {
		return paMmCode;
	}
	
	public void setPaMmCode(int paMmCode) {
		this.paMmCode = paMmCode;
	}

	@Override
	public String toString() {
		return "PayConent [pcCode=" + pcCode + ", mmCode=" + mmCode + 
				", pcDate=" + pcDate + ", pcSection=" + pcSection + ", pcClasificar="
				+ pcClasificar + ", middleClasificar=" + middleClasificar +
				", pcAmount=" + pcAmount + ", paMmCode=" + paMmCode + "]";
	}
}