<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<head>

<title>레시피 수정</title>
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
body {
	margin: 0 auto;
}
</style>

</head>


<body>

	<form action="/recipe/modify.do" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="recipeNo" value="${recipe.recipeNo }">
		<div class="container-lg align-items-center">
			<div class="container-lg col-sm-12 row align-items-center p-0">


				<!-- 여기는 대표 이미지 박스 -->
				<div class="col-md-5 col-sm-12 container-lg align-items-center">

					<div class="row col-md-4 m-2 col-sm-12  align-items-center">

						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-x-circle-fill float-end"
							onclick="mainPicDel()">
						<path
								d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z" />
					  </svg>
						<label class="input-file-button float-start" for="input-file">
							<img id="output" class="mx-auto " width="400px" height="270px"
							src="/resources/recipeImg/${recipe.mainPicRename }"
							style="background-color: gray; border-radius: 10px;">
						</label> <input type="file" id="input-file" style="display: none"
							accept="image/jpeg, image/png, image/jpg" name="mainPicture"
							class="isFile" onchange="loadFile(event)" />
							<!-- 수정 전 이미지이름 전송 -->
							<input type="hidden" name="mainPicRename" value="${recipe.mainPicRename }">
							<input type="hidden" name="mainPic" value="${recipe.mainPic }">


					</div>

				</div>


				<div class="col-md-7 container-lg col-sm-12">

					<div class="form-floating col-sm-12 ">
						<input type="text" class="form-control" id="" name="recipeName"
							value="${recipe.recipeName }"> <label for="floatingInput">레시피
							제목</label>
					</div>
					<br>
					<div class="form-floating col-sm-12 ">
						<input type="text" class="form-control" id="" name="recipeVideo"
							value="${recipe.recipeVideo }" onblur="isYoutube()"> <label
							for="floatingInput">유튜브 링크</label>
					</div>

					<div class="mt-5 col-12">
						<label for="validationCustom04" class="form-label"><h5>카테고리</h5></label>
						<select class="form-select" id="" name="recipeCategory" required>
							<option selected disabled value="">카테고리 선택</option>
							<option value="mael"
								<c:if test="${recipeCategory == mael}"> selected</c:if>>식사</option>
							<option value="relish"
								<c:if test="${recipeCategory == relish}"> selected</c:if>>술안주</option>
							<option value="dessert"
								<c:if test="${recipeCategory == dessert}"> selected</c:if>>간식</option>
							<option value="drink"
								<c:if test="${recipeCategory == drink}"> selected</c:if>>술/음료</option>
						</select>
						<div class="invalid-feedback">카테고리를 선택하세요</div>
						<br>

						<div class="form-floating align-items-center">
							<input type="text" class="form-control mb-2" id=""
								value="${recipe.recipeTime }" name="recipeTime"> <label
								for="floatingInput">소요시간</label>
						</div>


						<div class="col-md-12 col-sm-12">
							<h5>해시태그</h5>
							<div class="overflow-hidden">
								<label class="w-25 float-start"> <input
									class="form-check-input" type="checkbox" name="jmt"
									<c:if test="${rTag.jmt==true }">checked</c:if> value="true">
									JMT
								</label> <label class="w-25 float-start"> <input
									class="form-check-input" type="checkbox" name="healthy"
									<c:if test="${rTag.healthy==true }">checked</c:if> value="true">
									건강한
								</label> <label class="w-25 float-start"><input
									class="form-check-input" type="checkbox" name="goodSpicy"
									<c:if test="${rTag.goodSpicy==true }">checked</c:if>
									value="true"> 맛있게 매운</label> <label class="w-25 float-start"><input
									class="form-check-input" type="checkbox" name="soSpicy"
									<c:if test="${rTag.soSpicy==true }">checked</c:if> value="true">
									아주매운</label> <label class="w-25 float-start"><input
									class="form-check-input" type="checkbox" name="sweet"
									<c:if test="${rTag.sweet==true }">checked</c:if> value="true">
									달콤한</label> <label class="w-25 float-start"><input
									class="form-check-input" type="checkbox" name="easy"
									<c:if test="${rTag.easy==true }">checked</c:if> value="true">
									간편한</label> <label class="w-25 float-start"><input
									class="form-check-input" type="checkbox" name="full"
									<c:if test="${rTag.full==true }">checked</c:if> value="true">
									든든한</label> <label class="w-25 float-start"><input
									class="form-check-input" type="checkbox" name="party"
									<c:if test="${rTag.party==true }">checked</c:if> value="true">
									파티용</label>
							</div>
						</div>

					</div>

				</div>




				<br>

				<div class=" row m-0 mt-3 mb-3  p-0 ">
					<div class="form-floating">
						<input type="text" class="form-control" id="" maxlength="30"
							name="recipeInfo" value="${recipe.recipeInfo}"
							required="required"> <label for="floatingInput">
							간단한소개 (30자 미만)</label>
					</div>
				</div>


				<!-- 재료 입력-->
				<div class="container align-items-center">


					<div class=" col-md-12 m-0 p-0">

						<div class="row col-md-6 col-12 float-start p-3 me-1">
							<div class="form-floating col-md-6">
								<input type="text" class="form-control" id="" maxlength="10"
									<c:if test="${rmListSize >=1  }"> value="${rmList.get(0).material }"</c:if>
									name="material"> <label for="floatingInput">재료명</label>
							</div>
							<div class="form-floating col-md-6">
								<input type="text" class="form-control" id="" maxlength="10"
									<c:if  test="${rmListSize >=1  }"> value="${rmList.get(0).material }"</c:if>
									name="amount"> <label for="floatingInput">재료수량</label>
							</div>
						</div>

						<div class="row col-md-6 col-12 float-start p-3 ms-1">
							<div class="form-floating col-md-6">
								<input type="text" class="form-control" id="" maxlength="10"
									<c:if  test="${rmListSize >=2  }"> value="${rmList.get(1).material }"</c:if>
									name="material"> <label for="floatingInput">재료명</label>
							</div>

							<div class="form-floating col-md-6">
								<input type="text" class="form-control" id="" maxlength="10"
									<c:if  test="${rmListSize >=2  }"> value="${rmList.get(1).amount }"</c:if>
									name="amount"> <label for="floatingInput">재료수량</label>
							</div>
						</div>





						<div class=" col-md-12">

							<div class="row col-md-6 col-12 float-start p-3 me-1">
								<div class="form-floating col-md-6">
									<input type="text" class="form-control" id="" maxlength="10"
										<c:if  test="${rmListSize >=3  }"> value="${rmList.get(2).material }"</c:if>
										name="material"> <label for="floatingInput">재료명</label>
								</div>
								<div class="form-floating col-md-6">
									<input type="text" class="form-control" id="" maxlength="10"
										<c:if  test="${rmListSize >=3  }"> value="${rmList.get(2).amount }"</c:if>
										name="amount"> <label for="floatingInput">재료수량</label>
								</div>
							</div>

							<div class="row col-md-6 col-12 float-start p-3 ms-1">
								<div class="form-floating col-md-6">
									<input type="text" class="form-control" id="" maxlength="10"
										<c:if  test="${rmListSize >=4  }"> value="${rmList.get(3).material }"</c:if>
										name="material"> <label for="floatingInput">재료명</label>
								</div>

								<div class="form-floating col-md-6">
									<input type="text" class="form-control" id="" maxlength="10"
										<c:if  test="${rmListSize >=4  }"> value="${rmList.get(3).amount }"</c:if>
										name="amount"> <label for="floatingInput">재료수량</label>
								</div>
							</div>

							<div class=" col-md-12 border-bottom-1">

								<div class="row col-md-6 col-12 float-start p-3 me-1">
									<div class="form-floating col-md-6">
										<input type="text" class="form-control" id="" maxlength="10"
											<c:if  test="${rmListSize >=5  }"> value="${rmList.get(4).material }"</c:if>
											name="material"> <label for="floatingInput">재료명</label>
									</div>
									<div class="form-floating col-md-6">
										<input type="text" class="form-control" id="" maxlength="10"
											<c:if  test="${rmListSize >=5  }"> value="${rmList.get(4).amount }"</c:if>
											name="amount"> <label for="floatingInput">재료수량</label>
									</div>
								</div>

								<div class="row col-md-6 col-12 float-start p-3 ms-1">
									<div class="form-floating col-md-6">
										<input type="text" class="form-control" id="" maxlength="10"
											<c:if  test="${rmListSize >=6  }"> value="${rmList.get(5).amount }"</c:if>
											name="material"> <label for="floatingInput">재료명</label>
									</div>

									<div class="form-floating col-md-6">
										<input type="text" class="form-control" id="" maxlength="10"
											<c:if  test="${rmListSize >=6  }"> value="${rmList.get(5).amount }"</c:if>
											name="amount"> <label for="floatingInput">재료수량</label>

									</div>

								</div>


							</div>

						</div>




					</div>

				</div>
			</div>


			<div class="recipeDetail container row">
				<!-- 여기서부터 레시피 설명-->
				<!-- 레시피step forEach문시작 -->
						<hr>
				<c:forEach items="${rsList }" var="rStep">
					<div class="REdetailC" id="REdetail">
						<div class="row container p-3 float-start col-md-6 p-2 " id="">

							<div class="form-floating col-md-12 p-0 pt-3">
								<textarea class="form-control" name="recipeDescription"
									placeholder="" id="floatingTextarea2" style="height: 250px">${rStep.recipeDescription }</textarea>
								<label for="floatingTextarea2" class="mt-3">설명을 입력하세요</label>
							</div>

							<!-- 					설명에 쉼표를 넣었을때 배열로 만들지 않기위한 더미 value -->
							<input type="text" name="recipeDescription" value="ab22bb"
								style="display: none">

						</div>

						<!-- 이미지 미리보기 이미지 파일 -->
						<div class="row col-md-6 float-start p-2">
							<div
								class="col-md-5 col-sm-12 container-lg align-items-center m-0">
								<div class="row col-md-4 col-sm-12  align-items-center">
						<!-- 이미지 삭제 아이콘 -->
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-x-circle-fill float-end"
										onclick="PicDel(this, '${rStep.recipePicRename }', ${recipe.recipeNo })">
							<path
											d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z" />
						  </svg>

									<label class="input-file-button float-start"> <img
										class="detailImg mx-auto" width="400px" height="270px"
										<c:if test="${rStep.recipePicRename  ne null }">
									src="/resources/recipeImg/${rStep.recipePicRename }"</c:if>
										style="background-color: gray; border-radius: 10px;"> <input
										type="file" name="recipePicModify" class="isFile"
										style="display: none"
										accept="image/jpeg, image/png, image/jpg"
										onchange="imgView(this);">
									</label>

								</div>

							</div>
						</div>
					</div>
				<input type="text" name="recipePicRename" value="${rStep.recipePicRename}" style="display:none">
				<input type="text" name="recipePic" value="${rStep.recipePic}" style="display:none">
				</c:forEach>
				<!-- 레시피step foreach문 종료 -->
				<!-- 레시피 한블럭 설명종료 -->
				<span id="addplace"></span>

			</div>
			<!-- 레시피 종료 -->


			<!-- 설명추가 -->
			<svg class="m-2" xmlns="http://www.w3.org/2000/svg" width="30"
				height="30" fill="currentColor" class="bi bi-plus-circle-fill"
				viewBox="0 0 16 16" onclick="addDe()">
  <path
					d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z" />
