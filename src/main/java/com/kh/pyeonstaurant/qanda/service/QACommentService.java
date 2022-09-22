package com.kh.pyeonstaurant.qanda.service;

import com.kh.pyeonstaurant.qanda.domain.QAComment;

public interface QACommentService {
	
	public int registQAComment(QAComment qAComment);

	public int modifyQAComment(QAComment qAComment);

	public int reomoveOneQACommentNo(int qaCommentNo);


}
