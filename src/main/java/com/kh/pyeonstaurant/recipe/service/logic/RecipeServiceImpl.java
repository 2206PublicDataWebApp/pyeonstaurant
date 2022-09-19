package com.kh.pyeonstaurant.recipe.service.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pyeonstaurant.recipe.domain.Recipe;
import com.kh.pyeonstaurant.recipe.domain.RecipeComment;
import com.kh.pyeonstaurant.recipe.domain.RecipeMaterial;
import com.kh.pyeonstaurant.recipe.domain.RecipeStep;
import com.kh.pyeonstaurant.recipe.domain.RecipeTag;
import com.kh.pyeonstaurant.recipe.domain.Recommandation;
import com.kh.pyeonstaurant.recipe.service.RecipeService;
import com.kh.pyeonstaurant.recipe.store.RecipeStore;


@Service
public class RecipeServiceImpl implements RecipeService{
	@Autowired
	private RecipeStore rStore;
	@Autowired
	private SqlSessionTemplate session; 
	
	/**
	 * 레시피 등록
	 */
	@Override
	public int registRecipe(Recipe recipe) {
		int result = rStore.insertRecipe(recipe, session);
		return result;
	}
	
	
	/**
	 * 레시피 순서 등록
	 */
	@Override
	public int registStep(List<RecipeStep> rsList) {
		System.out.println(rsList.size());
		int result = rStore.insertStep(rsList, session);
		
		
		return result;
	}
/**
 * 레시피 태그 등록
 */
	@Override
	public int registTag(RecipeTag rTag) {
		int result = rStore.insertTag(rTag, session);
		return result;
	}

	/**
	 * 레시피 재료 등록
	 */
	@Override
	public int registMaterial(List<RecipeMaterial> rmList) {
		int result = rStore.insertMaterial(rmList, session);
		return result;
	}

	@Override
	public List<RecipeComment> printRecipeCommentList(int currentPage, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int checkRecommand(int recipeNo, String memberEmail) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int allRecipeCommentList(int page, int limit, int recipeNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setRecommand(Recommandation recommand) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeRecommand(Recommandation recommand) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyOneRecipe(Recipe recipe) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyOneRecipeStep(List<RecipeStep> rsList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyOneRecipeMaterial(List<RecipeMaterial> rmList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyOneRecipeTag(List<RecipeTag> rtList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeOneRecipe(int redipeNo) {
		// TODO Auto-generated method stub
		return 0;
	}
/**
 * 레시피 리스트 출력
 */
	@Override
	public List<Recipe> printRecipeList(int currentPage, int limit) {
	 List<Recipe> rList = rStore.selectAllRecipe(currentPage, limit, session);
		return rList;
	}

	/**
	 * 상세 레시피, 레시피
	 */
	@Override
	public Recipe printOneRecipe(int recipeNo) {
		Recipe recipe = rStore.selectOneRecipe(recipeNo, session);
		return recipe;
	}

	/**상세레시피 순서*/
	@Override
	public List<RecipeStep> printOneRecipeStep(int recipeNo) {
		List<RecipeStep>  rsList = rStore.selectOneRecipeDetail(recipeNo, session);
		return rsList;
	}
	
	/**
	 * 상세 레시피 레시피 재료
	 */
	@Override
	public List<RecipeMaterial> printOneRecipeMaterial(int recipeNo) {
		 List<RecipeMaterial> rmList = rStore.selectOneRecipeMaterial(recipeNo, session);
		return rmList;
	}

	/**상세 레시피 태그*/
	@Override
	public RecipeTag printOneRecipeTag(int recipeNo) {
		RecipeTag rTag = rStore.selectOneRecipeTag(recipeNo, session);
		return rTag;
	}

}

