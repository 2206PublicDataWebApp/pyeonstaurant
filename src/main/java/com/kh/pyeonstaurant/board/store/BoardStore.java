package com.kh.pyeonstaurant.board.store;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.pyeonstaurant.board.domain.Board;

public interface BoardStore {

	public int selectTotalCount(SqlSession session, Board board);

	public List<Board> searchBoard(SqlSession session, HashMap<String, String> paraMap);

}
