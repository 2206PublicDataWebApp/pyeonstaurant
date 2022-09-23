
package com.kh.pyeonstaurant.recipe.store;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pyeonstaurant.recipe.domain.Recipe;
import com.kh.pyeonstaurant.recipe.domain.RecipeComment;
import com.kh.pyeonstaurant.recipe.domain.RecipeMaterial;
import com.kh.pyeonstaurant.recipe.domain.RecipeStep;
import com.kh.pyeonstaurant.recipe.domain.RecipeTag;
import com.kh.pyeonstaurant.recipe.domain.Recommandation;


public interface RecipeStore {

	public int insertRecipe(Recipe recipe,SqlSessionTemplate session);

	public int insertStep(List<RecipeStep> rmList,SqlSessionTemplate session); 

	public int  insertTag(RecipeTag rTag,SqlSessionTemplate session) ; 

	public int insertMaterial(List<RecipeMaterial> rmList, SqlSessionTemplate session); 


	public List<Recipe> selectAllRecipe(int currentPage, int limit,SqlSessionTemplate session);

	public Recipe selectOneRecipe(int recipeNo, SqlSessionTemplate session); 
	
	public List<RecipeStep> selectOneRecipeDetail(int recipeNo, SqlSessionTemplate session); 

	public List<RecipeMaterial> selectOneRecipeMaterial(int recipeNo,SqlSessionTemplate session); 

	public RecipeTag selectOneRecipeTag(int recipeNo,SqlSessionTemplate session); 

	public int selectRecipeCommentList(int page, int limit, int recipeNo,SqlSessionTemplate session);

	public int selectRecommand(SqlSessionTemplate session,int recipeNo,String memberEmail);

	public int countRecommand(SqlSessionTemplate session, int recipeNo); 

	public List<RecipeComment> selectRecipeCommentList(int currentPage, SqlSessionTemplate session);

	public int insertRecommand(Recommandation recommand,SqlSessionTemplate session);

	public int deleteRecommand(Recommandation recommand,SqlSessionTemplate session);


	public int updateOneRecipe(SqlSessionTemplate session,Recipe recipe) ; 

	public int updateOneRecipeStep(SqlSessionTemplate session, List<RecipeStep> rsList);

	public int updateOneRecipeMaterial(SqlSessionTemplate session,List<RecipeMaterial>rmList); 

	public int  updateOneRecipeTag(SqlSessionTemplate session,RecipeTag rTag) ;

	public int deleteOneRecipe(SqlSessionTemplate session,int redipeNo);

	public int deleteOneImg(SqlSessionTemplate session, String picName);

	public List<Recipe> selectRecomandRecipe(SqlSessionTemplate session, String recipeCategory); 






}

