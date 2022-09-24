<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>레시피 등록</title>
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
label{
padding: 0px;

}
#up-area-left{
padding: 0px;
margin:0 auto;
}
.input-file-button{
padding: 0px;
margin:0 auto;
}

#output{
width:100%;
height:auto;
}

#recipe-wrtie-from{
padding: 0px;
margin:0 auto;
}
.overflow-hidden{
font-size:0.8em;
}
.container{
padding: 0px;
margin:0 auto;

}
.float-md-start{
padding: 0px;
margin:0 auto;
}

.form-floating{

padding: 0px;
margin:0 auto;
}

.ms-1,.me-1{
padding: 0px !important;
margin:0 auto !important;
margin-bottom : 1em !important;
}

[name="recipeDescription"]{
height: 15rem !important;
width: 100% !important;
}
#article2-area{
padding: 0px !important;
margin:0 auto !important;
}

.detailImg{
width:100%;
height:auto;
}

.container-md{
padding: 0px !important;
}
.pt-3{
margin-top:10px !important;
}

section{
padding-left:1.5em !important;
}
#recipe-button .col-md-12 .col-md-6{
padding-left:0 !important;

}
}


body {

}

#recipe-button{
text-align:center;
}

.button{
width:100%;
padding:0.5em;

}

#article-area2{
justify-content: space-evenly
}

</style>

</head>


<body>
<section class="container">

