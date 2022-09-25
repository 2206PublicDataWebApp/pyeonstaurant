package com.kh.pyeonstaurant.myrecipe.service;


import java.util.List;

import com.kh.pyeonstaurant.myrecipe.domain.MyRecipe;
import com.kh.pyeonstaurant.recipe.domain.Recipe;

public interface MyRecipeService {

	public int addMyRecipe(MyRecipe myRecipe);

	public int getTotalCount(String memberEmail);

	public List<Recipe> printMyRecipeList(String memberEmail);

	public int removeMyRecipe(MyRecipe myRecipe);

	public String selectPicName(int recipeNo);


}
