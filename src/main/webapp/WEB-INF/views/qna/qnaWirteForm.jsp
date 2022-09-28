<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Q&A등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

 <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>


<style>
body{
margin-top:10rem;
}


@media (max-width: 500px) {
.container{
padding:0 !important;
padding-left:1em !important;
}
form{
padding:0 !important;
}

}


section{
margin-top:10px;
}

label:hover{
cursor:pointer;
}

</style>
</head>

<body>
<jsp:include page="../header.jsp"/>


	<section class="container">
			<!-- 게시판 영역시작 -->
		<div class="row container" >
			<form action="/qna/Regist.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="memberEmail" value="${loginUser.memberEmail }">
			<!-- 상단영역시작 -->
			<div id="first">
				<!-- 카테고리영역 -->
				<div id="category-area" class="col-md-4 row" style="text-align:center">
					<div class="col-md-3 d-flex align-items-center">
					카테고리
					</div>
					<div class="col-md-9">
						<select class="form-select" id="floatingSelect"
							aria-label="Floating label select" name="qaCategory" required="required">
							<option value="Qsystem">시스템 문의</option>
							<option value="Qrecipe">레시피 문의</option>
							<option value="Qother">기타 문의</option>
						</select>
					</div>

				</div>
				<!-- 카테고리 영역 종료 -->
				<!-- 타이틀영역 -->
				<div id="title-area" class="row" >
					
					<div id="title" class="col-md-10 pt-3">
						<div class="form-floating mb-3">
	  					<input type="text" name="qaTitle" class="form-control" id="floatingInput" required="required">
	  					<label for="floatingInput">제목</label>
						</div> 
					</div>
					
					<div id="secret" class="col-md-2 d-flex align-items-center" style="height:auto ;" >
					
						<div class="form-check ">
						  <input class="form-check-input" type="checkbox" value="true" id="flexCheckDefault" style="width:1.5rem; height:1.5rem" name="qaSecret" >
						  <label class="form-check-label mt-1 ms-1"  for="flexCheckDefault">
						    비밀글
					 	 </label>
					  </div>
					
					</div>
				
				
				
				</div>
				<!-- 타이틀영역종료 -->
				
				<!-- 내용영역 -->
				<div id="contents-area " class="mb-2">
				
				 <div id="summernote"></div>
				 <textarea rows="" cols="" style="display:none" name="qaContents" required="required"></textarea>

				
				</div>
				<!-- 내용영역종료 -->
			</div>
			<!-- 상단영역종료 -->


			<!-- 중간영역 시작 -->
			<div id="second">
				<!-- 첨부파일 1영역 -->
				<div id="file1" class="row my-1" >

					<div id="file-name-area" class="col-1 d-md-inline d-none"> 첨부파일 1</div>
					<div id="file-bitton-aera" class="col-11">
					<input type="text" id="text-box" readonly style="width:90%" placeholder="파일을 등록하세요"> <label for="input-file" >
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="skyblue" class="bi bi-file-earmark-fill" viewBox="0 0 16 16">
					<path d="M4 0h5.293A1 1 0 0 1 10 .293L13.707 4a1 1 0 0 1 .293.707V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2zm5.5 1.5v2a1 1 0 0 0 1 1h2l-3-3z"/>
					</svg>
					
					파일등록 </label>
					<input type="file" accept="image/jpeg, image/png, image/jpg" class="isFile" id="input-file" style="display:none" name="upFile" onchange="filename(this)" onclick="imgCheck();">
					</div>
					


				</div>
				<!-- 첨부파일1영역종료 -->
				<!-- 첨부파일 2영역 -->
				<div id="file2" class="row my-1">

					<div id="file-name-area" class="col-1 d-none d-md-inline "> 첨부파일 2</div>
					<div id="file-bitton-aera" class="col-11">
					
					
					<input type="text" id="text-box" readonly style="width:90%" placeholder="파일을 등록하세요"> <label for="input-file2" >
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="skyblue" class="bi bi-file-earmark-fill" viewBox="0 0 16 16">
						<path d="M4 0h5.293A1 1 0 0 1 10 .293L13.707 4a1 1 0 0 1 .293.707V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2zm5.5 1.5v2a1 1 0 0 0 1 1h2l-3-3z"/>
						</svg>
					파일등록 </label>
					<input type="file" accept="image/jpeg, image/png, image/jpg"  class="isFile" id="input-file2" style="display:none" name="upFile" onchange="filename(this)">
					</div>
					
				</div>
				<!-- 첨부파일2영역종료 -->
				<!-- 첨부파일 3영역 -->
				<div id="file3" class="row my-1">
				
					<div id="file-name-area" class="col-1 d-none d-md-inline " > 첨부파일 3</div>
					<div id="file-bitton-aera" class="col-11">
					<input type="text" id="text-box" readonly style="width:90%" placeholder="파일을 등록하세요"> <label for="input-file3" >
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="skyblue" class="bi bi-file-earmark-fill" viewBox="0 0 16 16">
						<path d="M4 0h5.293A1 1 0 0 1 10 .293L13.707 4a1 1 0 0 1 .293.707V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2zm5.5 1.5v2a1 1 0 0 0 1 1h2l-3-3z"/>
						</svg>
					파일등록 </label>
					<input type="file" accept="image/jpeg, image/png, image/jpg" class="isFile" id="input-file3" style="display:none" name="upFile" onchange="filename(this)">
					</div>

				</div>
				<!-- 첨부파일3영역종료 -->
				<!-- 첨부파일 4영역 -->
				<div id="file4" class="row my-1">
				
					<div id="file-name-area" class="col-1 d-none d-md-inline " > 첨부파일 4</div>
					<div id="file-bitton-aera" class="col-11">
					<input type="text" id="text-box" readonly style="width:90%" placeholder="파일을 등록하세요"> <label for="input-file4" >
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="skyblue" class="bi bi-file-earmark-fill" viewBox="0 0 16 16">
						<path d="M4 0h5.293A1 1 0 0 1 10 .293L13.707 4a1 1 0 0 1 .293.707V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2zm5.5 1.5v2a1 1 0 0 0 1 1h2l-3-3z"/>
						</svg>
					파일등록 </label>
					<input type="file" accept="image/jpeg, image/png, image/jpg" class="isFile" id="input-file4" style="display:none" name="upFile"  onchange="filename(this)">
					</div>

				</div>
				<!-- 첨부파일4영역종료 -->
				<!-- 첨부파일 5영역 -->
				<div id="file5" class="row my-1">
				
					<div id="file-name-area" class="col-1 d-none d-md-inline "> 첨부파일 5</div>
					<div id="file-bitton-aera" class="col-11">
					<input type="text" id="text-box" readonly style="width:90%" placeholder="파일을 등록하세요"> <label for="input-file5" >
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="skyblue" class="bi bi-file-earmark-fill" viewBox="0 0 16 16">
						<path d="M4 0h5.293A1 1 0 0 1 10 .293L13.707 4a1 1 0 0 1 .293.707V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2zm5.5 1.5v2a1 1 0 0 0 1 1h2l-3-3z"/>
						</svg>
					파일등록 </label>
					<input type="file" accept="image/jpeg, image/png, image/jpg" class="isFile" id="input-file5" style="display:none" name="upFile"  onchange="filename(this)">
					</div>

				</div>
				<!-- 첨부파일5영역종료 -->

			</div>
			<!-- 중간영역종료 -->


			<!-- 하단영역시작 -->
			<div id="thrid" class="row my-2">
				<div id="submit-area" class="col-md-6" style="text-align:center ">
				<input type="submit" class="btn btn-outline-primary"  value="등록" style="width: 50%">
				</div>
				<div id="cancle-area" class="col-md-6" style="text-align:center ">
				<button type="button" class="btn btn-outline-primary" style="width: 50%" onclick="javascript:history.back();">취소</button>
				</div>
			</div>
			<!-- 하단영역종료 -->


		</form>
		</div>
		<!-- 게시판 영역 종료 -->



	</section>
	
	<jsp:include page="../footer.jsp"/>
