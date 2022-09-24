<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${recipe.recipeName }</title>
</head>
<body>

	<style>
#imgDiv {
	width: 100%;
	height: 27rem;
	overflow: hidden;
}

@media ( max-width : 500px) {
	#imgDiv {
		width: 100%;
		height: auto;
		overflow: hidden;
	}
	iframe {
		height: auto;
	}
	
	#other-recipe-area{
	display:none;
	}
	
	
}
/* 미디어 쿼리 영역 종료 */


#mainImg {
	width: 100%;
	height: auto;
	position:  relative;
	top: 10;
}

#article1 {
	border-right: 1px solid lightgray;
	margin: 0 auto;
	text-align: center;
}

#article2 {
	margin: 0 auto;
}

#title {
	text-align: center;
}

#hashtag {
	text-align: left;
}

#wirter-area {
	text-align: right;
}

#other-recipe-area {
	height: 80%;
}

#list-icon {
	position: fixed;
	top: 6%;
	left: 6%;
	z-index: 99;
}

label:hover {
	cursor: pointer
}

#step-img {
	width: 80%;
	height: auto;
}

a{
text-decoration:none !important;
color : black !important;
}

.card-text, #recommand-area{
text-align:center;
}

#recom-bookm-area{
  font-size: 1rem;
  font-weight: 600;
}

#recommand-area{
padding-left: 30px !important;
}


