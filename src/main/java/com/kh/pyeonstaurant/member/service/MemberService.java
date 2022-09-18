package com.kh.pyeonstaurant.member.service;

import com.kh.pyeonstaurant.member.domain.Member;

public interface MemberService {
	// loginMember
	public Member loginMember(Member member);
	// printOneById
	public Member printOneByEmail(String memberEmail);
	// registerMember
	public int registerMember(Member member);
	// modifyMember
	public int modifyMemberNickname(Member member);
	public int modifyMemberPwd(Member member);
	// removeMember
	public int removeMember(Member member);
}