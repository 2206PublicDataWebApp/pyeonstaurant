package com.kh.pyeonstaurant.qanda.store.logic;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pyeonstaurant.qanda.domain.QAComment;
import com.kh.pyeonstaurant.qanda.store.QACommentStore;



@Repository
public class QACommentStoreLogic implements QACommentStore{

	@Override
	public int insertQAComment(QAComment qAComment, SqlSessionTemplate session) {
		int result=session.insert("QnAMapper.qaCommentInsert",qAComment);
		return result;
	}

	@Override
	public int updateQAComment(QAComment qAComment, SqlSessionTemplate session) {
		int result=session.update("QnAMapper.updateQaComment",qAComment);
		return result;
	}

	@Override
	public int deleteOneQACommentNo(int qaCommentNo, SqlSessionTemplate session) {
		int result = session.delete("QnAMapper.deleteOneComment",qaCommentNo);
		return result;
	}

}
