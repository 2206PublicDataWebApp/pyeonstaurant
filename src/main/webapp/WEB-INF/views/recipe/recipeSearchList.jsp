<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>검색어</title>
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
@media ( max-width : 500px) {
	#button-area {
		text-align: center;
	}
}

#serach-title-area {
	text-align: center;
	margin: 3rem 0;
}

#write-icon {
	position: fixed;
	top: 6%;
	left: 6%;
	z-index: 99;
}

#jo:hover, #dun:hover {
	background-color: rgb(101, 241, 46);
}

#chu:hover {
	background-color: rgb(154, 0, 192);
}

.card {
	border: 0 !important;
	text-align: center;
}

a {
	text-decoration: none;
	color: black;
}

.img-area {
	width: 100%;
	height: 10em;
	overflow: hidden;
}

.normal-img-area {
	width: 80%;
	height: 10em;
	overflow: hidden;
	margin: 0 auto;
}

.normal-card-body {
	padding: 2px;
}

#wirte-icon-area:hover {
	cursor: pointer
	
}


.normal-img-area{
	margin-left: 0px !important;
    margin-right: 0px !important;
    width: 100%;
    border-radius: 15px;
}
.card-img-top{
width:100%;

}
.card-text{
font-weight: 600;
}


#list-area .card{
padding:0;
margin:0 auto !important;
}

 p{margin : 0 auto;
}

#list-area .card .card-body{

    margin-bottom: 30px;

}
img:hover{
transform: scale(1.1);
transition:.1s;
}
</style>

</head>
<body>

