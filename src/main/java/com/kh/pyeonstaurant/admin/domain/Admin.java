package com.kh.pyeonstaurant.admin.domain;

public class Admin {
	private String memberEmail;
	private String memberNickName;
	private int totalPoint;
	
	public Admin() {
		
	}
	
	

	public Admin(String memberEmail, String memberNickName, int totalPoint) {
		this.memberEmail = memberEmail;
		this.memberNickName = memberNickName;
		this.totalPoint = totalPoint;
	}



	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberNickName() {
		return memberNickName;
	}

	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}

	public int getTotalPoint() {
		return totalPoint;
	}

	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}

	@Override
	public String toString() {
		return "Admin [memberEmail=" + memberEmail + ", memberNickName=" + memberNickName + ", totalPoint=" + totalPoint
				+ "]";
	}
	
}
	