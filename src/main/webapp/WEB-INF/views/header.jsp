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

                <a href="#"><img src="/resources/images/search-1.svg" class="head-icon"></a>
                
                
                               
                <c:if test="${sessionScope.loginUser != null }">
                <a href="/myRecipe/list"><img src="/resources/images/star-fill.svg" class="head-icon"></a>
                </c:if>
     

              <c:if test="${sessionScope.loginUser eq null}">
                <a href="/member/joinView.kh"><img src="/resources/images/person.svg" class="head-icon"></a>
                </c:if>
                
                
                
                <c:if test="${not empty sessionScope.loginUser}">
                <a href="/member/myPage.kh"><img src="/resources/images/person-fill.svg" class="head-icon"></a>
                </c:if>
                
                <c:if test="${loginUser.adminCheck == true }">
                <a href="/admin/memberAdminList">관리자</a>
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