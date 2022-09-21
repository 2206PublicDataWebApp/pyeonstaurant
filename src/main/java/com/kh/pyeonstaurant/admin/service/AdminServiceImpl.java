package com.kh.pyeonstaurant.admin.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pyeonstaurant.admin.domain.Admin;
import com.kh.pyeonstaurant.admin.domain.Board;
import com.kh.pyeonstaurant.admin.store.AdminStore;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private SqlSession session;
	@Autowired
	private AdminStore mStore;

	@Override
	public int getTotalCount(String memberInfo) {
		int totalCount = mStore.selectTotalCount(session, memberInfo);
		return totalCount;
	}
	@Override
	public int removeOneByMember(String memberEmail) {
		int result = mStore.removeMember(session, memberEmail);
		return result;
	}
	@Override
	public List searchMember(int currentPage, int boardLimit, String memberInfo) {
		List mList = mStore.selectAllMember(session, currentPage, boardLimit, memberInfo);
		return mList;
	}
	

	@Override
	public int getTotalBoardCount(String boardInfo) {
		int totalCount = mStore.selectTotalBoardCount(session, boardInfo);
		return totalCount;
	}
	@Override
	public List searchBoard(int currentPage, int boardLimit, String boardInfo) {
		List bList = mStore.selectBoard(session, currentPage, boardLimit, boardInfo);
		return bList;
	}
	@Override
	public int getAllBoardCount() {
		int result = mStore.selectAllCountBoard(session);
		return result;
	}
	@Override
	public List<Board> printAllBoard(int currentPage, int boardLimit) {
		List<Board> bList = mStore.selectAllBoard(session, currentPage, boardLimit);
		return bList;
	}
	@Override
	public int getAllMemberCount() {
		int result = mStore.selectAllMemberCount(session);
		return result;
	}
	@Override
	public List<Admin> printAllMember(int currentPage, int memberLimit) {
		List<Admin> aList = mStore.selectAllMember(session, currentPage, memberLimit);
		return aList;
	}


	
	
}