</svg>
			<!--  설명 삭제 -->
			<svg class="m-2" xmlns="http://www.w3.org/2000/svg" width="30"
				height="30" fill="currentColor" class="bi bi-dash-circle-fill"
				viewBox="0 0 16 16" onclick="removeDe()">
  <path
					d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h7a.5.5 0 0 0 0-1h-7z" />
</svg>









			<div class="col-md-12">
				<input type="submit" value="수정" onclick="checkMainPic();">
			</div>
		</div>
	</form>

	</div>



	<script>
		//유튜브 링크 유효성체크//

		var youUrl = /(http:|https:)?(\/\/)?(www\.)?(youtube.com|youtu.be)\/(watch|embed)?(\?v=|\/)?(\S+)?/g;
		function isYoutube() {
			var youtube = document.querySelector('[name="recipeVideo"]');
			if (!youUrl.test(youtube.value)) {
				alert("유튜브 주소는 embed이 포함된 고유주소로 입력해주세요")
				youtube.value = "";

			}

		}

		///설명 추가/삭제////
		var detailForm = document.querySelector('#REdetail');
		var addplace = document.querySelector('#addplace');
		var count = document.querySelectorAll('.REdetailC').length+1;
		var firstCount = document.querySelectorAll('.REdetailC').length+1;
		function addDe() {
			if (count <= 10) {
				count++;
				addplace.appendChild(detailForm.cloneNode(true));
				document.querySelectorAll('.REdetailC')[document
						.querySelectorAll('.REdetailC').length - 1].childNodes[1].childNodes[1].childNodes[1].value = "";
				document.querySelectorAll('.REdetailC')[document
					.querySelectorAll('.REdetailC').length - 1].childNodes[5].childNodes[1].childNodes[1].childNodes[5].childNodes[1].src = "";

			}

		}

		function removeDe() {
			var detailFormClass = document.querySelectorAll('.REdetailC');
			if (count > firstCount) {
				detailFormClass[detailFormClass.length - 1].remove();
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
				alert("대표 이미지를 새로 설정하지 않으면 이미지가 그대로 출력됩니다");

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
				URL.revokeObjectURL(imgid.src); // free memory

			}
			imgCheck()

		};

		function mainPicDel() {
			imgFile[0].value = "";
			output.removeAttribute('src');
		}

		function PicDel(obj,picName,recipeNo) {
			var imgfiles = obj.nextElementSibling.childNodes[1];
			var imgfilesinput = obj.nextElementSibling.childNodes[3];
			if(imgfiles.src == null || imgfiles.src ==''){
				alert("삭제할 이미지가 없습니다")
			}else{
				if(confirm("이미지를 삭제하시겠습니까? 삭제하면 복구할수 없고 현재페이지가 새로고침됩니다")){
					event.preventDefault()
				imgfilesinput.value = "";
				imgfiles.removeAttribute('src');
				location.href = "/recipe/imgRemove.do?picName="+picName+"&recipeNo="+recipeNo
				}
			}

		}
	</script>


</body>
</html>