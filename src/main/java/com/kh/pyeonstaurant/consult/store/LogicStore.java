package com.kh.Recipe.consult.store;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.Recipe.consult.domain.Consult;
import com.kh.Recipe.consult.domain.ConsultServer;
@Repository
public class LogicStore implements ConsultStore{

	@Override
	public List<ConsultServer> printAllChat(SqlSessionTemplate session) {
		List<ConsultServer> chatList=session.selectList("ConsultMapper.chatList");
		return chatList;
	}
//고객 채팅 접수
	@Override
	public int reciptChat(SqlSessionTemplate session, ConsultServer conServer) {
		int num=session.insert("ConsultMapper.reseciptChat",conServer);
		return num;
	}
//고객DB 채팅저장
	@Override
	public int inputChat(SqlSessionTemplate session, Consult consult) {
		int num=session.insert("ConsultMapper.inClientChat",consult);			
		return num;
	}

}
