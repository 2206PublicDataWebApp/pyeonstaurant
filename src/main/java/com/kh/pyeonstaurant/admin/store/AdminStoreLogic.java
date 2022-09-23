package com.kh.pyeonstaurant.admin.store;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.pyeonstaurant.admin.domain.Admin;
import com.kh.pyeonstaurant.admin.domain.Board;



@Repository
public class AdminStoreLogic implements AdminStore{

	@Override
	public int selectTotalCount(SqlSession session, String memberInfo) {
		int totalCount = session.selectOne("AdminMapper.selectTotalCount", memberInfo);
		return totalCount;
	}

	@Override
	public int removeMember(SqlSession session, String memberEmail) {
		int result = session.delete("AdminMapper.deleteMember", memberEmail);
		return result;
	}

	@Override
	public List selectAllMember(SqlSession session, int currentPage, int boardLimit, String memberInfo) {
		int offset = (currentPage-1)*boardLimit;
		RowBounds rowBounds 
		= new RowBounds(offset, boardLimit);
		List mList = null;
		if(memberInfo.contains("@")) {
			mList = session.selectList("AdminMapper.selectAllEmail",memberInfo, rowBounds);
		}else {
			mList = session.selectList("AdminMapper.selectAllNickName",memberInfo, rowBounds);
		}
		return mList;
	}


	@Override
	public int selectTotalBoardCount(SqlSession session, String boardInfo) {
		int result = 0;
		if(boardInfo.contains("@")) {
			result = session.selectOne("AdminMapper.selectEmailTotal", boardInfo);
		}else {
			result = session.selectOne("AdminMapper.selectTitleTotal", boardInfo);
		}
		return result;
	}


	@Override
	public List selectBoard(SqlSession session, int currentPage, int boardLimit, String boardInfo) {
		int offset = (currentPage-1)*boardLimit;
		RowBounds rowBounds 
		= new RowBounds(offset, boardLimit);
		List bList = null;
		if(boardInfo.contains("@")) {
			bList = session.selectList("AdminMapper.selectBoardEmail",boardInfo, rowBounds);
		}else {
			bList = session.selectList("AdminMapper.selectBoardTitle",boardInfo, rowBounds);
		}
		return bList;
	}

	@Override
	public int selectAllCountBoard(SqlSession session) {
		int result = session.selectOne("AdminMapper.selectAllBoardCount");
		return result;
	}

	@Override
	public List<Board> selectAllBoard(SqlSession session, int currentPage, int boardLimit) {
		int offset = (currentPage-1)*boardLimit;
		RowBounds rowBounds = new RowBounds(offset, boardLimit);
		List<Board> bList 
		= session.selectList("AdminMapper.selectAllBoard"
				, null, rowBounds);
		return bList;
	}

	@Override
	public int selectAllMemberCount(SqlSession session) {
		int result = session.selectOne("AdminMapper.selectAllMemberCount");
		return result;
	}

	@Override
	public List<Admin> selectAllMember(SqlSession session, int currentPage, int memberLimit) {
		int offset = (currentPage-1)*memberLimit;
		RowBounds rowBounds = new RowBounds(offset, memberLimit);
		List<Admin> aList = session.selectList("AdminMapper.selectAllMember", null, rowBounds);
		return aList;
	}

	@Override
	public List selectPoint(SqlSession session, String memberEmail) {
		List pList = session.selectList("AdminMapper.selectPoint", memberEmail);
		return pList;
	}

	@Override
	public int addPoint(SqlSession session, String memberEmail) {
		int result = session.update("AdminMapper.increasePoint", memberEmail);
		return result;
	}

	@Override
	public int decreasePoint(SqlSession session, String memberEmail) {
		int result = session.update("AdminMapper.decreasePoint", memberEmail);
		return result;
	}

	@Override
	public int resetPoint(SqlSession session, String memberEmail) {
		int result = session.update("AdminMapper.resetPoint", memberEmail);
		return result;
	}


}