<div class="container row col-md-12" id="recipe-wrtie-from"><!-- 레시피 입력 폼 시작 -->
	<form action="/recipe/regist.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name ="memberEmail" value="${loginUser.memberEmail }">
	
			<article id="uparea"><!-- 상단 에어리어 -->
			<div class="col-12 row p-0" id="article1">

				<!-- 여기는 대표 이미지 박스 상단 왼쪽영역 -->
				<div class="col-md-5 container-md" id="up-area-left">
 
					<div class="row col-md-4 m-2 "> <!-- 이미지input + 이미지 삭제 버튼 -->

						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-x-circle-fill float-md-end col-md-12" 
							onclick="mainPicDel()">
						<path
								d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z" />
					  </svg>
					  
						<label class="input-file-button float-md-start col-md-12"   for="input-file">
							<img id="output" class="mx-auto " width="400px" height="270px"
							style="background-color: gray; border-radius: 10px;">
						</label> <input type="file" id="input-file" style="display: none"
							accept="image/jpeg, image/png, image/jpg" name="mainPicture"
							class="isFile" onchange="loadFile(event)" required="required" />


					</div>

				</div><!-- 이미지 박스 영역 상단왼쪽영역 종료 -->

				<!-- 상단 오른쪽 영역 -->
				<div class="col-md-7 col-12  container-md" id="uparea-right"> 
				<!-- 상단 오른쪽 위 영역 -->
					<div class="row"  id="title-video-area">
						<div class="form-floating col-12 my-2">
							<input type="text" class="form-control" id="" name="recipeName" required="required">
							<label for="floatingInput">레시피 제목</label>
						</div>
					
						<div class="form-floating col-12 ">
							<input type="text" class="form-control" id="" name="recipeVideo" onblur="isYoutube()">
							<label for="floatingInput">유튜브 링크</label>
						</div>
					</div> <!--  상단 오른쪽 위 영역 종료 -->
					
					<!-- 상단 오른쪽 아래 영역 -->
					<div class="mt-4 col-12">
						<label for="validationCustom04" class="form-label"><h5>카테고리</h5></label>
						<select class="form-select" id="" name="recipeCategory" required>
							<option selected disabled value="">카테고리 선택</option>
							<option value="mael">식사</option>
							<option value="relish">술안주</option>
							<option value="dessert">간식</option>
							<option value="drink">술/음료</option>
						</select>
						<div class="invalid-feedback">카테고리를 선택하세요</div>
						<br>

						<div class="form-floating align-items-center col-12 ">
							<input type="text" class="form-control mb-2" id=""
								name="recipeTime"> <label for="floatingInput">소요시간</label>
						</div>


						<div class="col-md-12 col-12">
							<h5>해시태그</h5>
							<div class="overflow-hidden col-12 ">
								<label class="w-25 float-start"><input
									class="form-check-input" type="checkbox" name="jmt"
									value="true"> JMT</label> <label class="w-25 float-start"><input
									class="form-check-input" type="checkbox" name="healthy"
									value="true"> 건강한</label> <label class="w-25 float-start"><input
									class="form-check-input" type="checkbox" name="goodSpicy"
									value="true"> 맛있게 매운</label> <label class="w-25 float-start"><input
									class="form-check-input" type="checkbox" name="soSpicy"
									value="true"> 아주매운</label> <label class="w-25 float-start"><input
									class="form-check-input" type="checkbox" name="sweet"
									value="true"> 달콤한</label> <label class="w-25 float-start"><input
									class="form-check-input" type="checkbox" name="easy"
									value="true"> 간편한</label> <label class="w-25 float-start"><input
									class="form-check-input" type="checkbox" name="full"
									value="true"> 든든한</label> <label class="w-25 float-start"><input
									class="form-check-input" type="checkbox" name="party"
									value="true"> 파티용</label>
							</div>
						</div>

					</div><!-- 상단 오른쪽 아래 영역 종료 -->

				</div><!--  상단 오른쪽 영역 종료 -->

				<!-- 소개 영역 -->
				<div class=" row m-0 mt-3 mb-3  p-0 col-12 "> 
					<div class="form-floating">
						<input type="text" class="form-control" id="" maxlength="30"
							name="recipeInfo" required="required"> <label
							for="floatingInput" required="required"> 간단한소개 (30자 미만)</label>
					</div>
				</div><!-- 소개영역종료 -->


				<!-- 재료 입력-->
				<div class="container-md align-items-center">



					<div class=" col-md-12 m-0 p-0">

						<div class="row col-md-6 col-12 float-md-start p-3 me-1">
							<div class="form-floating col-md-6">
								<input type="text" class="form-control" id="" maxlength="10"
									name="material" onblur="materialCheck(this);" required="required"> <label for="floatingInput" >재료명</label>
							</div>
							<div class="form-floating col-md-6">
								<input type="text" class="form-control" id="" maxlength="10"
									name="amount" onblur="materialCheck(this);"required="required"> <label for="floatingInput">재료수량</label>
							</div>
						</div>

						<div class="row col-md-6 col-12 float-md-start p-3 ms-1">
							<div class="form-floating col-md-6">
								<input type="text" class="form-control" id="" maxlength="10"
									name="material" onblur="materialCheck(this);"> <label for="floatingInput">재료명</label>
							</div>

							<div class="form-floating col-md-6">
								<input type="text" class="form-control" id="" maxlength="10"
									name="amount" onblur="materialCheck(this);"> <label for="floatingInput">재료수량</label>
							</div>
						</div>





						<div class="col-12 col-md-12">

							<div class="row col-md-6 col-12 float-md-start p-3 me-1">
								<div class="form-floating col-md-6">
									<input type="text" class="form-control" id="" maxlength="10"
										name="material" onblur="materialCheck(this);"> <label for="floatingInput">재료명</label>
								</div>
								<div class="form-floating col-md-6">
									<input type="text" class="form-control" id="" maxlength="10"
										name="amount" onblur="materialCheck(this);"> <label for="floatingInput">재료수량</label>
								</div>
							</div>

							<div class="row col-md-6 col-12 float-md-start p-3 ms-1">
								<div class="form-floating col-md-6">
									<input type="text" class="form-control" id="" maxlength="10"
										name="material" onblur="materialCheck(this);"> <label for="floatingInput">재료명</label>
								</div>

								<div class="form-floating col-md-6">
									<input type="text" class="form-control" id="" maxlength="10"
										name="amount" onblur="materialCheck(this);"> <label for="floatingInput">재료수량</label>
								</div>
							</div>

							<div class=" col-md-12 col-12   border-bottom-1">

								<div class="row col-md-6 col-12 float-md-start p-3 me-1">
									<div class="form-floating col-md-6">
										<input type="text" class="form-control" id="" maxlength="10"
											name="material" onblur="materialCheck(this);"> <label for="floatingInput">재료명</label>
									</div>
									<div class="form-floating col-md-6">
										<input type="text" class="form-control" id="" maxlength="10"
											name="amount" onblur="materialCheck(this);"> <label for="floatingInput">재료수량</label>
									</div>
								</div>

								<div class="row col-md-6 col-12 float-md-start p-3 ms-1" >
									<div class="form-floating col-md-6">
										<input type="text" class="form-control" id="" maxlength="10"
											name="material" onblur="materialCheck(this);"> <label for="floatingInput">재료명</label>
									</div>

									<div class="form-floating col-12  col-md-6">
										<input type="text" class="form-control" id="" maxlength="10"
											name="amount" onblur="materialCheck(this);"> <label for="floatingInput">재료수량</label>

									</div>

								</div>


							</div>

						</div>




					</div>

				</div><!--  재료 입력 영역 종료 -->
			</div>
			</article><!-- 상단 에어리어 종료 -->
			
			
		<!-- 레시피 입력 하단영역 -->
		<article id="down-area" class="container">
			<div class="recipeDetail container-md row" id="article2-area">
				<!-- 여기서부터 레시피 설명-->
				
				<!-- 레시피 step한개 입력영역 -->
					<hr>
				<div id="oneStep-area" class="row"> 
					<!-- 레시피 설명영역 -->
					<div class="container-md p-3  col-md-6 p-2">

						<div class="form-floating col-md-12 p-0 pt-3">
							<textarea class="form-control" name="recipeDescription"  placeholder=""
								id="floatingTextarea2" style="height: 250px" required="required"></textarea>
							<label for="floatingTextarea2" class="mt-3">설명을 입력하세요</label>
						</div>

						<!-- 					설명에 쉼표를 넣었을때 배열로 만들지 않기위한 더미 value -->
						<input type="text" name="recipeDescription" value="ab22bb"
							style="display: none">

					</div><!-- 레시피 설명영역종료 -->

					<!-- 이미지 미리보기 이미지 파일 -->
					<div class="col-md-6 p-2">
						<div
							class="col-md-5 col-sm-12 container-md align-items-center m-0">
							<div class="row col-md-4 col-sm-12  align-items-center">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-x-circle-fill float-end"
									onclick="PicDel(this)">
							<path
										d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z" />
						  </svg>

								<label class="input-file-button float-md-start"> <img
									class="detailImg mx-auto" width="400px" height="270px"
									style="background-color: gray; border-radius: 10px;"> <input
									type="file" name="recipePicture" class="isFile"
									style="display: none" accept="image/jpeg, image/png, image/jpg"
									onchange="imgView(this);">
								</label>

							</div>

						</div>
					</div>
				</div>
				<!-- 레시피 한블럭 설명종료 -->
				
				
				<!-- 여기서부터 레시피 설명-->
				<div class="row">
					<!-- 레시피 설명역역 -->
					<div class="container-md p-3 col-md-6 p-2">

						<div class="form-floating col-md-12 p-0 pt-3">
							<textarea class="form-control" placeholder=""
								id="floatingTextarea2" name="recipeDescription"  style="height: 250px"></textarea>
							<label for="floatingTextarea2" class="mt-3">설명을 입력하세요</label>
						</div>

						<!-- 					설명에 쉼표를 넣었을때 배열로 만들지 않기위한 더미 value -->
						<input type="text" name="recipeDescription" value="ab22bb"
							style="display: none">

					</div><!-- 레시피 설명영역 종료 -->

					<!-- 이미지 미리보기 이미지 파일 -->
					<div class="col-md-6 p-2">
						<div
							class="col-md-5 container-md align-items-center m-0">
							<div class="row col-md-4  align-items-center">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-x-circle-fill float-end"
									onclick="PicDel(this)">
							<path
										d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z" />
						  </svg>

								<label class="input-file-button float-md-start"> <img
									class="detailImg mx-auto" width="400px" height="270px"
									style="background-color: gray; border-radius: 10px;"> <input
									type="file" name="recipePicture" class="isFile"
									style="display: none" accept="image/jpeg, image/png, image/jpg"
									onchange="imgView(this);">
								</label>

							</div>

						</div>
					</div><!-- 이미지 영역 종료 -->
				</div>
				<!-- 레시피 한블럭 설명종료 -->
				
				
				<!-- 여기서부터 레시피 설명-->
				<div id="REdetail" class="REdetailC row">

					<!-- 레시피 설명영역 -->
					<div class="container-md p-3 col-md-6 p-2">

						<div class="form-floating col-md-12 p-0 pt-3">
							<textarea class="form-control" placeholder=""
								id="floatingTextarea2" name="recipeDescription" style="height: 250px"></textarea>
							<label for="floatingTextarea2" class="mt-3">설명을 입력하세요</label>
						</div>

						<!-- 					설명에 쉼표를 넣었을때 배열로 만들지 않기위한 더미 value -->
						<input type="text" name="recipeDescription" value="ab22bb"
							style="display: none">

					</div><!-- 설명영역종료 -->

					<!-- 이미지 미리보기 이미지 파일 -->
					<div class="col-md-6 p-2" >
						<div
							class="col-md-5 container-md align-items-center m-0">
							<div class="row col-md-4  align-items-center">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-x-circle-fill float-end"
									onclick="PicDel(this)">
							<path
										d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z" />
						  </svg>

								<label class="input-file-button float-md-start">
								 <img class="detailImg mx-auto" width="400px" height="270px"
									style="background-color: gray; border-radius: 10px;">
								 <input type="file" name="recipePicture" class="isFile"
									style="display: none" accept="image/jpeg, image/png, image/jpg"
									onchange="imgView(this);">
								</label>

							</div>

						</div>
					</div><!-- 이미지 영역종료 -->
				</div>
				<!-- 레시피 한블럭 설명종료 -->
				<span id="addplace"></span>
			</div>
			<!-- 레시피 종료 -->
			
			
			<svg class="m-2" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-plus-circle-fill" viewBox="0 0 16 16" onclick="addDe()">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
