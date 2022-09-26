package com.kh.Recipe.consult.store;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.Recipe.consult.domain.Consult;
import com.kh.Recipe.consult.domain.ConsultServer;
@Repository
public class LogicStore implements ConsultStore{
	//고객채팅 리스트 받아오기
	@Override
	public List<ConsultServer> printAllChat(SqlSessionTemplate session) {
		List<ConsultServer> chatList=session.selectList("ConsultMapper.chatList");
		return chatList;
	}
////////////////////////////////////////////////////
	
	//고객 채팅 접수
		@Override
		public int reciptChat(SqlSessionTemplate session, ConsultServer conServer) {
			int num=session.insert("ConsultMapper.reseciptChat",conServer);
			return num;
		}

		// 채팅 상답접수 후에 번호 얻어오기
		@Override
		public int serchNoTitle(SqlSessionTemplate session, ConsultServer conServer) {
			int titleNo = session.selectOne("ConsultMapper.serchtitleNo", conServer);
			return titleNo;
		}

		//고객DB 채팅저장
		@Override
		public int inputChat(SqlSessionTemplate session, Consult consult) {
			int num=session.insert("ConsultMapper.inClientChat",consult);			
			return num;
		}
	//실시간 채팅 리스트 가져오기.
	@Override
	public List<Consult> nowList(SqlSessionTemplate session, int titleNo) {
			List<Consult> conList=session.selectList("ConsultMapper.nowSelectChat", titleNo);
		return conList;
	}
	//관리자 채팅종료
	@Override
	public int finishChat(SqlSessionTemplate session, ConsultServer conServer) {
		int num=session.update("ConsultMapper.reportUpdate",conServer);
		return num;
	}
//채팅 시작 버튼 변경
	@Override
	public int changebutten(SqlSessionTemplate session,String string) {
		int num=session.update("ConsultMapper.switchUpdate",string);
		return num;
	}
//버튼값 받기
	@Override
	public String selechbtn(SqlSessionTemplate session) {
		String btnresult=session.selectOne("ConsultMapper.switchbtncheck");
		return btnresult;
	}
}
