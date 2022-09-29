<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>편스토랑 메인</title>
    <link rel="shortcut icon" href="/resources/images/favicon.ico" type="image/x-icon">
	<link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">

    <title>Document</title>
    <script src="../resources/js/jquery-3.6.0.min.js"></script>

    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/swiper.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

</head>
<body>
    <header>
        <div class="header-container">
            <h1><a href="#"><img onclick="location.href='/'" src="/resources/images/logo.png"></a></h1>
            <nav class="main-navigation">

                <a href="#"><i class="fa-solid fa-magnifying-glass icon"></i></a>
                <a href="/myRecipe/list"><i class="fa-solid fa-star icon"></i></a>


              <c:if test="${sessionScope.loginUser eq null}">
                <a href="/member/joinView.kh"><i class="fa-regular fa-user icon"></i></a>
                </c:if>
                
                <c:if test="${not empty loginUser}">
                <a href="/member/myPageView.kh"><i class="fa-solid fa-user icon"></i></a>
                </c:if>
                <c:if test="${loginUser.adminCheck == true }">
                관리자
                </c:if>

              
            </nav>
        </div>
    </header>

    <nav class="board-navigation">
        <div class="board-container">
            <ul>


                <li><a href="/search/mainSearch.kh?mainCondition=mael&listCondition=${listCondition}"
 class="board-menu">식사</a></li>
                <li><a href="/search/mainSearch.kh?mainCondition=relish&listCondition=${listCondition}"
class="board-menu">술안주</a></li>
                <li><a href="/search/mainSearch.kh?mainCondition=dessert&listCondition=${listCondition}"
class="board-menu">간식</a></li>
                <li><a href="/search/mainSearch.kh?mainCondition=drink&listCondition=${listCondition}"
 class="board-menu">음료/술</a></li>


            </ul>
        </div>
    </nav>

    <main>
        <!-- Swiper -->
        <div class="swiper mySwiper">
            <div class="swiper-wrapper">
              <div class="swiper-slide"><img src="/resources/images/sample1.jpg"></div>
              <div class="swiper-slide"><img src="/resources/images/sample2.jpg"></div>
              <div class="swiper-slide"><img src="/resources/images/sample3.jpg"></div>
              <div class="swiper-slide"><img src="/resources/images/sample4.jpg"></div>
              <div class="swiper-slide"><img src="/resources/images/sample5.jpg"></div>
            </div>
            <div class="swiper-pagination"></div>
          </div>
    </main>
 

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
                            <li><a href="http://127.0.0.1:8888/qna/List.do">Q&amp;A</a></li>
                        </ul>
                    </div>

                    <p class="footer_content_sub_txt">
                        법인명 : (주)편스토랑  |  사업자등록번호 : 000-00-00000  | 벤처기업 : 제 20220923103호
                        <br>특허 제 00-000000호  |  통신판매업신고 : 2022-서울종로구-0000  |   개인정보보호책임자 : 송신애
                        <br>주소 : 서울 종로구 어딘가 159, KH 정보교육원 3층 |  대표이사 :  공석
                        <br>제휴/협력 문의 : asdf@asdf.com  | 
                    </p>
                </div>
                </div>
        </div>
    </footer>





    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <script src="/resources/js/swiper.js"></script>
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
</body>

</html>