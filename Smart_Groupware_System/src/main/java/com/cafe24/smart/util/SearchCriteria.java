package com.cafe24.smart.util;

public class SearchCriteria {
	String keyfield;
	String keyword;
	String compare;

	public SearchCriteria(String keyfield, String keyword, String compare) {
		this.keyfield = keyfield;
		this.keyword = keyword;
		this.compare = compare;
	}	
	
	public String getKeyfield() {
		return keyfield;
	}
	
	public void setKeyfield(String keyfield) {
		this.keyfield = keyfield;
	}
	
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getCompare() {
		return compare;
	}

	public void setCompare(String compare) {
		this.compare = compare;
	}

	@Override
	public String toString() {
		return "SearchCriteria [keyfield=" + keyfield + ", keyword=" + keyword
				+ ", compare=" + compare + "]";
	}
}