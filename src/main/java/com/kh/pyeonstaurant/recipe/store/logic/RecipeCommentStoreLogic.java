
package com.kh.pyeonstaurant.recipe.store.logic;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pyeonstaurant.recipe.domain.RecipeComment;
import com.kh.pyeonstaurant.recipe.store.RecipeCommentStore;


@Repository
public class RecipeCommentStoreLogic implements RecipeCommentStore {
	
	@Override
	public int insertRecipeComment(RecipeComment rComment, SqlSessionTemplate session) {
		int result = session.insert("RecipeMapper.insertRecipeComment",rComment);
		return result;
	}

	@Override
	public int updateOneRecipeComment(RecipeComment rComment, SqlSessionTemplate session) {
		int result= session.update("RecipeMapper.updateOneComment",rComment);
		return result;
	}

	@Override
	public int deleteOneRecipeComment(int commentNo, SqlSessionTemplate session) {
		int result = session.delete("RecipeMapper.deleteOneRecipeComment",commentNo);
		return result;
	}

	/**작성자 이메일 가져오기*/
	@Override
	public String selectMemberEmail(SqlSessionTemplate session, Integer commentNo) {
		String memberEmail = session.selectOne("RecipeMapper.selectCommentMember", commentNo);
		return memberEmail;
	}


}
