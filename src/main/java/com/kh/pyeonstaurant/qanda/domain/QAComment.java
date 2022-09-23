
package com.kh.pyeonstaurant.qanda.domain;

import java.sql.Date;

public class QAComment {
	
	private int qaCommentNo;
	private int qaNo;
	private String memberEmail;
	private String qaCommentContents;
	private Date qaCommentDate;
	private Date qaModifyDate;
	public int getQaCommentNo() {
		return qaCommentNo;
	}
	public void setQaCommentNo(int qaCommentNo) {
		this.qaCommentNo = qaCommentNo;
	}
	public int getQaNo() {
		return qaNo;
	}
	public void setQaNo(int qaNo) {
		this.qaNo = qaNo;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getQaCommentContents() {
		return qaCommentContents;
	}
	public void setQaCommentContents(String qaCommentContents) {
		this.qaCommentContents = qaCommentContents;
	}
	public Date getQaCommentDate() {
		return qaCommentDate;
	}
	public void setQaCommentDate(Date qaCommentDate) {
		this.qaCommentDate = qaCommentDate;
	}
	public Date getQaModifyDate() {
		return qaModifyDate;
	}
	public void setQaModifyDate(Date qaModifyDate) {
		this.qaModifyDate = qaModifyDate;
	}
	@Override
	public String toString() {
		return "QAComment [qaCommentNo=" + qaCommentNo + ", qaNo=" + qaNo + ", memberEmail=" + memberEmail
				+ ", qaCommentContents=" + qaCommentContents + ", qaCommentDate=" + qaCommentDate + ", qaModifyDate="
				+ qaModifyDate + "]";
	}
	
}

