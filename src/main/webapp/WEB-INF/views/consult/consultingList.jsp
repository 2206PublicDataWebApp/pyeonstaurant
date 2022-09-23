<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 채팅 상담 리스트</title>
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
      <p style="display: none;">ON</p> 

</div>
<div>
    <div>
        <span>상담 대기인원 : </span>   
    </div>
    <div>                                <!-- //  <div id="togglePart" style="display:none;"> -->
        <h1 align="center">채팅상담리스트</h1>
            <table align="center" border="1">
                <th>번호</th>
                <th>고객닉네임</th>
                <th>문의주제</th>
                <th>신청시간</th>
                <th>상담시작</th>                
                <!--이후에 리스트가 나열됨....  -->
 
            </table>
    </div>
</div>
    <script>    
	
     $('#checkbox').click(function(){
    	 
    	 var p1btn=$('p').eq(0).css('display');
    	 if(p1btn!=null){
               //$('p').toggle();
               //$('#togglePart').toggle();
               //var requestTime = new Date();
            // 신규 상담 목록들을 가져온다.
               //지금시간...으로 매핑 예정
               $.ajax({
                   url:"/consult/chatSession.kh",
            	   type:'get',
                   //data:requestTime,                   
                   dataType:"json",
                   success:function(result) {
                	   for (var i in result){
                		   var a='<tr>'+
                		         '<td name="info'+i+'">'+result[i].titleNo+'</td>'+
                		         '<td name="info'+i+'">'+result[i].csNickName+'</td>'+
                                 '<td name="info'+i+'">'+result[i].csTitle+'</td>'+                            
                                 '<td name="info'+i+'">'+result[i].csDate+'</td>';
                            if(result[i].csResult==null){
                                  a+='<td><input type="button" onclick="serverchat('+i+');" value="상담시작"></td>';
                            }else {
                            	  a+='<td name="info'+i+'">'+result[i].csResult+'</td>';
                            }
                            $('table').append(a)
                       }
                   }
               });
    		 
    	 }else{
    		 if(confirm("정말로 종료하시겠습니까?")){
    	  		 $('p').toggle();
    	  		 $('tr').remove();
	    		 alert("상담요청을 받지 않습니다.")
	    		 location.href = "/home.kh/";  //관리자 메인페이지로 가자
    		 }
    		 
    	 }

    });
  ///버튼 클릭시 해당 상담창으로 이동   
     function serverchat(i){  
    	
    	var	titleNo=$('[name="info'+i+'"]').eq(0).text();
    	var	csNickName=$('[name="info'+i+'"]').eq(1).text();
    	var	csTitle = $('[name="info'+i+'"]').eq(2).text();    		
    	
	 /*  location.href="/serverchat/start.kh?titleNo"+titleNo+"&cNickName="+cNickName+"&csTitle="+csTitle;   */  	
	 var windo="status=no , nenubar=no,resizable=no,titlebar=no, width=500,height=600";

	window.open("/serverchat/start.kh?titleNo="+titleNo+"&csNickName="+csNickName+"&csTitle="+csTitle,"PopupWin",windo);
	/*  
	  var $form=$("<form>");
		$form.attr("action","/serverchat/start.kh");
		$form.attr("method","post")			
		$form.append("<input type='hidden' value='"+titleNo+"' name='titleNo'> ");
		$form.append("<input type='hidden' value='"+cNickName +"' name='cNickName'>");
		$form.append("<input type='hidden' value='"+csTitle +"' name='csTitle'> ");	
		//객체전송을 할때 곡 form이 필요하다..
		console.log($form[0]);
		$form.appendTo("body");
		$form.submit();		 */
  }
 	
</script>
</body>
</html>
<%-- 처음 시작할때 채팅리스트 들어갔던 구문
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
                 --%>