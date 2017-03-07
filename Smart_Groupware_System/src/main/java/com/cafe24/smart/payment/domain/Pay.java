package com.cafe24.smart.payment.domain;

public class Pay {
	private String pcSection;
	private String pcClasificar;
	private String middleClasificar;
	private int pcAmount;

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

	@Override
	public String toString() {
		return "Pay [pcSection=" + pcSection + ", pcClasificar=" + pcClasificar
				+ ", middleClasificar=" + middleClasificar + ", pcAmount=" + pcAmount + "]";
	}
}