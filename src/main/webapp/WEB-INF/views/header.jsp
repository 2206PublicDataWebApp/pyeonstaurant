<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>편스토랑</title>
    <link rel="stylesheet" href="/resources/css/style.css">

</head>
<body>
     <header>
        <div class="header-container">
            <h1><a href="#"><img onclick="location.href='/'" src="/resources/images/logo.png"></a></h1>
            <nav class="main-navigation">

                <a href="#"><i class="fa-solid fa-magnifying-glass icon" style="font-size:13px"></i></a>
                <a href="/myRecipe/list"><i class="fa-solid fa-star icon"></i></a>


              <c:if test="${sessionScope.loginUser eq null}">
                <a href="/member/joinView.kh"><i class="fa-regular fa-user icon"></i></a>
                </c:if>
                
                <c:if test="${not empty loginUser}">
                <a href="/member/myPageView.kh"><i class="fa-solid fa-user icon"></i></a>
                </c:if>
                <c:if test="${loginUser.adminCheck == true }">
                관리자
                </c:if>

              
            </nav>
        </div>
    </header>

    <nav class="board-navigation">
        <div class="board-container">
            <ul>


                <li><a href="/search/mainSearch.kh?mainCondition=mael&listCondition=${listCondition}"
 class="board-menu">식사</a></li>
                <li><a href="/search/mainSearch.kh?mainCondition=relish&listCondition=${listCondition}"
class="board-menu">술안주</a></li>
                <li><a href="/search/mainSearch.kh?mainCondition=dessert&listCondition=${listCondition}"
class="board-menu">간식</a></li>
                <li><a href="/search/mainSearch.kh?mainCondition=drink&listCondition=${listCondition}"
 class="board-menu">음료/술</a></li>


            </ul>
        </div>
    </nav>
</body>
</html>