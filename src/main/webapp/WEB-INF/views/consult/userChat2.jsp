<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 채팅화면</title>
</head>
<body>
<!--header 항시 출력 부분 -->
<div class="header">
	<div class="textIn">
		<P id="nickName">${consult.csNickName}</p><p>의 채팅상담</P>
		<p>주제 : ${consult.csTitle }</p>
			
	</div>
	<div class="btn"><input type="button" value="종료" id="endChat"></div>
	
</div>
<div>상담을 시작합니다.</div>
<!--context 내용 입력부분 -->
<div class="context">
	



</div>
<!--foot 입력부분  -->
<div class="footer">	
	<div id="textIn"><textarea row="4" cols="50" placeholder="50자이내로 입력하세요"></textarea></div>
	<div class="btn">
	<input type="button" value="전송" id="getReSult"></div>
</div>

<script type="text/javascript">
/*$.ajax(settings)
settings: object객체가 들어감 propert가 중요함
data: 서버에 전송할 데이터. key/value 형식의 객체
dataType: 서버가 리턴하는데이터 타입.xml, json, script, html
type: 서버로 전송하는 테이터 타입( post,get)
url: 데이터를 전송할 url
success: ajax 통신 성공시 호출될 이벤트 핸들러  */
	$('#getResult').click(function(){  			/* 전송버튼을 클릭하면 */
		var msg={								//json형식으로 데이터set
		csNickName:"관리자",
		csContext:$('#textIn').val()
		}
		console.log(msg);
		$.ajax({								/*{} 객체를 의미함 key: value값을 ,로 구분하여 객체의 속성이 만들어짐 */
			url:"serverchat/start.kh",	/* url파일로 접근, 컨트롤러에서 대기중인 url주소 */
			dataType:'json',					/* 검사/net/응답을 보면{"result",true:,"msg":"보낸 메세지...input의 text임"}) 받은걸 자바스크립트가 알아서 변환해준다. */
			type:'POST',						/* 폼에서 메소드형식을 생각하면됨 */
			data:msg,                           /* 서버로 부터 받은 msg의 val를 메세지변수에 넣음 */		
			success:function(result){  			/* 이벤트 핸들러 result에 서버가 보낸준 값이 리턴됨. */
				var str='';
				for(var chat in result){
					var time="형식변경"result[cContexts];
					str +='<li class="appendContent">'+result[cContexts]+'</li><li class="appendTime">'+time+'</li>';
					/* 	str +='<div class='appendContent'>'+result[cContexts]+'</div><div class='appendTime'>'+time+'</div>'; */
				/* 서로 부터 전달받기 */					
					/* $(".context").append("<div class='appendbtn'></div>").appendChild(result['msg']);  appendChild 대신 html가능 */
					$(".context").html('<ul>'+str+'</ul>') ;	// 화면에 출력
					$("#textIn").val('');//전송창 비우기
				}			
				
								
			}
		});
		
		
	})
	/*
	서버쪽 로직..http://opentutorials.org/example.jqurey/example.jquery.ajax.php의 내용임
	<?
	echo json_encode(array('result'=>true,'mag'=>$_request['msg']));
	?>
	echo:데이터를 화면에 뿌려줄때 쓰는 명령어
	$_request['msg']) : input 태그로 입력받은 메세제가 값이 된다 배열로 전달하게 되고 json.형식으로 변환하는데 text형식이다.
	
	
	*/
</script>
</body>
</html>