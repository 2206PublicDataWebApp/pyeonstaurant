package com.kh.pyeonstaurant.admin.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	
	
}
