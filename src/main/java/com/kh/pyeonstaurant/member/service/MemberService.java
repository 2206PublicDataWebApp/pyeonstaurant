package com.kh.pyeonstaurant.member.service;

import java.util.List;

import com.kh.pyeonstaurant.member.domain.Member;
import com.kh.pyeonstaurant.recipe.domain.Recipe;

public interface MemberService {
	// loginMember
	public Member loginMember(Member member);
	// printOneByEmail
	public Member printOneByEmail(String memberEmail);
	// registerMember
	public int registerMember(Member member);
	// modifyMember
	public int modifyMemberNickname(Member member);
	public int modifyMemberPwd(Member member);
	// removeMember
	public int removeMember(String memberEmail);
	public List<Recipe> selectRecipeNumber(String string);
}