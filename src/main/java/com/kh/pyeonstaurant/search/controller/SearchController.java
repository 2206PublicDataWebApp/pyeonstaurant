package com.kh.Recipe.search.controller;

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

import com.kh.Recipe.consult.domain.ConsultServer;
import com.kh.Recipe.recipe.domain.Recipe;
import com.kh.Recipe.search.service.Searchservice;
/*
 * @Controller public class SearchController {
 * 
 * @Autowired private Searchservice sService;
 * 
 * //검색아이콘 클릭시 전체 리스트가 조회순으로 선택된것이다.
 * 
 * @RequestMapping(value = "/search/move.kh", method = RequestMethod.GET) public
 * ModelAndView searchStart(ModelAndView mv , @RequestParam(value = "page",
 * required = false) Integer page) {
 * 
 * int currentPage = (page != null) ? page : 1; int totalCount =
 * sService.getTotalCount("",""); // 전체게시물의 갯수가 필요함. 검색할때 같은 매소드를 사용하여 빈값을 준것임
 * System.out.println(totalCount); int limit = 6; // 한페이지당 보여주고 싶은 게시물의 갯수 //이것은
 * 프론트에서 Param에서 받아올수 있다. int naviLimit = 3; // 몇개의 페이지씩 표기할것인가.....[이전]1 2 3 4
 * 5[다음] int maxPage; int startNavi; int endNavi; maxPage = (int) ((double)
 * totalCount / limit + 0.9); startNavi = ((int) ((double) currentPage /
 * naviLimit + 0.9) - 1) * naviLimit + 1; endNavi = startNavi + naviLimit - 1;
 * // 처음과 끝만 알면 나머지는 FOR문이 한다. if (maxPage < endNavi) { endNavi = maxPage; } try
 * { List<Recipe> rList = sService.recipeAllList(currentPage, limit);
 * System.out.println(rList.size()); System.out.println("리스트 준비 완료 ");
 * mv.addObject("urlVal","list");//전체 리스트 출력할때 페이지란 것
 * mv.addObject("currentPage", currentPage); mv.addObject("maxPage", maxPage);
 * mv.addObject("startNavi", startNavi); mv.addObject("endNavi", endNavi);
 * mv.addObject("rList", rList); mv.setViewName("/search/recipeSearch2"); }
 * catch (Exception e) { mv.addObject("msg", e.getMessage());
 * mv.setViewName("/error"); } return mv; } //////////////////////처음 들어옸을때.
 * 
 * @RequestMapping(value = "/search/search.kh", method = RequestMethod.GET)
 * public ModelAndView clientChat(ModelAndView mv ,@RequestParam(value =
 * "listCondition", required = false) String listCondition ,@RequestParam(value
 * = "searchCondition", required = false) String searchCondition
 * ,@RequestParam(value = "searchValue", required = false) String searchValue
 * , @RequestParam(value = "page", required = false) Integer page , Model model,
 * ServletRequest requset) {
 * 
 * System.out.println("listCondition:"+ listCondition);
 * System.out.println("searchCondition:"+searchCondition);
 * System.out.println("searchValue:"+searchValue);
 * 
 * 
 * int currentPage = (page != null) ? page : 1; int totalCount =
 * sService.searchTotalCount(listCondition,searchCondition,searchValue); //
 * 전체게시물의 갯수가 필요함. 검색할때 같은 매소드를 사용하여 빈값을 준것임
 * System.out.println("검색후 :"+totalCount); int limit = 6; // 한페이지당 보여주고 싶은 게시물의
 * 갯수 //이것은 프론트에서 Param에서 받아올수 있다. int naviLimit = 3; // 몇개의 페이지씩
 * 표기할것인가.....[이전]1 2 3 4 5[다음] int maxPage; int startNavi; int endNavi; maxPage
 * = (int) ((double) totalCount / limit + 0.9); startNavi = ((int) ((double)
 * currentPage / naviLimit + 0.9) - 1) * naviLimit + 1; endNavi = startNavi +
 * naviLimit - 1; // 처음과 끝만 알면 나머지는 FOR문이 한다. if (maxPage < endNavi) { endNavi =
 * maxPage; } try { List<Recipe> rList =
 * sService.searchKeyList(listCondition,searchCondition,searchValue,
 * currentPage, limit); System.out.println(rList.size());
 * System.out.println("리스트 준비 완료 "); mv.addObject("urlVal","search");//전체 리스트
 * 출력할때 페이지란 것 mv.addObject("currentPage", currentPage); mv.addObject("maxPage",
 * maxPage); mv.addObject("startNavi", startNavi); mv.addObject("endNavi",
 * endNavi); mv.addObject("rList", rList);
 * mv.setViewName("/search/recipeSearch2"); } catch (Exception e) {
 * mv.addObject("msg", e.getMessage()); mv.setViewName("/error"); } return mv; }
 * 
 * 
 * }
 */
