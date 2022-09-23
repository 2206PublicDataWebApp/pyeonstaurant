<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Q&A게시판</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<style>


@media (max-width: 500px) {
#title-cell{
width:65% !important;
}

}
a {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<!-- q&a게시판 영역시작 -->
	<section>
		<!-- 게시판 영역 -->
		<div id="qna-area" class="container">


			<div id="title-area" class="m-3" style="text-align: center">
				<h1>Q&A</h1>
			</div>
			<!-- 게시판 출력영역 -->
			<div id="table-area" class="mt-5">
				<!-- 버튼검색영역 -->
				<div id="button-search-area" class="row">
					<div class="col-6" id="button">
						<!-- 삭제버튼영역 -->

						<button onclick="checkRemove()" class="btn btn-outline-primary">삭제</button>
					</div>

						<!-- 검색영역 -->
					<div class="col-md-6" id="search">
						<!-- 검색창시작 -->
						<form action="/qna/search.do" method="get">
							<div class="row" id="searchArea">
								<!-- 검색 카테고리 -->
								<div class="col-md-2 p-1"" id="searchSelector">
									
										<select class="form-select" id="floatingSelectGrid"
											name="searchCondition">
											<option value="all"
												<c:if test="${searchCondition eq 'all' }"> selected </c:if>>전체</option>
											<option value="title"
												<c:if test="${searchCondition eq 'title' }"> selected </c:if>>제목</option>
											<option value="contents"
												<c:if test="${searchCondition eq 'contents' }"> selected </c:if>>내용</option>
										</select> 
									
								</div>
								<!-- 검색 카테고리 종료 -->
								<!-- 검색어입력창 -->
								<div class="row col-md-8 p-1">
									<div class="col-md">
									
											<input type="text" name="searchValue" class="form-control"
												id="floatingInputGrid" value="${searchValue }"
												required="required"> 
										
									</div>

								</div>
								<!-- 검색어입력창 종료 -->
								<!-- 검색 버튼영역 -->
								<div id="search-button" class="col-2 p-1"" >
									<button type="submit" class="btn btn-primary">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							  <path
												d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
							</svg>
										
									</button>
										
								
								</div>
							</div>
						</form>
						<!-- 검색창 종료 -->
					</div>
					<!-- 버튼 검색영역 종료 -->
				</div>
				<table class="col-12 table table-striped mt-2" style="text-align: center">
					<tr class="" >
						<td style="width:5%"></td>
						<td style="width:16%" class="d-md-table-cell d-none" >번호</td>
						<td style="width:20%"  class="d-md-table-cell d-none">카테고리</td>
						<td style="width:40%" id="title-cell">제목</td>
						<td>글쓴이</td>
						<td  class="d-md-table-cell d-none">작성일</td>
					</tr>

					<c:forEach items="${qList }" var="qList">
						<tr>
							<td>
								<!-- 삭제용 체크박스 --> <input type="checkbox" name="qaNo"
								value="${qList.qaNo }">
							</td>
							<!-- 삭제용 체크 박스 종료 -->
							<td  class="d-md-table-cell d-none">${qList.qaNo }</td>
							<td  class="d-md-table-cell d-none"><c:if test="${qList.qaCategory eq 'Qsystem'}">시스템 문의</c:if>
								<c:if test="${qList.qaCategory eq 'Qrecipe'}">레시피 문의</c:if>
								 <c:if test="${qList.qaCategory eq 'Qother'}">기타 문의</c:if></td>



							<td><a href="/qna/detail.do?qaNo=${qList.qaNo}"> <c:if
										test="${qList.qaSecret == true}">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
			  <path
												d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z" />
			</svg>
									</c:if> ${qList.qaTitle }
							</a></td>
							<td>${qList.memberEmail }</td>
							<td  class="d-md-table-cell d-none">${qList.qaInsertDate }</td>
						</tr>
					</c:forEach>

				</table>
				<!-- 글쓰기 버튼영역 -->
				<div class="col-md-12" id="write-button-area" style="text-align:right">
				<button  class="btn btn-outline-primary" onclick="location.href='/qna/wirteForm.do';">글쓰기</button>
				</div>
			</div>
			<!-- 게시판 출력영역 종료 -->

			<!-- 페이징 영역 -->
			<article id="page-area">
				<div id="article-page" style="text-align: center">
					<!-- 검색/ 일반 페이징 c:if 시작 -->

					<!--  일반 페이징 시작 -->
					<c:if test="${searchValue eq null }">
						<tr align="center" height="20">
							<td colspan="6">
								<!-- 	startNavi가 1일이 아닐때만 출력 --> <c:if
									test="${startNavi ne 1 && startNavi > 0}">
									<a href="/qna/List.do?page=${startNavi-1 }"> <!-- 이전아이콘 -->
										<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
											fill="gray" class="bi bi-arrow-left-square"
											viewBox="0 0 16 16">
					  <path fill-rule="evenodd"
												d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm11.5 5.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z" />
					</svg>
									</a>
								</c:if> <!-- p는 기준을 삼을 임시변수 startNavi부터 시작해 endNavi까지 출력한다 --> <c:forEach
									var="p" begin="${startNavi }" end="${endNavi }">
									<c:if test="${pageNow == p  }">
										<b>${p }</b>
									</c:if>
									<c:if test="${pageNow ne p}">
										<a href="/qna/List.do?page=${p }">${p }</a>
									</c:if>
								</c:forEach> <!-- 	endNavi가 maxPage와 같지 않을때만 출력 --> <c:if
									test="${endNavi < maxPage }">
									<a href="/qna/List.do?page=${endNavi+1 }"> <!-- 다음 아이콘 -->
										<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
											fill="gray" class="bi bi-arrow-right-square"
											viewBox="0 0 16 16">
					  <path fill-rule="evenodd"
												d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm4.5 5.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z" />
					</svg>


									</a>
								</c:if>

							</td>
						</tr>
					</c:if>

					<!--  검색 페이징 시작 -->
					<c:if test="${searchValue ne null }">
						<tr align="center" height="20">
							<td colspan="6">
								<!-- 	startNavi가 1일이 아닐때만 출력 --> <c:if
									test="${startNavi ne 1 && startNavi > 0}">
									<a
										href="/qna/search.do?searchCondition=${searchCondition }&searchValue=${searchValue}&page=${startNavi-1 }">이전</a>
								</c:if> <!-- p는 기준을 삼을 임시변수 startNavi부터 시작해 endNavi까지 출력한다 --> <c:forEach
									var="p" begin="${startNavi }" end="${endNavi }">
									<c:if test="${pageNow == p}">
										<b>${p }</b>
									</c:if>
									<c:if test="${pageNow ne p}">
										<a
											href="/qna/search.do?searchCondition=${searchCondition }&searchValue=${searchValue}&page=${p }">${p }</a>
									</c:if>
								</c:forEach> <!-- 	endNavi가 maxPage와 같지 않을때만 출력 --> <c:if
									test="${endNavi < maxPage }">
									<a
										href="/qna/search.do?searchCondition=${searchCondition }&searchValue=${searchValue}&page=${endNavi+1 }">다음</a>
								</c:if>

							</td>
						</tr>
					</c:if>

					<!--  일반/ 검색용 페이징 종료 -->

				</div>
				<!-- 페이징div종료 -->
			</article>
			<!-- 페이징 영역 종료 -->





		</div>
		<!-- 게시판영역종료 -->
	</section>
	<!-- qna게시판 종료 -->

	<script>
		function checkRemove() {

			var checkbox = document.querySelectorAll('[type=checkbox]');
			var RemoveQaNo = "";
			for (var i = 0; i < checkbox.length; i++) {
				if (checkbox[i].checked) {
					RemoveQaNo += checkbox[i].value + ","

				}

			}
			console.log(RemoveQaNo);
			location.href = '/qna/removeArray.do?array=' + RemoveQaNo;

		}
	</script>
</body>
</html>