<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<head>

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
		body{
			margin: 0 auto;
		}


	</style>

</head>


<body>

	<form action="/recipe/regist.do" method="post"
		enctype="multipart/form-data">
<div class="container align-items-center">
		<div class="container row align-items-center p-0" >
		
		
		<!-- 여기는 대표 이미지 박스 -->
		     <div class="col-lg-5 container align-items-center ">
               
				<div class="row col-lg-4 m-2" >

					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle-fill float-end" onclick="mainPicDel()">
						<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
					  </svg>
                    <label class="input-file-button float-start" for="input-file">
						<img id="output" class="mx-auto " width="400px" height="270px" style="background-color: gray; border-radius: 10px;">  
					</label> 
					

					<input type="file" id="input-file" style="display: none"
                    accept="image/jpeg, image/png, image/jpg" name="mainPicture"
                    class="isFile" onchange="loadFile(event)" required="required" />
					

                </div>
		
            </div>
		

            <div class="col-lg-7 container" >

                <div class="form-floating">
                    <input type="text" class="form-control" id="" name="recipeName">
                    <label for="floatingInput">레시피 제목</label>
                </div>
                <br>
                <div class="form-floating">
                    <input type="text" class="form-control" id="" name="recipeVideo">
                    <label for="floatingInput">유튜브 링크</label>
                </div>
    
                <div class="mt-5">
                    <label for="validationCustom04" class="form-label"><h5>카테고리</h5></label> <select
                        class="form-select" id="" name="recipeCategory" required>
                        <option selected disabled value="">카테고리 선택</option>
                        <option value="mael">식사</option>
                        <option value="relish">술안주</option>
                        <option value="dessert">간식</option>
                        <option value="drink">술/음료</option>
                    </select>
                    <div class="invalid-feedback">카테고리를 선택하세요</div>
                    <br>
                    
                    <div class="form-floating align-items-center">
                    <input type="text" class="form-control mb-2" id="" name="recipeTime">
                    <label for="floatingInput">소요시간</label>
                </div>
    
                    
                    <div class="col-lg-12 ">
                        <h5>해시태그</h5> 
						<div class="overflow-hidden">
							<label class="w-25 float-start"><input class="form-check-input" type="checkbox" name="jmt" value="true"> JMT</label>
							<label class="w-25 float-start"><input class="form-check-input" type="checkbox" name="healthy" value="true"> 건강한</label> 
							<label class="w-25 float-start"><input class="form-check-input" type="checkbox" name="goodSpicy" value="true"> 맛있게 매운</label> 
							<label class="w-25 float-start"><input class="form-check-input" type="checkbox" name="soSpicy" value="true"> 아주매운</label> 
							<label class="w-25 float-start"><input class="form-check-input" type="checkbox" name="sweet" value="true">   달콤한</label>
							<label class="w-25 float-start"><input class="form-check-input" type="checkbox" name="easy" value="true"> 간편한</label>
							<label class="w-25 float-start"><input class="form-check-input" type="checkbox" name="full" value="true"> 든든한</label>
							<label class="w-25 float-start"><input class="form-check-input" type="checkbox" name="party" value="true">   파티용</label> 
						</div>
                    </div>
    
                </div>

            </div>
            
       

			
			<br>
			
			<div class=" row m-0 mt-3 mb-3  p-0">
				<div class="form-floating">
					<input type="text" class="form-control" id="" maxlength="30"
						name="recipeInfo" required="required"> <label
						for="floatingInput"> 간단한소개 (30자 미만)</label>
				</div>
			</div>




			<div class="row row-cols-lg-auto col-lg-12">
				<div class="form-floating col-lg-3">
					<input type="text" class="form-control" id="" maxlength="10"
						name="material"> <label for="floatingInput">재료명</label>
				</div>
				<div class="form-floating col-lg-3">
					<input type="text" class="form-control" id="" maxlength="10"
						name="amount"> <label for="floatingInput">재료수량</label>
				</div>

				<div class="form-floating col-lg-3">
					<input type="text" class="form-control" id="" maxlength="10"
						name="material"> <label for="floatingInput">재료명</label>
				</div>

				<div class="form-floating col-lg-3">
					<input type="text" class="form-control" id="" maxlength="10"
						name="amount"> <label for="floatingInput">재료수량</label>
				</div>
			</div>

			<div class="row row-cols-lg-auto col-lg-12 ">
				<div class="form-floating col-lg-3">
					<input type="text" class="form-control" id="" maxlength="10"
						name="material"> <label for="floatingInput">재료명</label>
				</div>

				<div class="form-floating col-lg-3">
					<input type="text" class="form-control" id="" maxlength="10"
						name="amount"> <label for="floatingInput">재료수량</label>
				</div>

				<div class="form-floating col-lg-3">
					<input type="text" class="form-control" id="" maxlength="10"
						name="material"> <label for="floatingInput">재료명</label>
				</div>

				<div class="form-floating col-lg-3">
					<input type="text" class="form-control" id="" maxlength="10"
						name="amount"> <label for="floatingInput">재료수량</label>
				</div>
			</div>

			<div class="row row-cols-lg-auto col-lg-12 ">
				<div class="form-floating col-lg-3">
					<input type="text" class="form-control" id="" maxlength="10"
						name="material"> <label for="floatingInput">재료명</label>
				</div>

				<div class="form-floating col-lg-3">
					<input type="text" class="form-control" id="" maxlength="10"
						name="amount"> <label for="floatingInput">재료수량</label>
				</div>

				<div class="form-floating col-lg-3">
					<input type="text" class="form-control" id="" maxlength="10"
						name="material"> <label for="floatingInput">재료명</label>
				</div>

				<div class="form-floating col-lg-3">
					<input type="text" class="form-control" id="" maxlength="10"
						name="amount"> <label for="floatingInput">재료수량</label>
				</div>
			</div>





		</div>

		<hr>

		<div class="row container">
			<div class="form-floating col-lg-6">
				<input type="text" class="form-control" id="" maxlength="10"
					name="recipeDescription" required="required"> <label
					for="floatingInput">레시피 설명</label>
