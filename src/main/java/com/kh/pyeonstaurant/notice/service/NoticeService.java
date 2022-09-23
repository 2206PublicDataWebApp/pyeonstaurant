package com.kh.pyeonstaurant.notice.service;

import java.util.List;

import com.kh.pyeonstaurant.notice.domain.Notice;

public interface NoticeService {

	public int registerNotice(Notice notice);

	public int getTotalCount(String searchCondition, String searchValue);

	public List<Notice> printAllNotice(int currentPage, int noticeLimit);

	public List<Notice> printAllByValue(String searchCondition, String searchValue, int currentPage, int noticeLimit);

	public int removeOneByNo(int noticeNo);

	public Notice printOneByNo(Integer noticeNo);

	public int modifynotice(Notice notice);

}
