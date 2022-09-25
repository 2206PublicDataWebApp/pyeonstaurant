package com.kh.pyeonstaurant.myrecipe.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.pyeonstaurant.myrecipe.domain.MyRecipe;
import com.kh.pyeonstaurant.recipe.domain.Recipe;

@Repository
public class MyRecipeStoreLogic implements MyRecipeStore{

	@Override
	public int insertMyRecipe(SqlSession session, MyRecipe myRecipe) {
		int result = session.insert("RecipeMapper.insertMyRecipe", myRecipe);
		return result;
	}

	@Override
	public int selectTotalCount(SqlSession session, String memberEmail) {
		int totalCount = session.selectOne("RecipeMapper.selectTotalCount", memberEmail);
		return totalCount;
	}
	
	@Override
	public List<Recipe> selectAllByValue(SqlSession session, String memberEmail) {
		List<Recipe> mList 
		= session.selectList("RecipeMapper.selectAllByValue", memberEmail);
		return mList;
	}


	@Override
	public int deleteOneByMyRecipe(SqlSession session, MyRecipe myRecipe) {
		int result = session.delete("RecipeMapper.removeMyRecipe", myRecipe);
		return result;
	}

	@Override
	public String selectPicName(SqlSession session, int recipeNo) {
		String result = session.selectOne("RecipeMapper.selectPicName", recipeNo);
		return result;
	}

//	@Override
//	public int deleteOneByMyRecipe(SqlSession session, int recipeNo, String memberEmail) {
//		// TODO Auto-generated method stub
//		return 0;
//	}


	

}
