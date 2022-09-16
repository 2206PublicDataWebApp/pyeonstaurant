<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>

    <title>레시피 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

  </head>


<body>

<form action="/recipe/regist.do" method="post">
<div class="row row-cols-lg-auto container align-items-center">

  <div class="form-floating col-lg-4">
    <input type="text" class="form-control" id="" name="recipeName" >
    <label for="floatingInput">레시피 제목</label>
  </div>
  <br>
  <div class="form-floating col-lg-4">
    <input type="text" class="form-control" id="" name="recipeVideo">
    <label for="floatingInput">유튜브 링크</label>
  </div>

  <div class="col-md-3">
    <label for="validationCustom04" class="form-label" >카테고리</label>
    <select class="form-select" id="" name="recipeCategory" required>
      <option selected disabled value="">카테고리 선택</option>
      <option value="mael">식사</option>
      <option value="relish">술안주</option>
      <option value="dessert">간식</option>
      <option value="drink">술/음료</option>
    </select>
    <div class="invalid-feedback">
     카테고리를 선택하세요
    </div>
    <br>
    <div class="col-md-8 col-lg-8">
      해시태그<br>
    <label><input class="form-check-input" type="checkbox" name="jmt" 		value="true" > JMT</label>
    <label><input class="form-check-input" type="checkbox" name="healthy" 	value="true">  건강한</label>
    <label><input class="form-check-input" type="checkbox" name="goodSpicy" value="true"> 맛있게 매운</label>
    <label><input class="form-check-input" type="checkbox" name="soSpicy" 	value="true"> 아주매운</label>
    <label><input class="form-check-input" type="checkbox" name="sweet" 	value="true">  달콤한</label>
    <label><input class="form-check-input" type="checkbox" name="easy" 		value="true"> 간편한</label>
    <label><input class="form-check-input" type="checkbox" name="party" 	value="true"> 파티용</label>
    <label><input class="form-check-input" type="checkbox" name="full" 		value="true"> 든든한</label>
    </div>

  </div>
  <br>
  <div class="form-floating col-lg-2 align-items-center">
    <input type="text" class="form-control" id="" name="recipeTime">
    <label for="floatingInput">소요시간</label>
  </div>

  <div class="row col-lg-4">
    <label class="input-file-button" for="input-file" >
    	대표이미지추가
      <img id="output">
  
    </label>
    <input type="file" id="input-file" style="display:none"accept="image/*" name="mainPicture" onchange="loadFile(event)"/> 
  </div>

  <div class=" row row-cols-lg-auto col-lg-8">
    <div class="form-floating col-lg-8">
      <input type="text" class="form-control" id="" maxlength="30" name="recipeInfo">
      <label for="floatingInput"> 간단한소개 (30자 미만)</label>
    </div>
  </div>



  
  <div class="row row-cols-lg-auto col-lg-12">
    <div class="form-floating col-lg-3">
      <input type="text" class="form-control" id="" maxlength="10" name="material">
      <label for="floatingInput">재료명</label>
    </div>
      <div class="form-floating col-lg-3">
      <input type="text" class="form-control" id="" maxlength="10" name="amount">
      <label for="floatingInput">재료수량</label>
    </div>
    
    <div class="form-floating col-lg-3">
      <input type="text" class="form-control" id="" maxlength="10" name="material">
      <label for="floatingInput">재료명</label>
    </div>

    <div class="form-floating col-lg-3">
      <input type="text" class="form-control" id="" maxlength="10" name="amount">
      <label for="floatingInput">재료수량</label>
    </div>
  </div>

  <div class="row row-cols-lg-auto col-lg-12 ">
    <div class="form-floating col-lg-3">
      <input type="text" class="form-control" id="" maxlength="10" name="material">
      <label for="floatingInput">재료명</label>
    </div>

    <div class="form-floating col-lg-3">
      <input type="text" class="form-control" id="" maxlength="10" name="amount">
      <label for="floatingInput">재료수량</label>
    </div>

    <div class="form-floating col-lg-3">
      <input type="text" class="form-control" id="" maxlength="10" name="material">
      <label for="floatingInput">재료명</label>
    </div>

    <div class="form-floating col-lg-3">
      <input type="text" class="form-control" id="" maxlength="10" name="amount">
      <label for="floatingInput">재료수량</label>
    </div>
  </div>

  <div class="row row-cols-lg-auto col-lg-12 ">
    <div class="form-floating col-lg-3">
      <input type="text" class="form-control" id="" maxlength="10" name="material">
      <label for="floatingInput">재료명</label>
    </div>

    <div class="form-floating col-lg-3">
      <input type="text" class="form-control" id="" maxlength="10" name="amount">
      <label for="floatingInput">재료수량</label>
    </div>

    <div class="form-floating col-lg-3">
      <input type="text" class="form-control" id="" maxlength="10" name="material">
      <label for="floatingInput">재료명</label>
    </div>

    <div class="form-floating col-lg-3">
      <input type="text" class="form-control" id="" maxlength="10" name="amount">
      <label for="floatingInput">재료수량</label>
    </div>
  </div>





</div>

<hr>

<div class="row container">
  <div class="form-floating col-lg-6">
    <input type="text" class="form-control" id="" maxlength="10" name="recipeDescription">
    <label for="floatingInput">레시피 설명</label>
  </div>
  <div class="row col-lg-6">
    <input type="file"  name="recipePicture1">
  </div>
  <div class="form-floating col-lg-6">
    <input type="text" class="form-control" id="" maxlength="10" name="recipeDescription">
    <label for="floatingInput">레시피 설명</label>
  </div>
  <div class="row col-lg-6">
    <input type="file"  name="recipePicture2">
  </div>
  <div class="form-floating col-lg-6">
    <input type="text" class="form-control" id="" maxlength="10" name="recipeDescription">
    <label for="floatingInput">레시피 설명</label>
  </div>
  <div class="row col-lg-6">
    <input type="file"  name="recipePicture3">
  </div>

<input type="submit" value ="등록">
</div>

</form>

 
 
 

    
 
 </p>
<script>
  var loadFile = function(event) {
    var output = document.getElementById('output');
    output.src = URL.createObjectURL(event.target.files[0]);
    output.onload = function() {
      URL.revokeObjectURL(output.src) // free memory
    }
  };
</script>


</body>
</html>