package com.kh.pyeonstaurant.recipe.service;

import com.kh.pyeonstaurant.recipe.domain.RecipeComment;

public interface RecipeCommentService {
	
	public int registRecipeComment (RecipeComment rComment) ;




	public int  modifyOneRecipeComment(RecipeComment rComment) ;
		
	
	


	public int  removeOneRecipeComment(int commentNo);

}
