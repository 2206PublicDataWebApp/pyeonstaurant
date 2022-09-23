
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="/resources/css/error.css">
</head>
<body>
  <div class="wrapper">
    <div class="text_group">
      <p class="text_404">404</p>
      <p class="text_lost">The page you are looking for <br />has been lost in space.</p>
    </div>
    <div class="window_group">
      <div class="window_404">
        <div class="stars"></div>
      </div>
    </div>
  </div>
	
	<script>
	let starContainer = document.querySelector(".stars");

	for (let i = 0; i < 100; i++) {
	  starContainer.innerHTML += `<div class="star"></div>`;
	}
	</script>
</body>
</html>