<c:if test="${loginUser != null }"> 
<!-- 로그인 했을때만 보임  -->
	<!--글 입력 아이콘 영역-->
	<span id="wirte-icon-area"> <svg
			onclick="location.href='/recipe/writeView.do'" id="write-icon"
			xmlns="http://www.w3.org/2000/svg" width="50" height="50"
			fill="currentColor" class="bi bi-arrow-left-circle-fill"
			viewBox="0 0 16 16">
               <path
				d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z" />
               </svg>
	</span>
 </c:if> 

	<section class="container-md">

		<div id="main-contents" class="">
			<!-- 검색명 출력 영역-->
			<div id="serach-title-area">
				<div>
					<h1>검색어</h1>
				</div>

				<!-- 검색 창 영역 -->
				<div class="col-md-6 container" id="search"
					style="text-align: center">
					<!-- 검색창시작 -->
					<form action="/recipe/recipeSearch.do" method="get">
						<div class="row" id="searchArea">
							<!-- 검색 카테고리 -->
							<div class="col-md-2 col-3 p-1" " id="searchSelector">

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
							<div class="row col-md-8  col-8 p-1">
								<div class="col-md">

									<input type="text" name="searchValue" class="form-control"
										id="floatingInputGrid" value="${searchValue }"
										required="required">

								</div>

							</div>
							<!-- 검색어입력창 종료 -->
							<!-- 검색 버튼영역 -->
							<div id="search-button" class="col-md-2 col-1 p-1"
								style="width: auto;">
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
				</div>
				<!-- 검색창 종료 -->

			</div>

			<!--본문구간  -->
			<div id="contetns-area" class="container-md" style="">
				<hr>
				<!--정렬 버튼 영역-->
				<div id="setp-aera" class="row" style="">
					<div id="blank-area" class="col-md-9"></div>
					<div id="button-area" class="col-md-3">
						<button type="button" class="btn" name="listCondition"
							onclick="like(value);" style="color: gray" id="jo"
							value="viewCount">조회수</button>
						|
						<button type="button" id="chu" class="btn " name="listCondition"
							style="color: gray" onclick="like(value);" value="recommandCount">추천순</button>
						|
						<button type="button" id="dun" class="btn " name="listCondition"
							onclick="like(value);" style="color: gray" value="insertDate">등록일</button>
					</div>

				</div>
				<!--정렬 버튼 영역종료-->
				<!--랭킹영역-->
				<div id="rank-area" class="row"
					style="text-align: center; justify-content: space-evenly">

					<c:forEach items="${rList}" var="recipe" varStatus="i" begin="1"
						end="3">


						<div class="card col-md-4 m-3 overflow-hidden"
							style="width: 18rem; height: auto;">
							<!-- 순위 아이콘 if 문 -->
							<c:if test="${i.count == 1 }">
								<svg class="m-2" xmlns="http://www.w3.org/2000/svg" width="3em"
									height="3em" fill="currentColor" class="bi bi-1-square"
									viewBox="0 0 16 16">
						  <path
										d="M9.283 4.002V12H7.971V5.338h-.065L6.072 6.656V5.385l1.899-1.383h1.312Z" />
						  <path
										d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2Zm15 0a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2Z" />
						</svg>

							</c:if>

							<c:if test="${i.count == 2 }">
								<svg class="m-2" xmlns="http://www.w3.org/2000/svg" width="3em"
									height="3em" fill="currentColor" class="bi bi-2-square"
									viewBox="0 0 16 16">
						  <path
										d="M6.646 6.24v.07H5.375v-.064c0-1.213.879-2.402 2.637-2.402 1.582 0 2.613.949 2.613 2.215 0 1.002-.6 1.667-1.287 2.43l-.096.107-1.974 2.22v.077h3.498V12H5.422v-.832l2.97-3.293c.434-.475.903-1.008.903-1.705 0-.744-.557-1.236-1.313-1.236-.843 0-1.336.615-1.336 1.306Z" />
						  <path
										d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2Zm15 0a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2Z" />
						</svg>

							</c:if>

							<c:if test="${i.count == 3 }">
								<svg class="m-2" xmlns="http://www.w3.org/2000/svg" width="3em"
									height="3em" fill="currentColor" class="bi bi-3-square"
									viewBox="0 0 16 16">
						  <path
										d="M7.918 8.414h-.879V7.342h.838c.78 0 1.348-.522 1.342-1.237 0-.709-.563-1.195-1.348-1.195-.79 0-1.312.498-1.348 1.055H5.275c.036-1.137.95-2.115 2.625-2.121 1.594-.012 2.608.885 2.637 2.062.023 1.137-.885 1.776-1.482 1.875v.07c.703.07 1.71.64 1.734 1.917.024 1.459-1.277 2.396-2.93 2.396-1.705 0-2.707-.967-2.754-2.144H6.33c.059.597.68 1.06 1.541 1.066.973.006 1.6-.563 1.588-1.354-.006-.779-.621-1.318-1.541-1.318Z" />
						  <path
										d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2Zm15 0a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2Z" />
						</svg>

							</c:if>
							<!-- if문 종료 -->


							<div id="rank-img-area" class="img-area">
								<img src="/resources/recipeImg/${recipe.mainPicRename } "
									class="card-img-top" alt="레시피사진">
							</div>
							<div class="card-body">
								<h5 class="card-title">${recipe.recipeName }</h5>
								<a href="/recipe/detail.do?recipeNo=${recipe.recipeNo }"
									class="btn btn-outline-info">레시피 보기</a>
							</div>
						</div>
					</c:forEach>
					<!-- 랭킹 3위 출력완료 -->





					<div id="second-area" class="col-md-4"></div>
					<div id="third-area" class="col-md-4"></div>
					<hr>
				</div>
				<!--랭킹영역 종료-->
				<!--일반 리스트 영역-->
				<div id="list-area" class="row"
					style="justify-content: space-around;">
					<c:forEach items="${rList}" var="recipe" varStatus="i" begin="4"
						end="${fn:length(rList)}">




						<div class="card col-md-3 m-3" style="width: 18rem;">
						<a href="/recipe/detail.do?recipeNo=${recipe.recipeNo }">
							<div class="normal-img-area" id="normal-img-area">
							
								<img src="/resources/recipeImg/${recipe.mainPicRename }"
									class="card-img-top" alt="">
							</div>
							<div class="card-body normal-card-body">
								<p class="card-text">
									${recipe.recipeName }
								
								<p>${recipe.recipeInfo }</p>
							</div></a>
						</div>

					</c:forEach>


				</div>
				<!--일반 리스트 영역종료-->

			</div>
			<!-- 본문 구간 종료 -->


			<!-- 페이징 영역 시작 -->
			<div id="page-area">

				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item"><c:if test="${startNavi !=1}">
								<a class="page-link"
									href="/search/move.kh?page=${startNavi - 1 }"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a>
							</c:if></li>
						<c:forEach var="p" begin="${startNavi }" end="${endNavi }">
							<!-- 현재페이지면 진하게 -->
							<c:if test="${currentPage eq P }">
								<li class="page-item"><a class="page-link" href="#"><b>${p }</b></a></li>
							</c:if>
							<c:if test="${currentPage ne P }">
								<li class="page-item"><a class="page-link"
									href="/search/search/search.kh?page=${p }&searchCondition=${searchCondition}&searchValue=${searchValue}$listCondition=${listCondition}">
										${p }</a></li>
							</c:if>
						</c:forEach>
						<li class="page-item"><c:if test="${currentPage ne p }">
								<a class="page-link"
									href="search/move.kh?page=${currentPage+3 }" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</c:if></li>
					</ul>
				</nav>




			</div>

		</div>



	</section>

</body>
</html>