</svg>

<svg  class= "m-2"xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-dash-circle-fill" viewBox="0 0 16 16" onclick="removeDe()">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h7a.5.5 0 0 0 0-1h-7z"/>
</svg>

</article><!-- 하단 영역 종료 -->





<!-- 버튼영역 시작 -->
<article id="recipe-button">

			<div class="col-md-12 row ">
				<div class="col-md-6">
				<input type="submit" value="등록" onclick="checkMainPic();" class="button btn btn-outline-primary" >
				</div>
				<div class="col-md-6">
				<button class="button btn btn-outline-primary" type="button" onclick="location.href='/recipe/recipeList.do'">취소</button>
				</div>
			</div>
</article><!-- 버튼영역 종료 -->
	</form>
</div><!-- 레시피 입력 폼 종료 -->
</section>	



	<script>
	
	//유튜브 링크 유효성체크//
	
 	var youUrl = /(http:|https:)?(\/\/)?(www\.)?(youtube.com|youtu.be)\/(watch|embed)?(\?v=|\/)?(\S+)?/g;
	function isYoutube(){
		var youtube = document.querySelector('[name="recipeVideo"]');
		if(!youUrl.test(youtube.value)){
			  alert("유튜브 주소는 embed이 포함된 고유주소로 입력해주세요")
			  youtube.value="";
			
		} 
		
	}
	
	
	///설명 추가/삭제////
	var detailForm =document.querySelector('#REdetail');
	var addplace =document.querySelector('#addplace');
	var count = 3;
	function addDe(){
		if(count<=10){
		addplace.appendChild(detailForm.cloneNode(true));
		document.querySelectorAll('.REdetailC')[document.querySelectorAll('.REdetailC').length-1].childNodes[3].childNodes[1].childNodes[1].value="";
		document.querySelectorAll('.REdetailC')[document.querySelectorAll('.REdetailC').length-1].childNodes[8].childNodes[1].childNodes[1].childNodes[3].childNodes[1].src='';
		
		count++;
		}
		
		
	}
	
	function removeDe(){
	var detailFormClass =document.querySelectorAll('.REdetailC');
		if(count>3){
			 detailFormClass[detailFormClass.length-1].remove();
		count--;
		}
		
		
	}

	
	
		function loadFile(event) {
			var output = document.getElementById('output');
			output.src = URL.createObjectURL(event.target.files[0]);
			output.onload = function() {
				URL.revokeObjectURL(output.src) // free memory
			};
			imgCheck()
		};

		///// 이미지파일 체크 시작 ////
		var imgFile = document.querySelectorAll('.isFile');
		var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/i;
		var fileSize;
		function checkMainPic() {
			if (imgFile[0].value == "") {
				alert("대표사진은 필수입니다!");

			}
		};

		function imgCheck() {
			for (var i = 0; i < imgFile.length; i++) {
				if (imgFile[i].value != "") {

					if (!imgFile[i].value.match(fileForm)) {
						alert("이미지 파일만 업로드 가능");
						imgFile[i].value = "";

					}
				}
			}

		};

		/////이미지 확장자 체크 종료///

		function imgView(obj) {

			var imgid = obj.previousElementSibling;

			imgid.src = URL.createObjectURL(event.target.files[0]);
			imgid.onload = function() {
				URL.revokeObjectURL(imgid.src) // free memory

			}
			imgCheck()

		};

		function mainPicDel() {
			imgFile[0].value = "";
			output.removeAttribute('src');
		}

		function PicDel(obj) {	
			var imgfiles = obj.nextElementSibling.childNodes[1];
			var imgfilesinput = obj.nextElementSibling.childNodes[3];
			imgfilesinput.value = "";
			imgfiles.removeAttribute('src');

		}
		
		
		
		//재료 유효성 검사//
		var check = /,/
		
		function materialCheck(obj){
			
				if(check.test(obj.value)){
					alert(",는 사용할수 없습니다.");
					obj.value="";
				
			}
			
		}
		
	</script>


</body>
</html>