package com.kh.pyeonstaurant.search.controller;

import java.util.List;

import javax.servlet.ServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pyeonstaurant.consult.domain.ConsultServer;
import com.kh.pyeonstaurant.recipe.domain.Recipe;
import com.kh.pyeonstaurant.search.service.Searchservice;

@Controller
public class SearchController0924 {
	@Autowired
	private Searchservice sService;
	
	//검색아이콘 클릭시 전체 리스트가 조회순으로 선택된것이다. 
	@RequestMapping(value = "/search/move.kh", method = RequestMethod.GET)
	public ModelAndView searchStart(ModelAndView mv) {	
			String mainCondition="";//메인메뉴 한글변환
			String listCondition="";
		try {
			List<Recipe> rList = sService.recipeAllList();

			String listCon = listConditionFind(listCondition);  //조회수/ 추천수/등록일관련 한글변환
			String mainCon=listMainFind(mainCondition);  //메인메뉴 한글변환
			mv.addObject("mainConditionHangul",mainCon);
			mv.addObject("listConditionHangul",listCon);
			
			mv.addObject("rList", rList);
			mv.addObject("mainCondition","all");
			mv.addObject("listCondition","viewCount");
			mv.setViewName("/search/searchPattern");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("/error");
		}
		return mv;
	}	
	

	//전체와 메인만  조회순, 추천순, 등록일 순. 
	@RequestMapping(value = "/search/main3btn.kh", method = RequestMethod.GET)
	public ModelAndView detailSearch(ModelAndView mv
			,@RequestParam(value = "listCondition", required = false) String listCondition
			,@RequestParam(value = "mainCondition", required = false) String mainCondition
			) {	
		if(listCondition==null) {
			listCondition="viewCount";
			
		}
		try {

			List<Recipe> rList = sService.mainSearch(mainCondition,listCondition);

			mv.addObject("rList", rList);
			
			String mainCon=listMainFind(mainCondition);  //메인메뉴 한글변환
			mv.addObject("mainConditionHangul",mainCon);
			mv.addObject("mainCondition",mainCondition);
			
			String listCon = listConditionFind(listCondition);  //조회수/ 추천수/등록일관련 한글변환
			mv.addObject("listConditionHangul",listCon);
			mv.addObject("listCondition",listCondition);
			
			mv.setViewName("/search/searchPattern");
		 } catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("/error");
		}
		return mv;
	}
	
	///메인 분류 식사. 디저트 간식, 음료등을 클릭시 
	
	@RequestMapping(value = "/search/mainSearch.kh", method = RequestMethod.GET)
	public ModelAndView mainSearch(ModelAndView mv
			,@RequestParam(value = "mainCondition", required = false) String mainCondition
			,@RequestParam(value = "listCondition", required = false) String listCondition
			) {	

		try {

			if(listCondition==null) {
				listCondition="viewCount";
			}
			List<Recipe> rList = sService.mainSearch(mainCondition,listCondition);

			
			String listCon = listConditionFind(listCondition);  //조회수/ 추천수/등록일관련 한글변환
			mv.addObject("listConditionHangul",listCon);	
			mv.addObject("listCondition",listCondition);
			
			String mainCon=listMainFind(mainCondition);  //메인메뉴 한글변환
			mv.addObject("mainConditionHangul",mainCon);			
			mv.addObject("mainCondition",mainCondition);
			mv.addObject("rList", rList);
			mv.setViewName("/search/searchPattern");
		 } catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("/error");
		}
		return mv;
	}


	//search할때 조회순, 추천순, 등록일 순. 
		@RequestMapping(value = "/search/search3btn.kh",produces="application/json;charset=UTF-8", method = RequestMethod.GET)
		public ModelAndView searchPattern(ModelAndView mv
				,@RequestParam(value = "listCondition", required = false) String listCondition
				,@RequestParam(value = "searchCondition", required = false) String searchCondition
				,@RequestParam(value = "searchValue", required = false) String searchValue
				,@RequestParam(value = "hachCondition", required = false) String hachCondition
				) {	
			if(listCondition==null) {
				listCondition="viewCount";
			}
			try {

				String hachCon=hachTagFind(hachCondition);  //해시태그는 값이 있던없던 보내줘서 분류해서 매핑할수 있게 함				
				mv.addObject("hachConditionHangul",hachCon);
				mv.addObject("hachCondition",hachCondition);
				
				String listCon = listConditionFind(listCondition);  //조회수/ 추천수/등록일관련 한글변환
				mv.addObject("listConditionHangul",listCon);
				mv.addObject("listCondition",listCondition);
				
				String selectCon = searchConditionFind(searchCondition);//select 한글표시
				mv.addObject("selectHangul",selectCon);
				mv.addObject("searchCondition",searchCondition);
				
				if(!(searchCondition.equals("recipe_tag"))) {
					List<Recipe> rList = sService.selectSearch(searchValue,listCondition,searchCondition);					
					mv.addObject("searchValue",searchValue);	   //검색어 값은 그대로 전달.
					mv.addObject("rList", rList);					
					mv.setViewName("/search/searchSELect");

				} else {
					List<Recipe> rList = sService.hachPattern(listCondition,hachCondition);
					mv.addObject("rList", rList);					
					mv.setViewName("/search/searchSELect");

				}
			 } catch (Exception e) {
				mv.addObject("msg", e.getMessage());
				mv.setViewName("/error");
			}
			return mv;
		}
	
	//listCondition  //조회수/추천순/등록일 값 구하는 곳..
	public String listConditionFind(String conditionList){
		String listCon="";
		switch(conditionList) {
		case "viewCount" : listCon="조회수";
					    	break;						
		case "recommandCount" : listCon="추천순";
							break;
		case "insertDate" : listCon="등록일";
							break;
				  default :listCon="조회수";
			    	break;
						
		}
		
		return listCon;	
	}
	
	//메인 메뉴 한글로 표시하는 곳
	private String listMainFind(String mainCondition) {   
		String mainCon="";
		switch(mainCondition) {
		case "mael" : mainCon="식사";
					    	break;						
		case "dessert" : mainCon="간식";
							break;
		case "relish" : mainCon="술안주";
							break;
		case "drink" : mainCon="술/음료";
					break;
	    default :mainCon="전체";
			    	break;
						
		}
		return mainCon;
	}
	
	//select  한글로 표시하는 곳
	private String searchConditionFind(String searchCondition) {   
		String selectCon="";
		switch(searchCondition) {
		case "recipeName" : selectCon="제목명";
					    	break;						
		case "recipe_material" : selectCon="재료명";
							break;
		case "recipe_tag" : selectCon="해시태그순";
							break;
	    default :selectCon="전체";
			    	break;
						
		}
		return selectCon;
	}
	
	//해시태그  한글로 표시하는 곳
	private String hachTagFind(String hachCondition) {   
		String hachCon="";
		switch(hachCondition) {
		case "easy" : hachCon="간편한";
					  break;						
		case "full" : hachCon="든든한";
					  break;
		case "goodSpicy" : hachCon="맛있게";
						   break;
	    case "healthy" : hachCon="건강한";
    					 break;						
		case "jmt" : hachCon="파티용";
					 break;
		case "soSpicy" : hachCon="아주매운";
					   	 break;
		case "sweet" : hachCon="달콤한";
					   break;
		default :hachCon="no";
		         break;
						
		}
		return hachCon;
	}

}
