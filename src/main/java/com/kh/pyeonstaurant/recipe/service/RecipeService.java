package com.kh.pyeonstaurant.recipe.service;


import java.util.List;

import com.kh.pyeonstaurant.recipe.domain.Recipe;
import com.kh.pyeonstaurant.recipe.domain.RecipeComment;
import com.kh.pyeonstaurant.recipe.domain.RecipeMaterial;
import com.kh.pyeonstaurant.recipe.domain.RecipeStep;
import com.kh.pyeonstaurant.recipe.domain.RecipeTag;
import com.kh.pyeonstaurant.recipe.domain.Recommandation;


public interface RecipeService {

	public int registRecipe(Recipe recipe);

	public int registStep(List<RecipeStep> rsList);

	public int registTag(RecipeTag rTag);

	public int registMaterial(List<RecipeMaterial> rmList) ;
	
	public List<RecipeComment> printRecipeCommentList(int recipeNo, int currentPage, int boardLimit);

	public int checkRecommand(int recipeNo, String memberEmail);

	public int allRecipeCommentList(int page, int limit, int recipeNo);

	public int setRecommand(Recommandation recommand) ;

	public int removeRecommand(Recommandation recommand) ;

	public int modifyOneRecipe(Recipe recipe) ;

	public int modifyOneRecipeStep(List<RecipeStep> rsList) ;

	public int  modifyOneRecipeMaterial(List<RecipeMaterial> rmList);

	public int modifyOneRecipeTag(RecipeTag rTag);

	public int removeOneRecipe(int redipeNo);
	
	


	public List<Recipe> printRecipeList(int currentPage,int limit);
	
	
	public Recipe printOneRecipe(int recipeNo) ;
	public List<RecipeStep> printOneRecipeStep(int recipeNo) ;
	
	public List<RecipeMaterial> printOneRecipeMaterial(int recipeNo) ;
	
	
	public RecipeTag printOneRecipeTag(int recipeNo)  ;

	public int removeOneImg(String picName);

	public List<Recipe> recomadRecipe(String recipeCategory);

	public int getTotalCount(int recipeNo);



}

