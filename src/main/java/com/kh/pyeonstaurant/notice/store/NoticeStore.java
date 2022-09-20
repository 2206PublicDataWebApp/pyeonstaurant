package com.kh.pyeonstaurant.notice.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.pyeonstaurant.notice.domain.Notice;

public interface NoticeStore {

	public int insertBoard(SqlSession session, Notice notice);

	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue);

	public List<Notice> selectAllBoard(SqlSession session, int currentPage, int noticeLimit);

}
