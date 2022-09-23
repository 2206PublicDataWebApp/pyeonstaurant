package com.kh.pyeonstaurant.notice.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.pyeonstaurant.notice.domain.Notice;

public interface NoticeStore {

	public int insertBoard(SqlSession session, Notice notice);

	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue);

	public List<Notice> selectAllBoard(SqlSession session, int currentPage, int noticeLimit);

	public List<Notice> selectAllByValue(SqlSession session, String searchCondition, String searchValue,
			int currentPage, int noticeLimit);

	public int deleteOneByNo(SqlSession session, int noticeNo);

	public Notice selectOneByNo(SqlSession session, Integer noticeNo);

	public int updateNotice(SqlSession session, Notice notice);

}
