<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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
                    <li><a href="/html5.html">식사</a></li>
                    <li><a href="/css3.html">간식</a></li>
                    <li ><a href="/javascript.html">술안주</a></li>
                    <li ><a href="/jQuery.html">술/음료</a></li>
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
            	<input type="hidden" name="serchValue" value="${serchValue}">
            	<input type="hidden" name="listCondition" value="${listCondition}">
            	
            	
            	
                <div id="rowhead">
                    <select class="searchCondition" >
                        <option value="recipeName" selected>제목명</option>
                        <option value="recipe_material">재료명</option>
                        <option value="recipe_tag">해시태그순</option>			 
                    </select>
                    
                    <input type="text" id="serchValue" placeholder="검색할 단어를 입력하세요" >
                    <button type="button" id="addon2">조회</button>                    
                </div>
                <div id="rowbtn">
                    <button type="button" class="btn" name="listCondition" onclick="like();" value="viewCount">조회수</button>
                    <button type="button" class="btn" name="listCondition" onclick="like();" value="recommandCount">추천순</button>
                    <button type="button" class="btn"name="listCondition" onclick="like();" value="insertDate">등록일</button>
                </div>
            <div id="rowbody">
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
			<!--페이징 부분  -->
           	<div id="paging" >
                <nav aria-label="Page navigation example" >               
                    <ul class="pagination">
                      <li class="page-item">
	                      <c:if test="${startNavi !=1}">
	                        <a class="page-link" href="/search/move.kh?page=${startNavi - 1 }" aria-label="Previous">
	                          <span aria-hidden="true">&laquo;</span>
	                        </a>
	                       </c:if>
                      </li>
	                      <c:forEach var="p" begin="${startNavi }" end="${endNavi }">
	                      	<!-- 현재페이지면 진하게 -->
	                      	<c:if test="${currentPage eq P }">
	                      	     <li class="page-item"><a class="page-link" href="#"><b>${p }</b></a></li>
	                      	</c:if>
	                      	<c:if test="${currentPage ne P }">
	                      	     <li class="page-item">
	                      	     	<a class="page-link" href="/search/search/search.kh?page=${p }&searchCondition=${searchCondition}&searchValue=${searchValue}$listCondition=${listCondition}">
	                      	     	${p }</a>
	                      	     </li>
	                      	</c:if>
	                      </c:forEach>	
                      <li class="page-item">
                      <c:if test="${currentPage ne p }">
                        <a class="page-link" href="search/move.kh?page=${currentPage+3 }" aria-label="Next">
                          <span aria-hidden="true">&raquo;</span>                          
                        </a>
                       </c:if>
                      </li>
                    </ul>
                  </nav>
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
			var buttons = document.querySelectorAll('.btn')
			buttons.forEach(function (button) {
			  var button = new bootstrap.Button(button)
			  button.toggle()
			});
			
	$('#addon2').click(){
		
	}		
		
		

</script>
    </body>
    </html>