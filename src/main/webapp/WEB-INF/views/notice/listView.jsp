<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>공지사항 리스트</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<style type="text/css">
			li {list-style: none; display:inline; padding: 6px;}
		</style>
		<link rel="stylesheet" href="/resources/css/NewFile.css">
		 <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/swiper.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
</head>
<body>
 <header>
        <div class="header-container">
            <h1><a href="#"><img onclick="location.href='/'" src="https://statics.goorm.io/logo/edu/goorm_edu.svg" alt="goorm edu" ></a></h1>
            <nav class="main-navigation">
                <a href="#" class="header-search"><img src="/resources/images/header_search.svg"></a>
                <a href="/myRecipe/list" class="header-cart"><img src="/resources/images/header_cart.svg"></a>
                
                <c:if test="${sessionScope.loginUser eq null && empty adminCheck }">
                <a href="/member/joinView.kh" class="header-mypage"><img src="/resources/images/header_mypage.svg"></a>
                </c:if>
                
               <c:if test="${not empty loginUser || not empty adminCheck}">
                <a href="/member/myPageView.kh" class="header-mypage"><img src="/resources/images/header_mypage.svg"></a>
                </c:if>
        
                
            </nav>
        </div>
    </header>

    <nav class="board-navigation">
        <div class="board-container">
            <ul>
                <li><a href="#">식사</a></li>
                <li><a href="#">술안주</a></li>
                <li><a href="#">간식</a></li>
                <li><a href="#">음료/술</a></li>
            </ul>
        </div>
    </nav>
    
    <main>
    	<div class="container">
    	<h3 align="center" >공지사항</h3>
		<section id="container">
				<table class="table table-hover">
					<thead>
						<tr><th>번호</th>
							<th>제목</th>
							<th>날짜</th>
							<th>첨부파일</th>
						</tr>
					</thead>
					
					<c:if test="${!empty nList }">
			<c:forEach items="${nList }" var="notice" varStatus="i">
				<tr>
					<td>${i.count }</td>
					<td><a href="/notice/detail?noticeNo=${notice.noticeNo }&page=${currentPage }">${notice.noticeTitle }</a></td>
					<td>${notice.noticeDate }</td>
					<td>
						<c:if test="${!empty notice.noticeFilename }">
							O
						</c:if>
						<c:if test="${empty notice.noticeFilename }">
							X
						</c:if>
					</td>
<!-- 					<form action="/notice/remove" method="get"> -->
<!-- 					<td><input type="submit" value="삭제"></td> -->
<!-- 					</form> -->
				</tr>
			</c:forEach>
			<tr align="center" height="20">
			<td colspan="4">
				<c:if test="${currentPage != 1 }">
					<a href="/notice/${urlVal }?page=${currentPage - 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}">이전</a>
				</c:if>
				<c:forEach var="p" begin="${startNavi }" end="${endNavi }">
					<c:if test="${currentPage eq p }">
						<b>${p }</b>
					</c:if>
					<c:if test="${currentPage ne p }">
						<a href="/notice/${urlVal }?page=${p }&searchCondition=${searchCondition}&searchValue=${searchValue}">${p }</a>
					</c:if>
				</c:forEach>
				<c:if test="${maxPage > currentPage }">
					<a href="/notice/${urlVal }?page=${currentPage + 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}">다음</a>
				</c:if>
				
			</td>
			
		</tr>		
		</c:if>
		<c:if test="${adminCheck == true}">
		<button onclick="location.href='/notice/writeView.kh';" class="btn btn-primary pull-right">글쓰기</button>
		</c:if>
					
				</table>
				
				<form action="/notice/search" method="get">
				<div class="search row">
					<div class="col-xs-2 col-sm-2">
						<select name="searchCondition" class="form-control">
							<option value="all" <c:if test="${searchCondition eq 'all' }">selected</c:if>>전체</option>
							<option value="title" <c:if test="${searchCondition eq 'title' }">selected</c:if>>제목</option>
							<option value="contents" <c:if test="${searchCondition eq 'contents' }">selected</c:if>>내용</option>
						</select>
					</div>
					 
					<div class="col-xs-10 col-sm-10">
						<div class="input-group">
							<input type="text" name="searchValue" value="${searchValue }" class="form-control" id="searchVal">
							<span class="input-group-btn">
								<input type="submit" value="검색" class="btn btn-default" onClick="sbm();">
							</span>
						</div>
					</div>
				</form>
		</section>	
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
                        <button>
                            1:1 문의하기
                        </button>
                        <button>
                            공지사항
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
                            <li><a href="#">Q &amp;A</a></li>
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
	function sbm(){
		var searchVal = document.getElementById("searchVal");
		if(searchVal.value == "") {
			alert("검색어를 입력해주세요.");
			searchVal.focus();
			event.preventDefault();
			return false;
		}
	}	
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>

</body>
</html>