</style>

	<section style="margin: 0 auto;">
		<span id="list-icon-area"> <svg onclick="list();"
				id="list-icon" xmlns="http://www.w3.org/2000/svg" width="50"
				height="50" fill="currentColor" class="bi bi-arrow-left-circle-fill"
				viewBox="0 0 16 16">
  <path
					d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z" />
	</svg>
		</span>


		<div class=" container-lg">

			<div id="imgDiv" class="" style="">
				<img id="mainImg"
					src="/resources/recipeImg/${recipe.mainPicRename }"
					class="img-fluid" alt="...">

			</div>
			<div id="title" class="py-2 row">
				<h1>${recipe.recipeName }</h1>
				<!--  해쉬태그 영역 -->
				<div id="hashtag" class="ps-5 col-md-10">
					<h5>
						<c:if test="${rTag.jmt }">
									#jmt   
									</c:if>
						<c:if test="${rTag.healthy }">
									#건강한 
										</c:if>
						<c:if test="${rTag.goodSpicy }">
									#맛있게 매운 
										</c:if>
						<c:if test="${rTag.full }">
									#든든한 
										</c:if>
						<c:if test="${rTag.soSpicy }">
									#아주 매운 
										</c:if>
						<c:if test="${rTag.sweet }">
									#달콤한 
										</c:if>
						<c:if test="${rTag.easy }">
									#간편한
										</c:if>
						<c:if test="${rTag.party }">
									#파티용 
										</c:if>
					</h5>



				</div>
				<!-- 해쉬태그 영역종료 -->

				<div id="button-area" class="col-md-2">
					<!-- 버튼영역 -->
					<button class="btn btn-primary"
						onclick="location.href='/recipe/modifyForm.do?recipeNo=${recipe.recipeNo }';">수정</button>
					<button class="btn btn-primary"
						onclick="removeRecipe(${recipe.recipeNo });">삭제</button>
				</div>
				<div id="info-area">${recipe.recipeInfo }</div>

			</div>
			<!-- 타이틀 영역 -->
			<hr>

			<div class="col-md-12 m-0 row">
				<!--  아티클 전체 들어감-->
				<div class="col-md-8" id="article1">
					<article>


						<!-- 작성자 영역 -->
						<div id="wirter-area" class="col-md-12">
							<h5>
								작성자 : ${recipe.memberEmail }
								<button class="btn btn-danger">신고</button>
							</h5>
						</div>
						<!-- 작성자 영역종료 -->

						<!-- 비디오 영역 -->
						<div id="youtube-area" class="col-md-12 p-3">
							<!-- 비디오 주소를 입력했을때만-->
							<c:if test="${recipe.recipeVideo ne null }">
								<iframe width="100%" height="400em" src="${recipe.recipeVideo}"
									title="YouTube video player" frameborder="0"
									allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
									allowfullscreen></iframe>
							</c:if>
						</div>




						<!--레시피 순서영역 -->
						<div id="step-area" class="col-md-12">
							<c:forEach items="${rsList }" var="rsList">
								<c:if test="${rsList.recipePicRename ne null }">
									<img id="step-img"
										src="/resources/recipeImg/${rsList.recipePicRename }">
									<br>
								</c:if>

								<p>${rsList.recipeDescription }</p>

							</c:forEach>
						</div>
						<!-- 순서영역 종료 -->

						<!-- 추천, 나만의 레시피 이이콘 영역 -->
						<div id="recom-bookm-area" class="my-2 row">
						<!-- 추천을 하지 않았을때는 검은색 추천을 했다면 빨간 아이콘 -->
						<!-- 추천 아이콘 -->
							<div id="Black-heart" class="p-3 p3 col-6">
	
							<form action="/recipe/recommand.do" method="get">
							<input type="hidden" name="memberEmail" value="">
							<input type="hidden" name="recipeNo" value="${recipe.recipeNo}">
							<label for="recommandButton">
								<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60"
									fill="black" class="bi bi-chat-heart" viewBox="0 0 16 16">
						  <path fill-rule="evenodd"
										d="M2.965 12.695a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2Zm-.8 3.108.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125ZM8 5.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z" />				
						</svg></label>
						<input type="submit" style="display:none" id="recommandButton">
						</form>
						
				
								<br>추천<br> ${recipe.recommandCount }
							</div>
							<!-- 추천아이콘 종료 -->
							
							<!-- 추천 취소 아이콘 -->
							<div id="heart" class="p-3 p3 col-6">
	
							<form action="/recipe/recoRemove.do" method="get">
							<input type="hidden" name="memberEmail" value="">
							<input type="hidden" name="recipeNo" value="${recipe.recipeNo}">
							<label for="recoRomoveButton">
								<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60"
									fill="red" class="bi bi-chat-heart" viewBox="0 0 16 16">
						  <path fill-rule="evenodd"
										d="M2.965 12.695a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2Zm-.8 3.108.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125ZM8 5.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z" />				
						</svg></label>
						<input type="submit" style="display:none" id="recoRomoveButton">
						</form>
						
				
								<br>추천 취소<br> ${recipe.recommandCount }
							</div>
							<!-- 추천취소 아이콘 종료 -->
							
							
							
							
							<!-- 나만의 레시피 아이콘 -->
							<div id="star" class="p-3 p3 col-6">
							<label for="">
							<a href="/myRecipe/add">
								<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60"
									fill="orange" class="bi bi-star" viewBox="0 0 16 16">
						  <path
										d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z" />					
						</svg></a></label>
								<br>나만의 레시피
							</div>
						<!-- 나만의 레시피 아이콘 종료 -->
						
							<!-- 나만의 레시피취소 아이콘 -->
							<div id="star" class="p-3 p3 col-6">
							<label for="">
								<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60"
									fill="orange" class="bi bi-star" viewBox="0 0 16 16">
						    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
						</svg></label>
								<br>나만의 레시피 취소
							</div>
						<!-- 나만의 레시피 아이콘 취소 종료 -->
						
						
						
						
						</div>
						<!-- 추천, 나만의 레시피 이이콘 영역 종료 -->

					</article>
				</div>
				<!-- 아티클1 영역 종료 -->




				<div class="col-md-4 m-0" id="article2">
					<article>
						<div id="material-area" class="m-3">
							<h4 style="text-align: center">레시피 재료</h4>
							<ul>
								<c:forEach items="${rmList}" var="rmList">
									<li>재료: ${rmList.material}, 수량 : ${rmList.amount}
								</c:forEach>
							</ul>
							<hr>
						</div>
						<div id="recipe-time-area" class="m-3" style="text-align: center">
							<h4>조리 시간</h4>
							${recipe.recipeTime }
							<hr>
						</div>
						<div id="other-recipe-area">
							<h4 style="text-align: center">추천 레시피</h4>
							<!-- 추천레시피 출력영역 -->
							<div id="recommand-area">
								<c:forEach items="${recoList}" var="recoList" varStatus="i" begin="1" end="3">

									<div class="card col-md-3 m-3" id="recommand-card-area"style="width: 80%;">
										<div class="img-area" id="normal-img-area">
											<img src="/resources/recipeImg/${recoList.mainPicRename }"
												class="card-img-top" alt="">
										</div>
										<div class="card-body">
											<p class="card-text">
												<a href="/recipe/detail.do?recipeNo=${recoList.recipeNo }">${recoList.recipeName }</a>
											</p>
											
										</div>
									</div>

								</c:forEach>

							</div>
							<!-- 추천 레시피 영역 종료 -->
						</div>



					</article>
				</div>
			</div>

			<article id="reply-area">
				<div id="article3-area">
					<hr>

					<!-- 코멘트 출력영역 시작 -->
					<c:forEach items="${rcList}" var="rcList">
						<!-- 코멘트 한개 출력 -->
						<div id="oneComment">
							<div id="comment" class="row my-2">
								<div id="comment-picture" class="col-md-2 d-none d-md-inline">
									<!-- 코맨트 사진영역 -->

									<svg xmlns="http://www.w3.org/2000/svg" width="80%"
										height="80%" fill="currentColor"
										class="bi bi-person-bounding-box" viewBox="0 0 16 16">
				  					<path
											d="M1.5 1a.5.5 0 0 0-.5.5v3a.5.5 0 0 1-1 0v-3A1.5 1.5 0 0 1 1.5 0h3a.5.5 0 0 1 0 1h-3zM11 .5a.5.5 0 0 1 .5-.5h3A1.5 1.5 0 0 1 16 1.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 1-.5-.5zM.5 11a.5.5 0 0 1 .5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 1 0 1h-3A1.5 1.5 0 0 1 0 14.5v-3a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v3a1.5 1.5 0 0 1-1.5 1.5h-3a.5.5 0 0 1 0-1h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 1 .5-.5z" />
				  					<path
											d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm8-9a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
									</svg>

								</div>
								<!-- 코멘트 사진 영역 종료 -->

								<div id="commnet-contens" class="col-md-10">
									<!-- 코멘트 내용 영역 -->
									<div
										class="shadow-lg p-3 mb-5 bg-body rounded mt-4 text-justify">
										<div id="comment-row" class="row">
											<div id="comment-writer" class="col-md-10">
												<h4>${rcList.memberEmail }</h4>
											</div>
											<div id="comment-button" class="col-md-2"
												style="text-align: right">신고</div>
										</div>
										<div id="comment-text-area">
											<span>${rcList.commentDate }</span> <br>
											<p>${rcList.commentContents }</p>
										</div>
										<div id="comment-delmodi-buttom-area"
											style="text-align: right">
											<button type="button" onclick="modifyViewOn(this);"
												class="btn btn-outline-primary">수정</button>
											<button
												onclick="removeComment(${rcList.commentNo},${rcList.recipeNo} );"
												class="btn btn-outline-primary">삭제</button>

										</div>

									</div>
								</div>
							</div>
							<!-- 코멘트 내용영역종료 -->
						</div>
						<!-- 코멘트 수정영역 시작 -->
						<div class="modifyView">
							<form action="/recipe/commentModify.do" method="post">
								<div id="comment-modify-area" class="row my-2">
									<input type="hidden" value="${rcList.memberEmail }"
										name="memberEmail"> <input type="hidden"
										value="${rcList.recipeNo }" name="recipeNo"> <input
										type="hidden" value="${rcList.commentNo }" name="commentNo">
									<div id="comment-textarea" class="col-md-11">
										<!-- 세션에서 사용자 id가지고 올것 -->
										<div class="form-floating">
											<textarea name="commentContents" class="form-control"
												placeholder="Leave a comment here" id="floatingTextarea2"
												style="height: 100px">${rcList.commentContents }</textarea>
											<label for="floatingTextarea2">댓글을 등록해주세요</label>
										</div>
									</div>

									<div id="comment-button-area" class="col-md-1">
										<input type="submit" value="수정" style="height: 50%;"
											class="btn btn-outline-primary">
										<button type="button" style="height: 50%;"
											onclick="modifyViewOff(this)"
											class="btn btn-outline-danger my-1">취소</button>
									</div>
								</div>
							</form>
						</div>
						<!-- 코멘트 수정영역 종료 -->

						<!-- 코멘트 출력 영역종료 -->
					</c:forEach>
					<hr>

					<!-- 코멘트 작성영역 -->

					<form action="/recipe/commentWrite.do" method="post">
						<div id="comment-write-area" class="row">
							<input type="hidden" value="" name="memberEmail"> <input
								type="hidden" value="${recipe.recipeNo }" name="recipeNo">
							<div id="comment-textarea" class="col-md-11">
								<!-- 세션에서 사용자 id가지고 올것 -->
								<div class="form-floating">
									<textarea name="commentContents" class="form-control"
										placeholder="Leave a comment here" id="floatingTextarea2"
										style="height: 100px"></textarea>
									<label for="floatingTextarea2">댓글을 등록해주세요</label>
								</div>
							</div>

							<div id="comment-button-area" class="col-md-1">
								<input type="submit" value="등록" style="height: 100%;"
									class="btn btn-outline-primary">
							</div>



						</div>
						<!-- 코멘트 작성영역 종료 -->
					</form>


				</div>
				<!-- 아트클3 에어리어 div종료 -->
			</article>
			<!-- 아티클3 종료 -->

		</div>
		</article>
		<!-- 아티클 전체 들어감 -->



		</div>
		<!-- 메인 내용 폼 전체 들어감 -->
	</section>

	<!-- 부트스트랩 스타일 -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
