package com.kh.pyeonstaurant.recipe.service.logic;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pyeonstaurant.recipe.domain.RecipeComment;
import com.kh.pyeonstaurant.recipe.service.RecipeCommentService;
import com.kh.pyeonstaurant.recipe.store.RecipeCommentStore;

@Service
public class RecipeCommentServiceLogic implements RecipeCommentService{
	@Autowired
	private RecipeCommentStore rcStore;
	@Autowired
	private SqlSessionTemplate session;
	
	/**코멘트등록*/
	public int registRecipeComment (RecipeComment rComment) {
		int result = rcStore.insertRecipeComment(rComment, session);
		return result;
		
	};



	/**코멘트수정*/
	public int  modifyOneRecipeComment(RecipeComment rComment) {
		int result =rcStore.updateOneRecipeComment(rComment, session);
		return result;
		
	};
		
	
	

	/**코멘트 삭제*/
	public int  removeOneRecipeComment(int commentNo) {
		int result =rcStore.deleteOneRecipeComment(commentNo, session);
		return result;
		
	}


/**작성자 이메일주소 가져오기*/
	@Override
	public String selectMemberEmail(Integer commentNo) {
		String memberEmail = rcStore.selectMemberEmail(session,commentNo);
		return memberEmail;
	};

	

}
