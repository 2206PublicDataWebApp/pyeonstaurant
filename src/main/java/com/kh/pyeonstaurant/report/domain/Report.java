package com.kh.pyeonstaurant.report.domain;

import java.sql.Date;

public class Report {
	private int recipeNo;
	private int commentNo;
	private String reportResult;
	private String memberEmail;
	private Date reportDate;                                                                                                         
	
	public Report() {
		
	}


	public Report(int recipeNo, int commentNo, String reportResult, String memberEmail, Date reportDate) {
		this.recipeNo = recipeNo;
		this.commentNo = commentNo;
		this.reportResult = reportResult;
		this.memberEmail = memberEmail;
		this.reportDate = reportDate;
	}

	public int getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getReportResult() {
		return reportResult;
	}

	public void setReportResult(String reportResult) {
		this.reportResult = reportResult;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}


	@Override
	public String toString() {
		return "Report [recipeNo=" + recipeNo + ", commentNo=" + commentNo + ", reportResult=" + reportResult
				+ ", memberEmail=" + memberEmail + ", reportDate=" + reportDate + "]";
	}
	
	
	
}
