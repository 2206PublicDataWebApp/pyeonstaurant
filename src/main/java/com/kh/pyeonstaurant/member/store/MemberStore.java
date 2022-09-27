package com.kh.pyeonstaurant.member.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pyeonstaurant.member.domain.Member;
import com.kh.pyeonstaurant.recipe.domain.Recipe;

public interface MemberStore {
	// selectLoginMember
	public Member selectLoginMember(SqlSession session, Member member);
	// selectOneByEmail
	public Member selectOneByEmail(SqlSession session, String memberEmail);
	// insertMember
	public int insertMember(SqlSession session, Member member);
	// updateMember
	public int updateMemberNickname(SqlSession session, Member member);
	public int updateMemberPwd(SqlSession session, Member member);
	// deleteMember
	public int deleteMember(SqlSession session, String memberEmail);
	public List<Recipe> selectRecipeNuber(SqlSessionTemplate session, String memberEmail);
}