package com.kh.pyeonstaurant.consult.store;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.pyeonstaurant.consult.domain.Consult;
import com.kh.pyeonstaurant.consult.domain.ConsultServer;

public interface ConsultStore {

	public List<ConsultServer> printAllChat(SqlSessionTemplate session);
	//고객DB 채팅저장
	public int inputChat(SqlSessionTemplate session, Consult consult);
	public int reciptChat(SqlSessionTemplate session, ConsultServer conServer);

}
