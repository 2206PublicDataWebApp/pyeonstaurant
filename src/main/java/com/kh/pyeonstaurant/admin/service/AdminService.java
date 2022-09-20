package com.kh.pyeonstaurant.admin.service;

import java.util.HashMap;
import java.util.List;

import com.kh.pyeonstaurant.admin.domain.Board;


public interface AdminService {

	public int getTotalCount(String memberInfo);

	public List searchMember(int currentPage, int boardLimit, String memberInfo);

	public int removeOneByMember(String memberEmail);
	
	public int getTotalCount(Board board);

	public List<Board> searchBoard(HashMap<String, String> paraMap);

}
