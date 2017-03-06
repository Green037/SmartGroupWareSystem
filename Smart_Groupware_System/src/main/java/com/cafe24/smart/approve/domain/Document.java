package com.cafe24.smart.approve.domain;

//문서
public class Document {
	private int docCode;
	private String docName;
	private String docFile;
	
	public int getDocCode() {
		return docCode;
	}
	
	public void setDocCode(int docCode) {
		this.docCode = docCode;
	}
	
	public String getDocName() {
		return docName;
	}

	public void setDocName(String docName) {
		this.docName = docName;
	}

	public String getDocFile() {
		return docFile;
	}
	
	public void setDocFile(String docFile) {
		this.docFile = docFile;
	}
	
	@Override
	public String toString() {
		return "Document [docCode=" + docCode + ", docName=" + docName + ", docFile=" + docFile + "]";
	}
}