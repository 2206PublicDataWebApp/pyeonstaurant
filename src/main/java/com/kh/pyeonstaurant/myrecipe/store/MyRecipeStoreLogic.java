package com.kh.pyeonstaurant.myrecipe.store;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.pyeonstaurant.myrecipe.domain.MyRecipe;

@Repository
public class MyRecipeStoreLogic implements MyRecipeStore{

	@Override
	public int insertMyRecipe(SqlSession session, MyRecipe myRecipe) {
		int result = session.insert("MyRecipeMapper.insertMyRecipe", myRecipe);
		return result;
	}

	@Override
	public int selectTotalCount(SqlSession session, String memberEmail) {
		int totalCount = session.selectOne("MyRecipeMapper.selectTotalCount", memberEmail);
		return totalCount;
	}
	
	@Override
	public List<MyRecipe> selectAllByValue(SqlSession session, int currentPage, int boardLimit, String memberEmail) {
		int offset = (currentPage-1)*boardLimit;
		RowBounds rowBounds 
		= new RowBounds(offset, boardLimit);
		List<MyRecipe> mList 
		= session.selectList("MyRecipeMapper.selectAllByValue"
				, memberEmail, rowBounds);
		return mList;
	}


	@Override
	public int deleteOneByMyRecipe(SqlSession session, MyRecipe myRecipe) {
		int result = session.delete("MyRecipeMapper.removeMyRecipe", myRecipe);
		return result;
	}

//	@Override
//	public int deleteOneByMyRecipe(SqlSession session, int recipeNo, String memberEmail) {
//		// TODO Auto-generated method stub
//		return 0;
//	}


	

}
