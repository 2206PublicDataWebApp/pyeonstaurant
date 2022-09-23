package com.kh.pyeonstaurant.consult.service;

import java.util.List;

import com.kh.pyeonstaurant.consult.domain.Consult;
import com.kh.pyeonstaurant.consult.domain.ConsultServer;

public interface ConsultService {
	//관리자 리스트 전체 조회
		public List<ConsultServer> printAllChat();


//////////////////////////////////////////////////		
		
	//고객채팅접수
		public int receiptChat(ConsultServer conServer);
		// 채팅 상답접수 후에 번호 얻어오기 	
		public int serchTitleNo(ConsultServer conServer);
		
	//고객 채팅DB저장
		public int inputChat(Consult consult);
	//고객 채팅내역 화면 전달받기	
		public List<Consult> nowChatList(int titleNo);
	//관리자 채팅종료
		public int chatFinish(ConsultServer conServer);
		
		

}
