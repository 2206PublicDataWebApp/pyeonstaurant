package com.kh.pyeonstaurant.member.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.pyeonstaurant.member.domain.Member;
import com.kh.pyeonstaurant.member.store.MemberStore;
import com.kh.pyeonstaurant.recipe.domain.Recipe;

@Repository
public class MemberStoreLogic implements MemberStore{

	@Override
	public Member selectLoginMember(SqlSession session, Member member) {
		Member mOne 
		= session
		.selectOne("MemberMapper.selectLoginOne", member);
		return mOne;
	}

	@Override
	public Member selectOneByEmail(SqlSession session, String memberEmail) {
		Member member = session.selectOne("MemberMapper.selectOneByEmail", memberEmail);
		return member;
	}

	@Override
	public int insertMember(SqlSession session, Member member) {
		int result = session.insert("MemberMapper.insertMember", member);
		return result;
	}

	@Override
	public int updateMemberNickname(SqlSession session, Member member) {
		int result = session.update("MemberMapper.updateMemberNickname", member);
		return result;
	}

	@Override
	public int updateMemberPwd(SqlSession session, Member member) {
		int result = session.update("MemberMapper.updateMemberPwd", member);
		return result;
	}
	
	@Override
	public int deleteMember(SqlSession session, String memberEmail) {
		int result = session.delete("MemberMapper.deleteMember", memberEmail);
		return result;
	}

	@Override
	public List<Recipe> selectRecipeNuber(SqlSessionTemplate session, String memberEmail) {
		List<Recipe> rList =session.selectList("MemberMapper.selectRecipeNumber", memberEmail);
		System.out.println(rList);
		return rList;
	}

}