package com.kh.pyeonstaurant.myrecipe.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.pyeonstaurant.myrecipe.domain.MyRecipe;
import com.kh.pyeonstaurant.recipe.domain.Recipe;

public interface MyRecipeStore {
	public int insertMyRecipe(SqlSession session, MyRecipe myRecipe);

	public int selectTotalCount(SqlSession session, String memberEmail);

	public List<Recipe> selectAllByValue(SqlSession session, String memberEmail);

	public int deleteOneByMyRecipe(SqlSession session, MyRecipe myRecipe);

	public String selectPicName(SqlSession session, int recipeNo);

}
