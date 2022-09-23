package com.kh.pyeonstaurant.notice.domain;


public class Search {
	private String searchCondition;
	private String searchValue;
	public Search(String searchCondition, String searchValue) {
		this.searchCondition = searchCondition;
		this.searchValue = searchValue;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	@Override
	public String toString() {
		return "Search [searchCondition=" + searchCondition + ", searchValue=" + searchValue + "]";
	}
}
