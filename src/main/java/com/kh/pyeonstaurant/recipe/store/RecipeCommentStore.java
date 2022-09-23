
package com.kh.pyeonstaurant.recipe.store;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pyeonstaurant.recipe.domain.RecipeComment;



public interface RecipeCommentStore {

	
	public int insertRecipeComment(RecipeComment rComment, SqlSessionTemplate session) ;


	public int updateOneRecipeComment(RecipeComment rComment,SqlSessionTemplate session);


	public int deleteOneRecipeComment(int commentNo,SqlSessionTemplate session);

}

