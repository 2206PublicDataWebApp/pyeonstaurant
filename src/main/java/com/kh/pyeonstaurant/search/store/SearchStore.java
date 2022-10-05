package com.kh.pyeonstaurant.search.store;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pyeonstaurant.recipe.domain.Recipe;

public interface SearchStore {
	//조회순의 전체 리스트
	public List<Recipe> recipeAllList(SqlSessionTemplate session);
//	//조회순, 추천순, 등록일 순. 
//	public List<Recipe> search3patternList(SqlSessionTemplate session, String listCondition, String mainCondition);
	//메인 분류 4가지와 합쳐서 조회
	public List<Recipe> mainSearch(SqlSessionTemplate session, String mainCondition, String listCondition);
	//select 합쳐서
	public List<Recipe> selectSearch(SqlSessionTemplate session, String searchValue, String listCondition,
			String searchCondition);
	//해시태그와 패턴
	public List<Recipe> hachPattern(SqlSessionTemplate session, String hachCondition, String listCondition);
	

}
