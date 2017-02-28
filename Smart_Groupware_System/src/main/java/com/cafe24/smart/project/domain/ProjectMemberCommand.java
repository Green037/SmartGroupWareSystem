package com.cafe24.smart.project.domain;

public class ProjectMemberCommand {
	private String pmCode_;
	private String pmApproval_;
	private String prCode_;
	
	public String getPrCode_() {
		return prCode_;
	}
	public void setPrCode_(String prCode_) {
		this.prCode_ = prCode_;
	}
	public String getPmCode_() {
		return pmCode_;
	}
	public void setPmCode_(String pmCode_) {
		this.pmCode_ = pmCode_;
	}
	public String getPmApproval_() {
		return pmApproval_;
	}
	public void setPmApproval_(String pmApproval_) {
		this.pmApproval_ = pmApproval_;
	}
	@Override
	public String toString() {
		return "ProjectMemberCommand [pmCode_=" + pmCode_ + ", pmApproval_=" + pmApproval_ + ", prCode_=" + prCode_
				+ "]";
	}
	
}
