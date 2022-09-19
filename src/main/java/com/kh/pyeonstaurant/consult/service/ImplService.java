package com.kh.Recipe.consult.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.Recipe.consult.domain.Consult;
import com.kh.Recipe.consult.domain.ConsultServer;
import com.kh.Recipe.consult.store.ConsultStore;

@Service
public class ImplService implements ConsultService{
	@Autowired
	private SqlSessionTemplate session;  //빈으로 등록했었음 
	@Autowired
	private ConsultStore cStore;
	
//전체 리스트 조회
	@Override
	public List<ConsultServer> printAllChat() {
		List<ConsultServer> chatList=cStore.printAllChat(session);
		return chatList;

	}
//고객채팅 DB저장
	@Override
	public int inputChat(Consult consult) {
		int num=cStore.inputChat(session,consult);
		return num;
	}
//고객채팅접수	
	@Override
	public int receiptChat(ConsultServer conServer) {
		int num=cStore.reciptChat(session,conServer);
		return num;
	}

}
