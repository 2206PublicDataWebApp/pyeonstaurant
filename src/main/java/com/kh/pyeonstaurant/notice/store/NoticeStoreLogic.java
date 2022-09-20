package com.kh.pyeonstaurant.notice.store;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kh.pyeonstaurant.notice.domain.Notice;

@Repository
public class NoticeStoreLogic implements NoticeStore{

	@Override
	public int insertBoard(SqlSession session, Notice notice) {
		int result = session.insert("NoticeMapper.insertNotice", notice);
		return result;
	}

	@Override
	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		int totalCount = session.selectOne("NoticeMapper.selectTotalCount", paramMap);
		return totalCount;
	}

	@Override
	public List<Notice> selectAllBoard(SqlSession session, int currentPage, int noticeLimit) {
		int offset = (currentPage-1)*noticeLimit;
		RowBounds rowBounds = new RowBounds(offset, noticeLimit);
		List<Notice> nList 
		= session.selectList("NoticeMapper.selectAllNotice"
				, null, rowBounds);
		return nList;		
	}

}
