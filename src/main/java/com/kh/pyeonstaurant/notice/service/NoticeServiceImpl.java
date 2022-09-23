package com.kh.pyeonstaurant.notice.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pyeonstaurant.notice.domain.Notice;
import com.kh.pyeonstaurant.notice.store.NoticeStore;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private SqlSession session;
	@Autowired
	private NoticeStore nStore;
	
	
	@Override
	public int registerNotice(Notice notice) {
		int result = nStore.insertBoard(session, notice);
		return result;
	}


	@Override
	public int getTotalCount(String searchCondition, String searchValue) {
		int totalCount = nStore.selectTotalCount(session, searchCondition, searchValue);
		return totalCount;
	}


	@Override
	public List<Notice> printAllNotice(int currentPage, int noticeLimit) {
		List<Notice> nList = nStore.selectAllBoard(session, currentPage, noticeLimit);
		return nList;
	}



	@Override
	public List<Notice> printAllByValue(String searchCondition, String searchValue, int currentPage, int noticeLimit) {
		List<Notice> nList 
		= nStore.selectAllByValue(session, searchCondition, searchValue
				, currentPage, noticeLimit);
		return nList;
	}


	@Override
	public int removeOneByNo(int noticeNo) {
		int result = nStore.deleteOneByNo(session, noticeNo);
		return result;
	}


	@Override
	public Notice printOneByNo(Integer noticeNo) {
		Notice notice = nStore.selectOneByNo(session, noticeNo);
		return notice;
	}


	@Override
	public int modifynotice(Notice notice) {
		int result = nStore.updateNotice(session, notice);
		return result;
	}



}
