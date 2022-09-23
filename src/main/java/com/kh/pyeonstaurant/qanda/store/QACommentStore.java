
package com.kh.pyeonstaurant.qanda.store;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pyeonstaurant.qanda.domain.QAComment;


public interface QACommentStore {

	

	public int insertQAComment(QAComment qAComment,SqlSessionTemplate session);

	public int  updateQAComment(QAComment qAComment,SqlSessionTemplate session);


	public int  deleteOneQACommentNo(int qaCommentNo,SqlSessionTemplate session);

}