<!-- 					설명에 쉼표를 넣었을때 배열로 만들지 않기위한 더미 value -->
					<input type="text" name="recipeDescription" value="ab22bb" style="display:none">
					
			</div>
			<div class="row col-lg-6">
				<input type="file" name="recipePicture" class="isFile"
					accept="image/jpeg, image/png, image/jpg" onchange="imgCheck();">
			</div>
			<div class="form-floating col-lg-6">
				<input type="text" class="form-control" id="" maxlength="10"
					name="recipeDescription"> <label for="floatingInput">레시피
					설명</label>
					<!-- 					설명에 쉼표를 넣었을때 배열로 만들지 않기위한 더미 value -->
					<input type="text" name="recipeDescription" value="ab22bb" style="display:none">
					
			</div>
			<div class="row col-lg-6">
				<input type="file" name="recipePicture" class="isFile"
					accept="image/jpeg, image/png, image/jpg" onchange="imgCheck();">
			</div>
			<div class="form-floating col-lg-6">
				<input type="text" class="form-control" id="" maxlength="10"
					name="recipeDescription"> <label for="floatingInput">레시피
					설명</label>
					<!-- 					설명에 쉼표를 넣었을때 배열로 만들지 않기위한 더미 value -->
					<input type="text" name="recipeDescription" value="ab22bb" style="display:none">
					
			</div>
			<div class="row col-lg-6">
				<input type="file" name="recipePicture" class="isFile"
					accept="image/jpeg, image/png, image/jpg" onchange="imgCheck();">
			</div>

			<input type="submit" value="등록" onclick="checkMainPic();">
		</div>

	</form>

</div>


	
	<script>
	
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


		function mainPicDel(){
			imgFile[0].value = "";
			output.removeAttribute('src');
		}
	</script>


</body>
</html>