package com.kh.Recipe.consult.service.Impl;

//import java.util.ArrayList;
//import java.util.List;
//
//import org.springframework.stereotype.Component;
//
//@Component
//public class ConsultHandler extends TextWebSockethandler {
//	//웹소켓 서버 클래스로 텍스트 핸들로 상속받아 만듬..
//
//	//접속한 클라이언트 세션들을 저장할 List를 생성 한개만 만들어야 해서 static
//	private static List<WebSocketSession> list=new ArrayList<WebSocketSession>();
//	
//	//클리이언트가 접속 했을때 호출될 메소드
//	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
//		list.add(session);
//		System.out.println("하나의 클라이언트가 연결됨");
//	}
//	
//	//클라이언트가 메세지를 보낼때 호출되는 메소드
//	protected  void haadleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		//전송된 메시지를 list의 모든 세션에 전송
//		String msg=message.getPayload();
//		for(WebSocketSession session : list) {
//			session.sendMessage(new textMessage(msg));
//		}
//		
//	}
//	
//	//클리어언트의 접속해제 되었을때 호출메소드
//	public void sfterConnectionColsed(WebSocketSession session, CloseStatus status) throws Exception{
//		System.out.println("클라이언트와 연결해제됨");
//		list.remove(session);
//	}
//	
//}
