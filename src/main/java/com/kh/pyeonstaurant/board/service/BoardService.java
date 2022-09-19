package com.kh.pyeonstaurant.board.service;

import java.util.HashMap;
import java.util.List;

import com.kh.pyeonstaurant.board.domain.Board;

public interface BoardService {

	public int getTotalCount(Board board);

	public List<Board> searchBoard(HashMap<String, String> paraMap);
	
}
