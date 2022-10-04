package com.kh.pyeonstaurant.search.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pyeonstaurant.recipe.domain.Recipe;

public interface Searchservice {
//메인에서 검색클릭하여 조회
	public List<Recipe> recipeAllList();
//	//조회순, 추천순, 등록일 순. 
//	public List<Recipe> search3patternList(String listCondition, String mainCondition);
	
	//메인 분류 4가지와 합쳐서 조회
	public List<Recipe> mainSearch(String mainCondition, String listCondition, String serchValue, String hachCondition, String searchCondition);
	//select 합쳐서
	public List<Recipe> selectSearch(String serchValue, String listCondition, String searchCondition);
	//해시태그와 패턴
	public List<Recipe> hachPattern(String listCondition, String hachCondition);

	public List<Recipe> allViewMenu(String menuName);



	

}
