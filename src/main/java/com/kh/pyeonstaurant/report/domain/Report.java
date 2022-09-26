package com.kh.pyeonstaurant.report.domain;

import java.sql.Date;

public class Report {
	private int recipeNo;
	private int commentNo;
	private String reportResult;
	private String memberEmail;
	private Date reportDate;     
	private int cnt;
	
	public Report() {
		
	}

	public Report(int recipeNo, int commentNo, String reportResult, String memberEmail, Date reportDate, Date fromDate,
			Date toDate, int cnt) {
		this.recipeNo = recipeNo;
		this.commentNo = commentNo;
		this.reportResult = reportResult;
		this.memberEmail = memberEmail;
		this.reportDate = reportDate;
		this.cnt = cnt;
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

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	
	
}
