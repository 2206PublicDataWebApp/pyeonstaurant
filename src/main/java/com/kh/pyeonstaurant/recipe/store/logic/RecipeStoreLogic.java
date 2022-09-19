package com.kh.pyeonstaurant.recipe.store.logic;



import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pyeonstaurant.recipe.domain.Recipe;
import com.kh.pyeonstaurant.recipe.domain.RecipeComment;
import com.kh.pyeonstaurant.recipe.domain.RecipeMaterial;
import com.kh.pyeonstaurant.recipe.domain.RecipeStep;
import com.kh.pyeonstaurant.recipe.domain.RecipeTag;
import com.kh.pyeonstaurant.recipe.domain.Recommandation;
import com.kh.pyeonstaurant.recipe.store.RecipeStore;


@Repository
public class RecipeStoreLogic implements RecipeStore {

	/**
	 * 레시피 등록
	 */
	@Override
	public int insertRecipe(Recipe recipe, SqlSessionTemplate session) {
		int result = session.insert("RecipeMapper.insertRecipe", recipe);
		return result;
	}

	/**
	 * 레시피 순서등록
	 */
	@Override
	public int insertStep(List<RecipeStep> rsList, SqlSessionTemplate session) {
		int result = 0;
		for (int i = 0; i < rsList.size(); i++) {
			result = session.insert("RecipeMapper.insertRecipeStep", rsList.get(i));
		}
		return result;
	}

	/**
	 * 레시피 태그 등록
	 */
	@Override
	public int insertTag(RecipeTag rTag, SqlSessionTemplate session) {
		int result = session.insert("RecipeMapper.insertTag", rTag);
		return result;
	}

	/**
	 * 레시피 재료 등록
	 * 
	 */
	@Override
	public int insertMaterial(List<RecipeMaterial> rmList, SqlSessionTemplate session) {
		int result = 0;
		for (int i = 0; i < rmList.size(); i++) {
			RecipeMaterial rMaterial = rmList.get(i);
			result += session.insert("RecipeMapper.insertRecipeMaterial", rMaterial);
		}
		return result;
	}

	/**
	 * 전체 레시피 출력
	 */
	@Override
	public List<Recipe> selectAllRecipe(int currentPage, int limit, SqlSessionTemplate session) {
		List<Recipe> rList = session.selectList("RecipeMapper.selectAllRecipe");
		return rList;
	}
	/**상세레시피*/
	@Override
	public Recipe selectOneRecipe(int recipeNo, SqlSessionTemplate session) {
		Recipe recipe=session.selectOne("RecipeMapper.selectOneRecipe", recipeNo);
		return recipe;
	}

	/**상세 레시피 순서*/
	@Override
	public List<RecipeStep> selectOneRecipeDetail(int recipeNo, SqlSessionTemplate session) {
		List<RecipeStep> rsList = session.selectList("RecipeMapper.selectOneRStep", recipeNo);
		return rsList;
	}

	/**상세재료*/
	@Override
	public List<RecipeMaterial> selectOneRecipeMaterial(int recipeNo, SqlSessionTemplate session) {
		List<RecipeMaterial> rmList = session.selectList("RecipeMapper.selectOneRMaterial",recipeNo);
		return rmList;
	}
	/**상세 태그*/
	@Override
	public RecipeTag selectOneRecipeTag(int recipeNo, SqlSessionTemplate session) {
		RecipeTag rTag = session.selectOne("RecipeMapper.selectOneRTag", recipeNo);
		return rTag;
	}

	@Override
	public int selectRecipeCommentList(int page, int limit, int recipeNo, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectRecommand(SqlSessionTemplate session, int recipeNo, String memberEmail) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int countRecommand(SqlSessionTemplate session, int recipeNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<RecipeComment> selectRecipeCommentList(int currentPage, int limit, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertRecommand(Recommandation recommand, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteRecommand(Recommandation recommand, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateOneRecipe(SqlSessionTemplate session, Recipe recipe) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateOneRecipeStep(SqlSessionTemplate session, List<RecipeStep> rsList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateOneRecipeMaterial(SqlSessionTemplate session, List<RecipeMaterial> rmList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateOneRecipeTag(SqlSessionTemplate session, List<RecipeTag> rtList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteOneRecipe(SqlSessionTemplate session, int redipeNo) {
		// TODO Auto-generated method stub
		return 0;
	}



}
