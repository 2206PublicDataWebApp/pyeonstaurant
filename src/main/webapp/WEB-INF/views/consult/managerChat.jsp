<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 채팅화면</title>
<link rel="stylesheet" href="/resources/css/managerChat.css">
<script src="../resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<!--header 항시 출력 부분 -->
<div class="header">
	<div class="InputText">
		<P id="nickName">${cNickName} 의 문의입니다</P>
		<p style="color: white;">주제 : ${csTitle }</p>
		<input type="hidden" name="titleNo" id="titleNo" />	
	</div>
	<div class="btn"><input type="button" onClick="chatfinish();" value="종료" id="chatfinish"></div>
	
</div>
<!--context 내용 입력부분 -->
	<div class="context">
		<div id="after">
			<div>상담을 시작합니다.</div>
			
		</div>




	</div>
<!--foot 입력부분  -->
	<div class="footer">
		<div class="InputText">
			<textarea id="magText" cols="50" placeholder="50자이내로 입력하세요"></textarea>
		</div>
		<div id="footbtn">
			<input type="button" value="전송" id="getResult">
		</div>
	</div>

<script >

	$('#getResult').click(function(){
		/* 전송버튼을 클릭하면 */
		var titleNo= ${param.titleNo};
		var msg={								//json형식으로 데이터set
			cNickName: "manager",
			cContexts:$('#magText').val(),
			cEmail: "manager@iei.com",
			titleNo: titleNo
		};
		$('#magText').val('');
		$.ajax({							/*{} 객체를 의미함 key: value값을 ,로 구분하여 객체의 속성이 만들어짐 */	
			url:"/client/start.kh",	/* url파일로 접근, 컨트롤러에서 대기중인 url주소 */
			dataType:'json',					/* 검사/net/응답을 보면{"result",true:,"msg":"보낸 메세지...input의 text임"}) 받은걸 자바스크립트가 알아서 변환해준다. */
			type:'POST',						/* 폼에서 메소드형식을 생각하면됨 */
			data:msg,                           /* 서버로 부터 받은 msg의 val를 메세지변수에 넣음 */		
			success:function(result){  			/* 이벤트 핸들러 result에 서버가 보낸준 값이 리턴됨. */
				console.log("채팅전송성공:"+result);
				collList();
			},
			error: function(e) {
				alert('error');
			},
		});
		
		
	})

	function collList() {
			console.log("출력준비");
			var titleNo=${param.titleNo};
			$('#after').html('');
			
			$.ajax({
				url : "/client/listprint.kh",
				type : 'post',		
				data : {
				 titleNo : titleNo
				},
				success : function(result) {
					console.log("리스트 수신성공: " + result);
					//var data = JSON.parse(result);  //배열로 온것을 파싱한다.
					//console.log(data); 			
					console.log("리스트 수신성공: " + result);
					for ( var i in result) {
						addChat(result[i].cNickName, result[i].cContexts,result[i].cDate);
						console.log(result[i].cNickName);
					}
				
				},
				error: function(e) {
					alert('error : ' + e);
				}
			});
		}

		function addChat(cNickName, cContext, cDate) {
			console.log("데이터 올림 확인 : " + cNickName);
			if(cNickName==='manager'){
				 $('#after').append(
					 '<div class="left">'
                 	   +'<h5 >'+cNickName+'</h5>'
                       +'<div class="middleBox"><span class="dateBox">'+cDate+'</span>'
                       +'<span class="contextBox">'+ cContext +'</span></div></div>');

			}else{
				 $('#after').append(
						 '<div class="right" >'
	                 	   +'<h5 >'+cNickName+'</h5>'
	                       +'<div class="middleBox"><span class="dateBox">'+cDate+'</span>'
	                       +'<span class="contextBox">'+ cContext +'</span></div></div>');				
			}			
		}
		
	//종료 버튼 누를경우
	function chatfinish() {
		var titleNo= ${param.titleNo};
		if (confirm("정말로 종료하시겠습니까?")) {			
			var csResult=prompt('상담결과를 입력하세요.');
			$.ajax({
				url : "consult/finish.kh",
				type : 'post',		
				data : {
				 titleNo : titleNo,
				 csResult:csResult				
				},
				success : function(result) {				
					if(csResult!=null){
					window.close();					
			}else : function(e) {
				alert("종료 되지 않았습니다. 다시 해주세요");			
			}
		}
			
			
	}
	

</script>
</body>
</html>