<script>
//레시피 삭제확인
function removeRecipe(recipeNo){
	if(confirm("삭제 하시겠습니까? 삭제하면 복구할수 없습니다")){
		location.href='/recipe/remove.do?recipeNo='+recipeNo;
	}
}

//리스트로 이동
function list(){
	location.href='/recipe/recipeList.do';
	
}

//코멘트 수정창 안보이게 하기
var modifyView = document.querySelectorAll('.modifyView')
for(var i=0; i<modifyView.length;i++){
	modifyView[i].style.display='none';
}

//코멘트 수정창 열기
function modifyViewOn(obj) {
	obj.parentElement.parentElement.parentElement.parentElement.parentElement.style.display='none'
	obj.parentElement.parentElement.parentElement.parentElement.parentElement.nextElementSibling.style.display='block'

	
}

//코멘트 수정창 닫기
function modifyViewOff(obj) {
	obj.parentElement.parentElement.parentElement.parentElement.style.display='none';
	obj.parentElement.parentElement.parentElement.parentElement.previousElementSibling.style.display="block";
}

//댓글 삭제 확인
function removeComment(commentNo,recipeNo) {
	
	if(confirm("댓글을 삭제 하시겠습니까? 삭제하면 복구할수 없습니다")){
		location.href='/recipe/removeComment.do?commentNo='+commentNo+'&recipeNo='+recipeNo;
	}
	
}
</script>
</html>