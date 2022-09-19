package com.kh.Recipe.consult.store;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.Recipe.consult.domain.Consult;
import com.kh.Recipe.consult.domain.ConsultServer;

public interface ConsultStore {

	public List<ConsultServer> printAllChat(SqlSessionTemplate session);
	//고객DB 채팅저장
	public int inputChat(SqlSessionTemplate session, Consult consult);
	public int reciptChat(SqlSessionTemplate session, ConsultServer conServer);

}
