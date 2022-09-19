package com.kh.pyeonstaurant.admin.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public interface AdminStore {

	public int selectTotalCount(SqlSession session, String memberInfo);

	public List selectAllMember(SqlSession session, int currentPage, int boardLimit, String memberInfo);

	public int removeMember(SqlSession session, String memberEmail);

}
