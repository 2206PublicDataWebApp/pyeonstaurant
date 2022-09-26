<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인검색페이지</title>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>2차 검색</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  	<link rel="stylesheet" href="/resources/css/recipeSearch.css">

    <script src="/resources/js/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <div class="head-part" >
            <div id="headtop">                
                <div id="head1">
                    <spna>편스토랑 마크</spna>
                </div>
                <div id="head2">
                    <h1>레시피 검색</h1>
                </div>
                <div id="head3">
                    <button value="검색"></button>
                    <button value="홈"></button>
                    <button value="로그인"></button>
                </div>
            </div>
            <div class="headunder">
                <ul class="navi">
                    <li><a href="/search/mainSearch.kh?mainCondition=mael&listCondition='${listCondition}'">식사</a></li>
                    <li><a href="/search/mainSearch.kh?mainCondition=dessert&listCondition='${listCondition}">간식</a></li>
                    <li ><a href="/search/mainSearch.kh?mainCondition=relish&listCondition='${listCondition}">술안주</a></li>
                    <li ><a href="/search/mainSearch.kh?mainCondition=drink&listCondition='${listCondition}">술/음료</a></li>
                </ul>
            </div>
        </div>
<!--본문구간  -->
        <div class="container">
        	<!--본문 왼쪽  -->
            <div class="rowL"><button >레시피추가</button></div>
            
            <!-- 본문 center부분 -->
            <div class="rowcenter">
            	<input type="hidden" name="searchCondition" value="${searchCondition}">
            	<input type="hidden" name="mainCondition" value="${mainCondition}">
            	<input type="hidden" name="listCondition" value="${listCondition}">
            	
            	
            	
               <div id="rowhead">
                    <select class="searchCondition" >
                        <option value="recipeName" selected>제목명</option>
                        <option value="recipe_material">재료명</option>
                        <option value="recipe_tag">해시태그순</option>			 
                    </select>
                    
                    <select class="hachCondition" >
                        <option value="" selected>해시태그 소분류</option>
	                    <option value="easy" >간편한</option>
	                    <option value="full">든든한</option>
	                    <option value="goodSpicy">맛있게 매운</option>			 
	                    <option value="healthy">건강한</option>			 
	                    <option value="jmt">JMT</option>			 
	                    <option value="party">파티용</option>			 
	                    <option value="soSpicy">아주매운</option>			 
	                    <option value="sweet">달콤한</option>			 
                    </select>     
                    <input type="text" id="serchValue" placeholder="검색할 단어를 입력하세요" >
                    <button type="button" onclick="addon2();">조회</button>                    
                </div>
                <div id="rowbtn">                
                    <button type="button" class="btn" name="listCondition" onclick="btnpattern(this.value);" value="viewCount">조회수</button>
                    <button type="button" class="btn" name="listCondition" onclick="btnpattern(this.value);" value="recommandCount">추천순</button>
                    <button type="button" class="btn"name="listCondition" onclick="btnpattern(this.value);" value="insertDate">등록일</button>
                </div>              
                
            <!--검색부분 종료 -->
            <!--화면 출력 부분  -->    
            <div id="rowbody">
            	<div id="laveltitle">
           
            		<span class="titleLavel">${serchValue}</span>     <!-- 검색어 -->
            		<span class="titleLavel">${mainConditionHangul}</span>  <!--식사 간식, 술안주 음료/술외  -->
            		<span class="titleLavel">${listConditionHangul}</span>   <!--조회수외 2개  -->
            		<span class="titleLavel">검색되었습니다.</span>
            		
            		
            	</div>
                 	<!--1,2,3위 메뉴  -->
            	<c:forEach items="${rList }" var="recipe" varStatus="i">
				<div class="card" style="width: 18rem;">
					<img src="${recipe.mainPicRename} " class="card-img-top" alt="레시피사진">
					<div class="card-body">
						<p class="num">${i.count }위</p>
						<h5 class="card-title">${recipe.recipeName }</h5>
						<a href="#" class="btn btn-primary">레시피 보기</a>
					</div>
				</div>
				</c:forEach>				
			</div>  
			
            </div>
		
        <div id="rowR"></div>
        </div>
                
        <div class="footer">
            <div class="col-sm-3 col-md-3">License</div>
            <div class="col-sm-9 col-md-9">Company inpo</div>
        </div>
        <script>
        
			/*버튼 토글 스크립트  */
			var buttons = document.querySelectorAll('.btn');
			buttons.forEach(function (button) {
			  var button = new bootstrap.Button(button);
			  button.toggle();
			})
			
			function btnpattern(value){
				var mainCondition=$("[name=mainCondition]").val();				
				location.href="/search/main3btn.kh?listCondition="+value+"&mainCondition="+mainCondition; 
			}
			
			function addon2(){
				var searchCondition= $(".searchCondition").val();
				var serchValue=$('#serchValue').val();
				var hachCondition= $(".hachCondition").val();
				var listCondition=$("[name=listCondition]").val();
				location.href="/search/search3btn.kh?searchCondition="+searchCondition+"&serchValue="+serchValue+"&listCondition="+listCondition+"&hachCondition="+hachCondition;
            	
			}			
		

</script>

</body>
</html>