<script>

//섬머노트 스크립트




  $('#summernote').summernote({
    placeholder: '질문을 입력하세요',
    tabsize: 2,
    height: 500,
    toolbar: [
      ['style', ['style']],
      ['font', ['bold', 'underline', 'clear']],
      ['color', ['color']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['table', ['table']],
      ['insert', ['link']],
      ['view', ['fullscreen', 'codeview', 'help']]
    ]
  });
  
 
//파일이름 출력용
	function filename(obj) {
		var name = obj.files[0].name
		var text = obj.previousElementSibling.previousElementSibling
		text.value=name;
		
		imgCheck(obj);
		
		
	}
	

	
document.querySelector('.note-editable').onblur = function(){
var textarea = document.querySelector('[ name="qaContents"]');
var textvalue = document.querySelector('.note-editable');
	textarea.value = textvalue .innerHTML;
	}
	
	
///// 이미지파일 체크 시작 ////
var imgFile = document.querySelectorAll('.isFile');
var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/i;

function imgCheck(obj) {
	for (var i = 0; i < imgFile.length; i++) {
		if (imgFile[i].value != "") {

			if (!imgFile[i].value.match(fileForm)) {
				alert("이미지 파일만 업로드 가능");
				imgFile[i].value = "";
				var text = obj.previousElementSibling.previousElementSibling
				text.value="";
				

			}
		}
	}

};

/////이미지 확장자 체크 종료///
	

</script>




</body>
</html>