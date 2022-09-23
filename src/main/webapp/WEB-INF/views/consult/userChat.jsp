<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 채팅화면 </title>

<link rel="stylesheet" href="/resources/css/userChat.css" >
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<style>
</style>
</head>
<body>
<!--header 항시 출력 부분 -->
<div class="header">
	<div><P id="nickName">${memberNickName}</p><p>의 채팅상담</P>
		 <input type="hidden" name="memberEmail" value="${memberEmail}">
		 <input type="hidden" name="memberEmail" value="${memberEmail}">
	</div>
	
	<div class="btn"><input type="button" value="종료" id="endChat"></div>
</div>
<div id="before">
	사용자님 반갑습니다.
상담원하시는 주제를 10자 이내로 기록해주시면
관리자가 접속시 참고하여 진행해드립니다.

다른 상담으로 인해 대기시간이 소요될수 있는 점은 양해부탁드립니다.
	<table width="100%">
		<tr>
			<td><input type="text" name="cTitle" id="inTitle"></td>
			<td><button onclick="(beforeChat('${memberNickName}','${memberEmail}')) ;" value="접수"></button></td>
		</tr>
	</table>

</div>
<!--context 내용 입력부분 -->

<div class="context" >
<div id="after"></div>	

///////////////////////
<br>
로그인 하신 분께만 상담이 가능합니다.
감사합니다.--로그인 페이지 이동.
<br>
//////////////////////////
<br>
근무시간이 아니거나 관리자가 다른 업무중입니다.
불편을 드려 죄송합니다



</div>
<!--foot 입력부분  -->
<div class="footer">
	<div class="textIn"><textarea id="intext" cols="50" placeholder="50자이내로 입력하세요"></textarea></div>
	<div class="btn"><input type="button" value="전송" id="getResult"></div>
</div>
<script>
//가져오기...
	$.ajax({
			url:"/client/afterChat.kh",
			dataType:'json',
			success:function(result){
				
				alert("접수성공");
				//성공시 대기 맨트 예정
				$('<div>').appendTo('#after').text("접수완료되었습니다.");
				$('<div>').appendTo('#after').text("잠시만 기다려주시기 바랍니다..");
				$('<div>').appendTo('#after').text("다른 상담으로 인해 대시시간이 요소될수 있는 점 양해 부탁드립니다..");
			}
		})

//상담접수
	function beforeChat(memberNickName,memberEmail){
	
		var afterMsg={
				cNickName:	memberNickName,
				cEmail:memberEmail,
				cTitle:$('#inTitle').val()
		};
		console.log(afterMsg);
		$.ajax({
			url:"/client/afterChat.kh",
			dataType:'json',
			type:'post',
			data:afterMsg,
			success:function(result){
				alert("접수성공");
				//성공시 대기 맨트 예정
				$('<div>').appendTo('#after').text("접수완료되었습니다.");
				$('<div>').appendTo('#after').text("잠시만 기다려주시기 바랍니다..");
				$('<div>').appendTo('#after').text("다른 상담으로 인해 대시시간이 요소될수 있는 점 양해 부탁드립니다..");
			}
		})
			
	}

// 고객이 관리자와 채팅 시작
	$('#getResult').click(function(){  			/* 전송버튼을 클릭하면 */
 		var msg={								//json형식으로 데이터set
		cNickName:$('#nickName').html(),
		cContext:$('#intext').val(),
		cEmail:$('[name=memberEmail]').val(),
		cTitle:$('#inTitle').val()
		}; 
		console.log(msg);
		$.ajax({								/*{} 객체를 의미함 key: value값을 ,로 구분하여 객체의 속성이 만들어짐 */
			url:"/client/start.kh",	/* url파일로 접근, 컨트롤러에서 대기중인 url주소 */
			dataType:'json',					/* 검사/net/응답을 보면{"result",true:,"msg":"보낸 메세지...input의 text임"}) 받은걸 자바스크립트가 알아서 변환해준다. */
			type:'get',						/* 폼에서 메소드형식을 생각하면됨 */
			data:msg,							/* 서버로 부터 받은 msg의 val를 메세지변수에 넣음 */
			success:function(result){  			/* 이벤트 핸들러 result에 서버가 보낸준 값이 리턴됨. */
				console.log(result);
		/* 		var str='';
			//	for(var chat in result){
					var time="형식변경";
					str +='<li class="appendContent">'+result[cContexts]+'</li><li class="appendTime">'+time+'</li>';*/
			 		/* 	str +='<div class='appendContent'>'+result[cContexts]+'</div><div class='appendTime'>'+time+'</div>'; */
				/* 서로 부터 전달받기 */					
					/* $(".context").append("<div class='appendbtn'></div>").appendChild(result['msg']);  appendChild 대신 html가능 */
// 				}
	
		//		$(".context").html('<ul>'+str+'</ul>') ;	// 화면에 출력
		//		$("#textIn").val('');//전송창 비우기					
				
							
								
			}
		});
	})
	
	//DB에서 데이터 가져와서 화면에 출력해주기
			
		
	

	
</script>
</body>
</html>