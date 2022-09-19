package com.kh.pyeonstaurant.board.store;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.pyeonstaurant.board.domain.Board;

@Repository
public class BoardStoreLogic implements BoardStore{
	
	
	@Override
	public int selectTotalCount(SqlSession session, Board board) {
		return 0;
	}

	@Override
	public List<Board> searchBoard(SqlSession session, HashMap<String, String> paraMap) {
		List<Board> mList = session.selectList("BoardAdminMapper.selectBoardList", paraMap);
		return null;
	}

}
