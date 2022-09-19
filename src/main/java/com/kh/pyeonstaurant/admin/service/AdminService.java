package com.kh.pyeonstaurant.admin.service;

import java.util.List;

public interface AdminService {

	public int getTotalCount(String memberInfo);

	public List searchMember(int currentPage, int boardLimit, String memberInfo);

	public int removeOneByMember(String memberEmail);

}
