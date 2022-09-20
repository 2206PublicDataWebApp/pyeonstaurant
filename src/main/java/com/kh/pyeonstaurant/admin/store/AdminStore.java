package com.kh.pyeonstaurant.admin.store;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.pyeonstaurant.admin.domain.Board;



public interface AdminStore {

	public int selectTotalCount(SqlSession session, String memberInfo);

	public List selectAllMember(SqlSession session, int currentPage, int boardLimit, String memberInfo);

	public int removeMember(SqlSession session, String memberEmail);

	public int selectTotalCount(SqlSession session, Board board);

	public List<Board> searchBoard(SqlSession session, HashMap<String, String> paraMap);
}
