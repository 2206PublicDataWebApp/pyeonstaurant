package com.kh.pyeonstaurant.point.domain;

import java.sql.Date;

public class Point {
	private String pointMemberEmail;
	private String pointDetail;
	private String usingPoint;
	private Date pointDate;
	
	public Point() {}
	
	public Point(String pointMemberEmail, String pointDetail, String usingPoint, Date pointDate) {
		super();
		this.pointMemberEmail = pointMemberEmail;
		this.pointDetail = pointDetail;
		this.usingPoint = usingPoint;
		this.pointDate = pointDate;
	}
	
	public String getPointMemberEmail() {
		return pointMemberEmail;
	}
	public void setPointMemberEmail(String pointMemberEmail) {
		this.pointMemberEmail = pointMemberEmail;
	}
	public String getPointDetail() {
		return pointDetail;
	}
	public void setPointDetail(String pointDetail) {
		this.pointDetail = pointDetail;
	}
	public String getUsingPoint() {
		return usingPoint;
	}
	public void setUsingPoint(String usingPoint) {
		this.usingPoint = usingPoint;
	}
	public Date getPointDate() {
		return pointDate;
	}
	public void setPointDate(Date pointDate) {
		this.pointDate = pointDate;
	}
	@Override
	public String toString() {
		return "Point [pointMemberEmail=" + pointMemberEmail + ", pointDetail=" + pointDetail + ", usingPoint="
				+ usingPoint + ", pointDate=" + pointDate + "]";
	}
	
	
}
