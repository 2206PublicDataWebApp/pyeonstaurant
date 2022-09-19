package com.kh.pyeonstaurant.board.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pyeonstaurant.board.domain.Board;
import com.kh.pyeonstaurant.board.store.BoardStore;

@Service
public class BoardServiceImpl implements BoardService{	
	@Autowired
	private SqlSession session;
	@Autowired
	private BoardStore bStore;
	
	@Override
	public int getTotalCount(Board board) {
		int totalCount = bStore.selectTotalCount(session, board);
		return totalCount;
	}

	@Override
	public List<Board> searchBoard(HashMap<String, String> paraMap) {
		List<Board> bList = bStore.searchBoard(session, paraMap);
		return bList;
	}

}
