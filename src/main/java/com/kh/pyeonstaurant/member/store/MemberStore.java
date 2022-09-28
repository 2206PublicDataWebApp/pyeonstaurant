package com.kh.pyeonstaurant.member.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pyeonstaurant.member.domain.Member;
import com.kh.pyeonstaurant.point.domain.Point;
import com.kh.pyeonstaurant.recipe.domain.Recipe;
import com.kh.pyeonstaurant.recipe.domain.RecipeComment;

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
	public List<Recipe> selectRecipeNumber(SqlSessionTemplate session, String memberEmail);
	public List<RecipeComment> selectCommentNumber(SqlSessionTemplate session, String memberEmail);
	public List<Point> selectPoint(SqlSessionTemplate session, String pointMemberEmail);
}