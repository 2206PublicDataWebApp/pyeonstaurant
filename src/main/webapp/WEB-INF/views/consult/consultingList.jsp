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
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
</head>
<body>
<!--관리자일 경우 들어갈수 있도록 다시한번 체크  -->
<div>	
    <label class="switch">
        <input id="checkbox" type="checkbox" value="true" >
        <span class="slider round"></span>
      </label>
      <p>OFF</p>
      <p style="display: none;">ON</p> 

</div>
<div>
    <div>
        <span >상담 대기인원 :</span> <span id="count"></span><span id="count">명</span>
    </div>
    <div>                             
       <div id="pagename" align="center">채팅상담리스트</div>
       <div class="table-responsive">
            <table class="table table-striped table-hover"" border="1"  id="togglePart" style="display:none;">
                <thead class="table-light">
                    <tr>
                        <th scope="col">번호</th>
                        <th scope="col">고객닉네임</th>
                        <th scope="col">문의주제</th>
                        <th scope="col">신청시간</th>
                        <th scope="col">상담결과</th>
                        <th scope="col"></th>                
                    </tr>
                </thead>
                <tbody></tbody>
               </table>
		</div>
	</div>
<div>
    <script>    
	
     $('#checkbox').click(function(){    	
    	 var p1btn=$('p').eq(0).css('display');
    	 var printer
    	 if(p1btn!=null){
               $('p').toggle();
               $('#togglePart').toggle();
               printer = setInterval(printList,5000); 
    	 }else{
    		 if(confirm("정말로 종료하시겠습니까?")){
    	  		 $('p').toggle();
    	  		 clearInterval(printer);
    	  		 $('tr').remove();  
    	    	$.ajax({							//종료시 on/off변경								
	   				 url:"/manager/chatEndbtn.kh",
	   		         type:'get',
	   		         data :{
	   		        	 on_off:"N"                   
	   		         },
	   		         dataType:"json",
	   		         success:function(result) {
	   		        	 if(result>0){		         
	      			 			alret("result");
	      		    			//location.href = "/home.kh/";  //관리자 메인페이지에서 오픈하기때문에 변경하지 않음
	   		        	 }else{
	   	   		    		 alret("상담종료 오류입니다. 다시 진행부탁드립니다.");		        		 
	   		        	 };
	   		         },
	   		         error:function(e){
	   		        	 alert('error');
	   				 }
	   		        	 
   		      });
      		    
       	 	};
    	 }
       	 
        });
    /// 리스트 반복 출력구간
    
   function printList(){
	   $('tbody').html('');
    	$.ajax({
         url:"/consult/chatSession.kh",
         type:'get',
         //data:requestTime,                   
         dataType:"json",
         success:function(result) {
        	 var count=0;
         	 for (var i in result){
            	   var a='<tr>'+
            			'<td name="info'+i+'" scope="row">'+result[i].titleNo+'</td>'+
                		'<td name="info'+i+'" scope="row">'+result[i].csNickName+'</td>'+
                        '<td name="info'+i+'" scope="row">'+result[i].csTitle+'</td>'+                            
                        '<td name="info'+i+'" scope="row">'+result[i].csDate+'</td>'+ 
                        '<td name="info'+i+'" scope="row">'+result[i].csResult+'</td>';
			    if(result[i].csResult==null){
			    		count+=1;
            			a+='<td><input type="button" onclick="serverchat('+i+');" value="상담시작"></td>';
                }else{
                	a+='<td></td>';
                }
			   
                $('tbody').append(a);
                $('#count').html(count);
              }
                
		  }        	
      })
   };
    		 
  ///버튼 클릭시 해당 상담창으로 이동   
     function serverchat(i){  
    	
    	var	titleNo=$('[name="info'+i+'"]').eq(0).text();
    	var	csNickName=$('[name="info'+i+'"]').eq(1).text();
    	var	csTitle = $('[name="info'+i+'"]').eq(2).text();    		
    	
	 /*  location.href="/serverchat/start.kh?titleNo"+titleNo+"&cNickName="+cNickName+"&csTitle="+csTitle;   */ 	
	 var windo="status=no , nenubar=no,resizable=no,titlebar=no, width=550,height=650";
	 window.open("/serverchat/start.kh?titleNo="+titleNo+"&csNickName="+csNickName+"&csTitle="+csTitle,"PopupWin",windo);	
  }
 
</script>
</body>
</html>