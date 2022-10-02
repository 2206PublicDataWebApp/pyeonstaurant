<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>편스토랑</title>
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/swiper.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
</head>
<body>
        <footer class="footer">
        <div class="footer_inner">
            <div class="footer_content_first">
                <div class="footer_content left">
                    <p class="title">고객센터</p>
                    <p class="tel">02-123-4567</p>
                    <p class="work_time">오전 10시 ~ 오후 5시 (주말, 공휴일 제외)</p>
                    <div>

						<button onclick="startChat('${loginUser.memberNickname}');" class="learn-more">
						  <span class="circle" aria-hidden="true">
						  <span class="icon arrow"></span>
						  </span>
						  <span class="button-text">1대1 상담</span>
						</button>
						
						<button class="learn-more" onclick="onPeon();">
						  <span class="circle" aria-hidden="true">
						  <span class="icon arrow"></span>
						  </span>
						  <span class="button-text">편의점 위치 찾기</span>
						</button>


                    </div>
                </div>
                
                <div class="footer_content right">
                    <p class="title">(주)편스토랑</p>
                    <div class="content_link">
                        <ul>
                            <li><a href="#">개인정보처리방침</a></li>
                            <li class="hr">&nbsp;</li>
                            <li><a href="#">이용약관</a></li>
                            <li class="hr">&nbsp;</li>
                            <li><a href="/notice/list">공지사항</a></li>
                            <li class="hr">&nbsp;</li>
                            <li><a href="/qna/List.do">Q&amp;A</a></li>
                        </ul>
                    </div>

                    <p class="footer_content_sub_txt">
                        법인명 : (주)편스토랑  |  사업자등록번호 : 000-00-00000  | 벤처기업 : 제 20220923103호
                        <br>특허 제 00-000000호  |  통신판매업신고 : 2022-서울종로구-0000  |   개인정보보호책임자 : 송신애
                        <br>주소 : 서울 종로구 어딘가 159, KH 정보교육원 3층 |  대표이사 :  공석
                        <br>제휴/협력 문의 : asdf@asdf.com  |   image: <a href="http://Freepik.com" target="_blank">Freepik.com</a>
                    </p>
                </div>
                </div>
        </div>
    </footer>
 <script>
    function startChat(memberNickName) {
  	  $.ajax({						
  			url:"/client/chatCheck.kh",
  			dataType:"json",
  			type:'get',	 			           			                         	
  			success:function(result){  			/* 이벤트 핸들러 result에 서버가 보낸준 값이 리턴됨. */
  				console.log("버튼확인성공:"+result);
  				 if(result.switchbtn=='N'){
  					 alert("관리자가 준비되지 않았습니다. 잠시후 부탁드립니다.");  //버튼값이 n이면 그냥 종료
  				 }else{
  					 chatbtnSuccess(memberNickName)                                //y이면 로그인 확인
  				 };				
  			},
  			error: function(e) {
  				alert('error');
  			},
  		});
  	}
  	 
  	 
  	 
  	 function chatbtnSuccess(memberNickName){
  			if(memberNickName==null){
  				alert("로그인 이후 가능합니다.");          
  			 
  			}else{			
  				 var windo="status=no , nenubar=no,resizable=no,titlebar=no, width=550,height=650";
  				window.open("/consult/chatbefore.kh","PopupWin",windo);
  			};
  	 } 
  	 function onPeon(){
  		  window.open("/peon/peon.kh");
  		
  	 }	

</script>
</html>