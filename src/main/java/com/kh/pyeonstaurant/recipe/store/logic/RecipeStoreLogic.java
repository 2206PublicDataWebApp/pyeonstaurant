
package com.kh.pyeonstaurant.recipe.store.logic;



import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
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

	/** 상세레시피 */
	@Override
	public Recipe selectOneRecipe(int recipeNo, SqlSessionTemplate session) {
		int result = session.update("RecipeMapper.countPlus", recipeNo);
		Recipe recipe = session.selectOne("RecipeMapper.selectOneRecipe", recipeNo);
		return recipe;
	}

	/** 상세 레시피 순서 */
	@Override
	public List<RecipeStep> selectOneRecipeDetail(int recipeNo, SqlSessionTemplate session) {
		List<RecipeStep> rsList = session.selectList("RecipeMapper.selectOneRStep", recipeNo);
		return rsList;
	}

	/** 상세재료 */
	@Override
	public List<RecipeMaterial> selectOneRecipeMaterial(int recipeNo, SqlSessionTemplate session) {
		List<RecipeMaterial> rmList = session.selectList("RecipeMapper.selectOneRMaterial", recipeNo);
		return rmList;
	}

	/** 상세 태그 */
	@Override
	public RecipeTag selectOneRecipeTag(int recipeNo, SqlSessionTemplate session) {
		RecipeTag rTag = session.selectOne("RecipeMapper.selectOneRTag", recipeNo);
		return rTag;
	}

	/**레시피 추천 수 가져오기*/
	@Override
	public int selectRecommand(SqlSessionTemplate session, int recipeNo, String memberEmail) {
		
		Recipe recipeOne = new Recipe();
		recipeOne.setRecipeNo(recipeNo);
		recipeOne.setMemberEmail(memberEmail);
		int result = session.selectOne("RecipeMapper.selectRecommandCount", recipeOne);
		return result;
	}


	/**레시피 코멘트 출력*/
	@Override
	public List<RecipeComment> selectRecipeCommentList(int recipeNo, SqlSessionTemplate session, int currentPage,int limit) {
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<RecipeComment> rcList = session.selectList("RecipeMapper.selectCommentList", recipeNo, rowBounds);
		
		return  rcList;
	}
/**레시피 추천*/
	@Override
	public int insertRecommand(Recommandation recommand, SqlSessionTemplate session) {
		int result=session.insert("RecipeMapper.insertRecommand", recommand);
		result +=session.insert("RecipeMapper.recomandPlus", recommand.getRecipeNo());
		
		return result;
	}
/**추천 삭제*/
	@Override
	public int deleteRecommand(Recommandation recommand, SqlSessionTemplate session) {
		int result= session.delete("RecipeMapper.deleteRecommand", recommand);
		result+= session.delete("RecipeMapper.recomandMinus", recommand);
		return result;
	}

	/** 레시피수정 */
	@Override
	public int updateOneRecipe(SqlSessionTemplate session, Recipe recipe) {
		int result = session.update("RecipeMapper.updateOneRecipe", recipe);
		return result;
	}

	/** 레시피 순서수정 */
	@Override
	public int updateOneRecipeStep(SqlSessionTemplate session, List<RecipeStep> rsList) {
		int result = 0;
		for (int i = 0; i < rsList.size(); i++) {
			result += session.update("RecipeMapper.updateOneStep", rsList.get(i));
		}
		
		
		if(result<rsList.size()) {
			for(int i=result; i<rsList.size();i++) {
			result+= session.insert("RecipeMapper.insertRstepPlus",rsList.get(i));
			}
		}
		
		return result;
	}

	/** 레시피 재료 수정 */
	@Override
	public int updateOneRecipeMaterial(SqlSessionTemplate session, List<RecipeMaterial> rmList) {
		int result = 0;
	

			for (int i = 0; i < rmList.size(); i++) {

				result += session.update("RecipeMapper.updateOneMaterial", rmList.get(i));

			}
		if(result<rmList.size()) {
			//null방지코드
			for(int i=result; i<rmList.size(); i++) {
				if(rmList.get(i).getAmount() == null) {
					rmList.get(i).setAmount("");
				}
				if(rmList.get(i).getMaterial() == null) {
					rmList.get(i).setMaterial("");
				}
			session.insert("RecipeMapper.insertRecipeMaterialPlus", rmList.get(i));
			}
		}
		
		int count =session.selectOne("RecipeMapper.countMaterial",rmList.get(0).getRecipeNo());
		
		
		if(count>rmList.size()) {
			for(int i =rmList.size(); i<count; i++) {
				HashMap<String, Integer> paraMap = new HashMap<String, Integer>();
				paraMap.put("recipeNo", rmList.get(0).getRecipeNo());
				paraMap.put("materialOrder", i);
				result = session.delete("RecipeMapper.deleteOneMaterial",paraMap);
			}
		}

		return result;
	}

	/** 레시피 태그 수정 */
	@Override
	public int updateOneRecipeTag(SqlSessionTemplate session, RecipeTag rTag) {
		int result = session.update("RecipeMapper.updateOneTag", rTag);
		return result;
	}

	/**
	 * 레시피 삭제
	 */
	@Override
	public int deleteOneRecipe(SqlSessionTemplate session, int redipeNo) {
		int result = session.update("RecipeMapper.deleteRecipe", redipeNo);
		return result;
	}

	/** 이미지삭제 */
	@Override
	public int deleteOneImg(SqlSessionTemplate session, String picName) {
		int result = session.update("RecipeMapper.deleteOneImg", picName);
		return result;
	}
	/** 추천 레시피 불러오기*/
	@Override
	public List<Recipe> selectRecomandRecipe(SqlSessionTemplate session, String recipeCategory) {
		List<Recipe> recommandList = session.selectList("RecipeMapper.selectRecommandRecipe",recipeCategory);
		return recommandList;
	}

	/**댓글 갯수 가져오기*/
	@Override
	public int selectTotalCount(SqlSessionTemplate session, int recipeNo) {
		int count = session.selectOne("RecipeMapper.selectCommentCount",recipeNo);
		return count;
		
	}

	/**멤버 닉네임 가져오기*/
	@Override
	public String selectMemberName(String memberEmail,SqlSessionTemplate session) {
		String name = session.selectOne("RecipeMapper.selectOneName", memberEmail);
		return name;
	}

	
	/**마이레시피 등록여부 확인하기*/
	@Override
	public int selectMyRecipe(SqlSessionTemplate session, int recipeNo, String memberEmail) {
		Recipe oneRecipe = new Recipe();
		oneRecipe.setMemberEmail(memberEmail);
		oneRecipe.setRecipeNo(recipeNo);
		int result = session.selectOne("RecipeMapper.selectMyrecipe", oneRecipe);
		return result;
	}

	/**회원이메일 가져오기*/
	@Override
	public String selectMemberEmail(SqlSessionTemplate session, int recipeNo) {
		String memberEmail=session.selectOne("RecipeMapper.selectMember", recipeNo);
		return memberEmail;
	}

}

