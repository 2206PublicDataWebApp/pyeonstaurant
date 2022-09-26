package com.kh.pyeonstaurant.admin.store;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.pyeonstaurant.admin.domain.Admin;
import com.kh.pyeonstaurant.admin.domain.Board;



public interface AdminStore {

	public int selectTotalCount(SqlSession session, String memberInfo);

	public List selectAllMember(SqlSession session, int currentPage, int boardLimit, String memberInfo);

	public int removeMember(SqlSession session, String memberEmail);


	public int selectTotalBoardCount(SqlSession session, String boardInfo);

	public List selectBoard(SqlSession session, int currentPage, int boardLimit, String boardInfo);

	public int selectAllCountBoard(SqlSession session);

	public List<Board> selectAllBoard(SqlSession session, int currentPage, int boardLimit);

	public int selectAllMemberCount(SqlSession session);

	public List<Admin> selectAllMember(SqlSession session, int currentPage, int memberLimit);

	public List selectPoint(SqlSession session, String memberEmail);

	public int addPoint(SqlSession session, String memberEmail);

	public int decreasePoint(SqlSession session, String memberEmail);

	public int resetPoint(SqlSession session, String memberEmail);




}
