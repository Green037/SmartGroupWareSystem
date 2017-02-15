package com.cafe24.smart.payment.domain;

//급여상세
public class PayContents {
	private int pcCode;
	private int cmCode;
	private int mmCode;
	private String pcDate;
	private String pcSection;
	private String pcClasificar;
	private String middleClasificar;
	private int pcAmount;
	private int inCode;
	private int reCode;
	private int paMmCode;
	
	public int getPcCode() {
		return pcCode;
	}
	
	public void setPcCode(int pcCode) {
		this.pcCode = pcCode;
	}
	
	public int getCmCode() {
		return cmCode;
	}
	
	public void setCmCode(int cmCode) {
		this.cmCode = cmCode;
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
	
	public int getInCode() {
		return inCode;
	}
	
	public void setInCode(int inCode) {
		this.inCode = inCode;
	}

	public int getReCode() {
		return reCode;
	}

	public void setReCode(int reCode) {
		this.reCode = reCode;
	}

	public int getPaMmCode() {
		return paMmCode;
	}
	
	public void setPaMmCode(int paMmCode) {
		this.paMmCode = paMmCode;
	}
	
	@Override
	public String toString() {
		return "PayContents [pcCode=" + pcCode + ", cmCode=" + cmCode + ", mmCode=" + mmCode + ", pcDate=" + pcDate
				+ ", pcSection=" + pcSection + ", pcClasificar=" + pcClasificar + ", middleClasificar="
				+ middleClasificar + ", pcAmount=" + pcAmount + ", inCode=" + inCode + ", reCode=" + reCode
				+ ", paMmCode=" + paMmCode + "]";
	}
}