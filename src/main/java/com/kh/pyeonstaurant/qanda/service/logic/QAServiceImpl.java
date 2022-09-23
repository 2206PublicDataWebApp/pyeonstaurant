
package com.kh.pyeonstaurant.qanda.service.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pyeonstaurant.qanda.domain.QA;
import com.kh.pyeonstaurant.qanda.domain.QAComment;
import com.kh.pyeonstaurant.qanda.service.QAService;
import com.kh.pyeonstaurant.qanda.store.QAStore;

@Service
public class QAServiceImpl implements QAService{
	@Autowired
	QAStore qStore;
	@Autowired
	SqlSessionTemplate session;

	@Override
	public int registQandA(QA qA) {

		int result = qStore.insertQandA(qA, session);
		return result;
	}

	@Override
	public int modifyQandA(QA qA) {
		int result = qStore.updateQandA(qA, session);
		return result;
	}

	@Override
	public List<QA> allQAList(int currentPage, int limit) {
		List<QA> qList = qStore.selectallQAList(currentPage, limit, session);
		return qList;
	}

	@Override
	public int reomoveOneQandANo(int qaNo) {
		
	
		int result = qStore.deleteOneQandANo(qaNo, session);
		return result;
	}

	@Override
	public QA printOneQANo(int qaNo) {
		QA qa = qStore.selectOneQANo(qaNo, session);
		return qa;
	}

	@Override
	public List<QAComment> allQACommentList(int currentPage, int limit, int qaNo) {
		List<QAComment> qcList = qStore.selectallQACommentList(currentPage, limit, qaNo, session);
		return qcList;
	}

	@Override
	public int getTotalCount(String searchCondition, String searchValue) {
		int count = qStore.selectTotalCount(session, searchCondition, searchValue);
		return count;
	}

	@Override
	public List<QA> printAllByValue(String searchCondition, String searchValue, int currentPage, int boardLimit) {
		List<QA> qList = qStore.selectAllByValue(session,searchCondition, searchValue, currentPage,boardLimit);
		return qList;
	}


}

