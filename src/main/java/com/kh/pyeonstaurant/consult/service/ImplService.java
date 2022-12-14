package com.kh.pyeonstaurant.consult.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pyeonstaurant.consult.domain.Consult;
import com.kh.pyeonstaurant.consult.domain.ConsultServer;
import com.kh.pyeonstaurant.consult.store.ConsultStore;
import com.kh.pyeonstaurant.consult.service.ConsultService;

@Service
public class ImplService implements ConsultService{
	@Autowired
	private SqlSessionTemplate session;  //빈으로 등록했었음 
	@Autowired
	private ConsultStore cStore;
	
// 관리자 지금까지의 전체 리스트 조회
	@Override
	public List<ConsultServer> printAllChat() {
		List<ConsultServer> chatList=cStore.printAllChat(session);
		return chatList;

	}

	
//////////////////////////////////////////////////////

//고객채팅접수	
	@Override
	public int receiptChat(ConsultServer conServer) {
		int num=cStore.reciptChat(session,conServer);
		return num;
	}
//고객채팅 DB저장
	@Override
	public int inputChat(Consult consult) {
		int num=cStore.inputChat(session,consult);
		return num;
	}

	
	  //고객 채팅내역 화면 전달받기
	public List<Consult> nowChatList(int titleNo) {
	  List<Consult> chatList=cStore.nowList(session, titleNo);
	  return chatList;
	  }
	 
// 채팅 상답접수 후에 번호 얻어오기 	
	@Override
	public int serchTitleNo(ConsultServer conServer) {
		int titleNo=cStore.serchNoTitle(session, conServer);
		return titleNo;
	}
//관리자 채팅종료
	@Override
	public int chatFinish(ConsultServer conServer) {
		int result=cStore.finishChat(session, conServer);
		return result;
	}

//버튼 체인지
	@Override
	public int changebutten(String chatbtn) {
		int num=cStore.changebutten(session,chatbtn);
		return num;
	}


	@Override
	public String selechbtn() {
		String btnresult=cStore.selechbtn(session);
		return btnresult;
	}







}
