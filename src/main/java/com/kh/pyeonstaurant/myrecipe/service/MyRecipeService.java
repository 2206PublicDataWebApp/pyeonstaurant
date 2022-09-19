package com.kh.pyeonstaurant.myrecipe.service;


import java.util.List;

import com.kh.pyeonstaurant.myrecipe.domain.MyRecipe;

public interface MyRecipeService {
	public int removeMyRecipe(int recipeNo);

	public int addMyRecipe(MyRecipe myRecipe);

	public int getTotalCount(String memberEmail);

	public List<MyRecipe> printMyRecipeList(int currentPage, int boardLimit, String memberEmail);

	

}
