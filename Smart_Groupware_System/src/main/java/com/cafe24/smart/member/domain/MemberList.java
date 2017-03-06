package com.cafe24.smart.member.domain;

import java.util.ArrayList;

//사원 조회를 위한 도메인
public class MemberList {
	private int mmCode;
	private int dpCode;
	private int ptCode;
	private ArrayList<Integer> lcCode;
	private String dpName;
	private String ptName;
	private String mmName;
	public int getMmCode() {
		return mmCode;
	}
	public void setMmCode(int mmCode) {
		this.mmCode = mmCode;
	}
	public int getDpCode() {
		return dpCode;
	}
	public void setDpCode(int dpCode) {
		this.dpCode = dpCode;
	}
	public int getPtCode() {
		return ptCode;
	}
	public void setPtCode(int ptCode) {
		this.ptCode = ptCode;
	}


	public ArrayList<Integer> getLcCode() {
		return lcCode;
	}
	public void setLcCode(ArrayList<Integer> lcCode) {
		this.lcCode = lcCode;
	}
	public String getDpName() {
		return dpName;
	}
	public void setDpName(String dpName) {
		this.dpName = dpName;
	}
	public String getPtName() {
		return ptName;
	}
	public void setPtName(String ptName) {
		this.ptName = ptName;
	}
	public String getMmName() {
		return mmName;
	}
	public void setMmName(String mmName) {
		this.mmName = mmName;
	}
	@Override
	public String toString() {
		return "MemberList [mmCode=" + mmCode + ", dpCode=" + dpCode + ", ptCode=" + ptCode + ", lcCode=" + lcCode
				+ ", dpName=" + dpName + ", ptName=" + ptName + ", mmName=" + mmName + "]";
	}
	
	
	
}
