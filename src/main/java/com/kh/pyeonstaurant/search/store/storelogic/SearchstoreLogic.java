package com.kh.pyeonstaurant.search.store.storelogic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pyeonstaurant.recipe.domain.Recipe;
import com.kh.pyeonstaurant.search.store.SearchStore;
@Repository
public class SearchstoreLogic implements SearchStore {
	
//조회순의 전체리스트 
	@Override
	public List<Recipe> recipeAllList(SqlSessionTemplate session) {	

		List<Recipe> rList=session.selectList("SearchMapper.recipeAllList");
		return rList;
	}
	//조회순, 추천순, 등록일 순. 
//@Override
//public List<Recipe> search3patternList(SqlSessionTemplate session, String listCondition, String mainCondition) {
//	HashMap<String, String > paramMap=new HashMap<String, String>();
//	paramMap.put("mainCondition",mainCondition);
//	paramMap.put("listCondition",listCondition);
//	List<Recipe> rList=session.selectList("SearchMapper.mainsearchList", paramMap);
//	return rList;
//}

//메인 분류 4가지와 합쳐서 조회
@Override
public List<Recipe> mainSearch(SqlSessionTemplate session, String listCondition, String mainCondition, String serchValue, String hachCondition, String searchCondition) {
	HashMap<String, String > paramMap=new HashMap<String, String>();
	paramMap.put("mainCondition",mainCondition);
	paramMap.put("listCondition",listCondition);
	paramMap.put("serchValue",serchValue);
	paramMap.put("hachCondition",hachCondition);
	paramMap.put("searchCondition",searchCondition);
	System.out.println(paramMap.toString());
	List<Recipe> sList=session.selectList("SearchMapper.mainsearchList", paramMap);
	System.out.println(sList);

	
	return sList;
}
//select 합쳐서
@Override
public List<Recipe> selectSearch(SqlSessionTemplate session, String serchValue, String listCondition,
		String searchCondition) {
	HashMap<String, String > paramMap=new HashMap<String, String>();
	paramMap.put("serchValue",serchValue);
	paramMap.put("listCondition",listCondition);
	paramMap.put("searchCondition",searchCondition);

	
	List<Recipe> sList=session.selectList("SearchMapper.selectList", paramMap);
	
	return sList;
}
//해시태그와 3가지 패턴
@Override
public List<Recipe> hachPattern(SqlSessionTemplate session, String hachCondition, String listCondition) {
	HashMap<String, String > paramMap=new HashMap<String, String>();
	paramMap.put("hachCondition",hachCondition);
	paramMap.put("listCondition",listCondition);	
	List<Recipe> sList=session.selectList("SearchMapper.hachSelect", paramMap);
	
	return sList;
}

@Override
public List<Recipe> selectAllMenu(SqlSessionTemplate session, String menuName) {
	List<Recipe> rList = session.selectList("SearchMapper.selectAllMenu",  menuName);
	return rList;
}


	
}
