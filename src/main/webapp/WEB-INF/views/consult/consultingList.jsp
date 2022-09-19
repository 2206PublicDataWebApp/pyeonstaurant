<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 채팅 상담 리스트</title>
<script href="https://code.jquery.com/jquery-3.6.1.min.js" ></script>
    <script src="../resources/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="../resources/css/consultingList.css" ></link>
    
</head>
<body>
<!--관리자일 경우 들어갈수 있도록 다시한번 체크  -->
<div>	
    <label class="switch">
        <input id="checkbox" type="checkbox" value="true" >
        <span class="slider round"></span>
      </label>
      <p >OFF</p>
      <p style="display:none;">ON</p> 

</div>
<div>
    <div>
        <span>상담 대기인원 : </span>   
    </div>
    <div>
        <h1 align="center">채팅상담리스트</h1>
            <table align="center" border="1">
                <th>번호</th>
                <th>고객닉네임</th>
                <th>문의주제</th>
                <th>신청시간</th>
                <th>상담시작</th>                
                <!--이후에 리스트가 나열됨....  -->
                <c:forEach items="${chatList }" var="chat">
               
				 <tr id="list">
					<td>${chat.consultNo }</td>
					<td>${chat.csNickName}</td>
					<td>${chat.csTitle }</td>
					<td>${chat.csDate }</td>
					<td>
						<c:if test="${chat.csResult ne null }">${chat.csResult }</c:if>
						<c:if test="${chat.csResult eq null }"><input type="button" id="chatbtn" value="상담시작"></c:if>
					<td>
		
			</c:forEach>	
                
            </table>
    </div>
</div>
    <script>    
	
     $('#checkbox').click(function(){
    	 
    	 var p1btn=$('p')[1].css('display');
    	 if(p1btn!=null){
               $('p').toggle();
               var requestTime = new Date();
            // 신규 상담 목록들을 가져온다.
               //지금시간...으로 매핑 예정
               $.ajax({
            	   type:"get",
                   url:"/consult/chatSession.kh",
                   data:requestTime,                   
                   dataType:json,
                   success:function(data){
                       for(var chat in data){
                            $('#list').html('<td>'+data[i].consultNo+'</td>');
                            $('#list').html('<td>'+data[i].csNickName+'</td>');
                            $('#list').html('<td>'+data[i].csTitle+'</td>');
                            $('#list').html('<td>'+data[i].csDate+'</td>');
                            $('#list').html('<input type="button" id="chatbtn" value="상담시작">');
                       }
                   }
               });
    		 
    	 }else{
    		 $('p').toggle();
    		 webSocket.close();
    		 alert("상담요청을 받지 않습니다.")
    		 
    	 }

    });
     
     $('#chatbtn').click(function(){
    	 
     });
 
     
     

    </script>

	
	
</script>
</body>
</html>