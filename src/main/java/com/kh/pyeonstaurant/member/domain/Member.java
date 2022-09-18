package com.kh.pyeonstaurant.member.domain;

public class Member {
	private String memberEmail;
	private String memberPwd;
	private String memberNickname;
	private Boolean adminCheck;
	private int totalPoint;
	
	public Member() {}
	
	public Member(String memberEmail, String memberPwd) {
		super();
		this.memberEmail = memberEmail;
		this.memberPwd = memberPwd;
	}
	
	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public Boolean getAdminCheck() {
		return adminCheck;
	}

	public void setAdminCheck(Boolean adminCheck) {
		this.adminCheck = adminCheck;
	}

	public int getTotalPoint() {
		return totalPoint;
	}

	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}

	@Override
	public String toString() {
		return "Member [memberEmail=" + memberEmail + ", memberPwd=" + memberPwd + ", memberNickname=" + memberNickname
				+ ", adminCheck=" + adminCheck + ", totalPoint=" + totalPoint + "]";
	}
	
	
}
