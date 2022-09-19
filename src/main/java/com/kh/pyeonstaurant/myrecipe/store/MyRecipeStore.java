package com.kh.pyeonstaurant.myrecipe.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.pyeonstaurant.myrecipe.domain.MyRecipe;

public interface MyRecipeStore {

	public int deleteOneByMyRecipe(SqlSession session, int recipeNo);

	public int insertMyRecipe(SqlSession session, MyRecipe myRecipe);

	public int selectTotalCount(SqlSession session, String memberEmail);

	public List<MyRecipe> selectAllByValue(SqlSession session, int currentPage, int boardLimit, String memberEmail);


}
