package com.kh.pyeonstaurant.admin.service;

import java.util.HashMap;
import java.util.List;

import com.kh.pyeonstaurant.admin.domain.Admin;
import com.kh.pyeonstaurant.admin.domain.Board;


public interface AdminService {

	public int getTotalCount(String memberInfo);

	public List searchMember(int currentPage, int boardLimit, String memberInfo);

	public int removeOneByMember(String memberEmail);
	

	public int getTotalBoardCount(String boardInfo);

	public List searchBoard(int currentPage, int boardLimit, String boardInfo);

	public int getAllBoardCount();

	public List<Board> printAllBoard(int currentPage, int boardLimit);

	public int getAllMemberCount();

	public List<Admin> printAllMember(int currentPage, int memberLimit);

	public List selectAllPoint(String memberEmail);

	public int addPoint(String memberEmail);

	public int decreasePoint(String memberEmail);

	public int resetPoint(String memberEmail);


}
