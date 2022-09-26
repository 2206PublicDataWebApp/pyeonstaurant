package com.kh.Recipe.search.service.serviceImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.Recipe.recipe.domain.Recipe;
import com.kh.Recipe.search.service.Searchservice;
import com.kh.Recipe.search.store.SearchStore;


@Service
public class SearchserviceImpl implements Searchservice {
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private SearchStore sStore;
	
	@Override
	public List<Recipe> recipeAllList() {
		List<Recipe> rList = sStore.recipeAllList(session);
		return rList;
	}
	//조회순, 추천순, 등록일 순. 
//	@Override
//	public List<Recipe> search3patternList(String listCondition, String mainCondition) {
//		List<Recipe> rList = sStore.search3patternList(session, listCondition,mainCondition);
//		return rList;
//	}
	//메인 분류 4가지와 합쳐서 조회
	@Override
	public List<Recipe> mainSearch(String mainCondition, String listCondition) {
		List<Recipe> rList = sStore.mainSearch(session,mainCondition, listCondition);
		return rList;
	}
	//select 합쳐서
	@Override
	public List<Recipe> selectSearch(String serchValue, String listCondition, String searchCondition) {
		List<Recipe> rList = sStore.selectSearch(session,serchValue, listCondition,searchCondition);		
		return rList;
	}
	@Override
	public List<Recipe> hachPattern(String listCondition, String hachCondition) {
		List<Recipe> rList = sStore.hachPattern(session,hachCondition, listCondition);		
		return rList;
	}



}
