<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
    <link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
    <header>
        <div class="header-container">
            <h1><a href="#"><img onclick="location.href='/home.kh' src="https://statics.goorm.io/logo/edu/goorm_edu.svg" alt="goorm edu" ></a></h1>
            <nav class="main-navigation">
                <a href="#" class="header-search"><img src="/resources/images/header_search.svg"></a>
                <a href="#" class="header-cart"><img src="/resources/images/header_cart.svg"></a>
                
                <c:if test="${sessionScope.loginUser eq null  }">
                <a href="/member/joinView.kh" class="header-mypage"><img src="/resources/images/header_mypage.svg"></a>
                </c:if>
                
                <c:if test="${not empty loginUser }">
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
    	<h2>회원가입</h2>
    	<p>회원가입이 완료되었습니다.</p>
    	<p>편스토랑과 함께 즐거운 요리 되세요.</p>
    	<button onclick="location.href='/login.kh'">로그인</button>
    	<button onclick="location.href='/home.kh'">메인으로 이동</button>
    </main>
    
</body>
</html>