package com.kh.pyeonstaurant.consult.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.Spring;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pyeonstaurant.consult.domain.Consult;
import com.kh.pyeonstaurant.consult.domain.ConsultServer;
import com.kh.pyeonstaurant.consult.service.ConsultService;
import com.kh.pyeonstaurant.member.domain.Member;

@Controller
public class ConsultController {
	@Autowired
	private ConsultService cService;

	//chat을 위한 한명의 정보 받아오기	
//	@RequestMapping(value="/consult/start.kh",  method=RequestMethod.GET)
//	public ModelAndView showChat(ModelAndView mv
/*			@RequestParam(value="memberNickName") String memberNickName*/
/*			, @RequestParam(value="memberEmail") String memberEmail*/
//			,HttpSession session
//			,HttpServletRequest request) { 
//		try {
			 
	//		Member member=(Member)session.getAttribute("loginUser"); 
			//session은 object임...
			
	//		String memberNickName=member.getMemberNickName();
	//		String memberEmail=member.getMemberEmail();

//			System.out.println("세션 닉네임 :"+memberNickName);
//			mv.addObject("memberNickName",memberNickName);
//			mv.addObject("memberEmail",memberEmail);
//			mv.setViewName("/consult/userChat");						
//		}catch(Exception e){
//			mv.addObject("msg",e.getMessage());
//		}		
//		return mv;
//	}
	
	// 고객채팅 시작
	/*
	 * @RequestMapping(value="client/start.kh", method=RequestMethod.GET) public
	 * ModelAndView clientChat(ModelAndView mv,Consult consult) { int
	 * num=cService.inputChat(consult); if(num>0) {
	 * mv.setViewName("/consult/userChat"); } return mv; }
	 */
	//채팅 상담접수
	@ResponseBody
	@RequestMapping(value="/client/afterChat.kh",  method=RequestMethod.POST)
	public String clientChat(String cNickName,String ctitle,String cEmail,
		@ModelAttribute ConsultServer conServer) {
		conServer.setCsNickName(cNickName);
		conServer.setCsMail(ctitle);
		conServer.setCsTitle(cEmail);
		System.out.println(conServer.toString());
		int result=cService.receiptChat(conServer);
		JSONObject jsonObj = new JSONObject();
		if(result>=0) {
			jsonObj.put("resultMsg","success" );
		}else {
			jsonObj.put("resultMsg","error" );
			
		}
		
		return jsonObj.toJSONString();
	}
			
	//채팅 보내기
	@ResponseBody
	@RequestMapping(value="/client/start.kh",  method=RequestMethod.GET)
	public String clientChat(String cNickName,String cContext,String cEmail,
			@ModelAttribute Consult consult,Model model,
			HttpServletRequest req) { 	
		consult.setcNickName(cNickName);
		consult.setcContexts(cContext);
		consult.setcEmail(cEmail);
		
		System.out.println(cNickName);
		System.out.println("cContext :"+cContext);
		System.out.println("req :"+req.toString());
		
		int result=cService.inputChat(consult);
		  //////////String 으로 바꾼 body부를 JSON형태로 변환함
	    //org.json.simple.parser.JSONParser parser = new org.json.simple.parser.JSONParser();
	    //Object obj = parser.parse(consult);
		//String fromYear = (String) jsonObj.get("fromYear");
		JSONObject jsonObj = new JSONObject();
	    jsonObj.put(cNickName, cNickName);
	    jsonObj.put(cContext, cContext);
	    jsonObj.put(cEmail, cEmail);
	    // 제이슨으로 다시 화면에 전송함...
         
  
		return jsonObj.toJSONString();
		
	}
	
//서버자리///////////////////////////////////////////////////
	//그냥 채팅 전체 리스트 가져오면서 시작임.
	@RequestMapping(value="/consult/move.kh",  method=RequestMethod.GET)
	public ModelAndView move(ModelAndView mv) {
		try {
			List<ConsultServer> chatList=cService.printAllChat();	
			System.out.println("리스트 준비 완료 ");
			mv.addObject("chatList",chatList);
			mv.setViewName("/consult/consultingList");						
		}catch(Exception e){
			mv.addObject("msg",e.getMessage());
			mv.setViewName("/error");	
		}
			
		return mv;
	}
	
//채팅시작 이후에 신규 상담건 받아오기
	
// 관리자 상담 시작하기
	@RequestMapping(value="/serverchat/start.kh",  method=RequestMethod.GET)
	public ModelAndView serverChat(ModelAndView mv) { 		
				
		return mv;
	}
}
