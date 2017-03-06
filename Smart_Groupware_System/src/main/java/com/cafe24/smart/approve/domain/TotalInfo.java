package com.cafe24.smart.approve.domain;

public class TotalInfo {

	private String dftFileOri;
	private String dftFileName;
	private String dftFilePath;
	private String dftFileExtention;
	
	private String docFileName;
	private String docFilePath;
	private String docFileExtention;
	private String docFileOri;
	public String getDftFileOri() {
		return dftFileOri;
	}
	public void setDftFileOri(String dftFileOri) {
		this.dftFileOri = dftFileOri;
	}
	public String getDftFileName() {
		return dftFileName;
	}
	public void setDftFileName(String dftFileName) {
		this.dftFileName = dftFileName;
	}
	public String getDftFilePath() {
		return dftFilePath;
	}
	public void setDftFilePath(String dftFilePath) {
		this.dftFilePath = dftFilePath;
	}
	public String getDftFileExtention() {
		return dftFileExtention;
	}
	public void setDftFileExtention(String dftFileExtention) {
		this.dftFileExtention = dftFileExtention;
	}
	public String getDocFileName() {
		return docFileName;
	}
	public void setDocFileName(String docFileName) {
		this.docFileName = docFileName;
	}
	public String getDocFilePath() {
		return docFilePath;
	}
	public void setDocFilePath(String docFilePath) {
		this.docFilePath = docFilePath;
	}
	public String getDocFileExtention() {
		return docFileExtention;
	}
	public void setDocFileExtention(String docFileExtention) {
		this.docFileExtention = docFileExtention;
	}
	public String getDocFileOri() {
		return docFileOri;
	}
	public void setDocFileOri(String docFileOri) {
		this.docFileOri = docFileOri;
	}
	
	@Override
	public String toString() {
		return "TotalInfo [dftFileOri=" + dftFileOri + ", dftFileName=" + dftFileName + ", dftFilePath=" + dftFilePath
				+ ", dftFileExtention=" + dftFileExtention + ", docFileName=" + docFileName + ", docFilePath="
				+ docFilePath + ", docFileExtention=" + docFileExtention + ", docFileOri=" + docFileOri + "]";
	}
	
	
	
}
