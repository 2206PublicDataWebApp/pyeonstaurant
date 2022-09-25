package com.kh.pyeonstaurant.myrecipe.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pyeonstaurant.myrecipe.domain.MyRecipe;
import com.kh.pyeonstaurant.myrecipe.store.MyRecipeStore;
import com.kh.pyeonstaurant.recipe.domain.Recipe;

@Service
public class MyRecipeServiceImpl implements MyRecipeService{
	@Autowired
	private SqlSession session;
	@Autowired
	private MyRecipeStore mStore;



	@Override
	public int addMyRecipe(MyRecipe myRecipe) {
		 int result = mStore.insertMyRecipe(session, myRecipe);
		return result;
	}

	@Override
	public int getTotalCount(String memberEmail) {
		int totalCount = mStore.selectTotalCount(session, memberEmail);
		return totalCount;
	}


	@Override
	public List<Recipe> printMyRecipeList(String memberEmail) {
		List<Recipe> mList 
		= mStore.selectAllByValue(
				session, memberEmail);
		return mList;
	}


	@Override
	public int removeMyRecipe(MyRecipe myRecipe) {
		int result = mStore.deleteOneByMyRecipe(session, myRecipe);
		return result;
	}

	@Override
	public String selectPicName(int recipeNo) {
		String result = mStore.selectPicName(session, recipeNo);
		return result;
	}








	

	

}
