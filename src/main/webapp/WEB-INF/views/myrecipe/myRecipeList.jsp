<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ar" dir="rtl">
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/swiper.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
<meta name="theme-color" content="#7952b3">


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>


</head>
<body>
	<header>
        <div class="header-container">
           
            <nav class="main-navigation" id="justify-content">
                <a href="#" class="header-search"><img src="/resources/images/header_search.svg"></a>
                <a href="/myRecipe/list" class="header-cart"><img src="/resources/images/header_cart.svg"></a>
                
                <c:if test="${sessionScope.loginUser eq null  }">
                <a href="/member/joinView.kh" class="header-mypage"><img src="/resources/images/header_mypage.svg"></a>
                </c:if>
                
                <c:if test="${not empty loginUser }">
                <a href="/member/myPageView.kh" class="header-mypage"><img src="/resources/images/header_mypage.svg"></a>
                </c:if>
        
                 <h1 style="margin-right:970px;"><a href="#"><img onclick="location.href='/'" src="https://statics.goorm.io/logo/edu/goorm_edu.svg" alt="goorm edu" ></a></h1>
            </nav>
        </div>
    </header>
<nav class="board-navigation">
        <div class="board-container">
            <ul> 
                <li><a href="#">음료/술</a></li>
                <li><a href="#">간식</a></li>
                <li><a href="#">술안주</a></li>
                <li><a href="#">식사</a></li>
            </ul>
        </div>
    </nav>
	<main>
<!-- 		<section class="py-5 text-center container"> -->
<!-- 			<div class="row py-lg-5"> -->
<!-- 				<div class="col-lg-6 col-md-8 mx-auto"> -->
<!-- 					<h1 class="fw-light">장바구니</h1> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</section> -->
		
		<h3 align="center" style="margin-top:30px;">마이레시피</h3>
		<div class="album py-5 bg-light">
			<div class="container" id="justify-content" style="background-color:papayawhip;" >
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-4 justify-content-end">
					<c:if test="${!empty mList }">
						<c:forEach items="${mList }" var="myRecipe" varStatus="i">
							
							<div class="col">
								<div class="card shadow-sm"  style="margin-bottom:50px;">
									<div style="display:none;">${myRecipe.recipeNo }</div>
<!-- 									<svg class="bd-placeholder-img card-img-top" width="100%" -->
<!-- 										height="225" role="img" preserveAspectRatio="xMidYMid slice" -->
<!-- 										focusable="false"> -->
									<img alt="본문이미지" src="/resources/recipeImg/${myRecipe.mainPicRename }" class="bd-placeholder-img card-img-top" width="100%" height="225" role="img" preserveAspectRatio="xMidYMid slice">				
<!--             						</svg> -->
									<div class="card-body">
										<p class="card-text"></p>
										<div class="d-flex justify-content-between align-items-center">
											<div class="btn-group">
												<button type="button"
													class="btn btn-sm btn-outline-secondary"><a href="/myRecipe/remove?recipeNo=${myRecipe.recipeNo }">삭제</a></button>
											</div>
											
											<a href="/recipe/detail.do">
											<small class="text-muted">${myRecipe.recipeName }</small>
											</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
	</main>
	 <footer class="footer">
        <div class="footer_inner">
            <div class="footer_content_first">
                <div class="footer_content left">
                    <p class="title">고객센터</p>
                    <p class="tel">02-123-4567</p>
                    <p class="work_time">오전 10시 ~ 오후 5시 (주말, 공휴일 제외)</p>
                    <div>
                        <button>
                            1:1 문의하기
                        </button>
                        <button>
                          	  공지사항
                        </button>
                    </div>
                </div>
                
                <div class="footer_content right">
                    <p class="title">(주)편스토랑</p>
                    <div class="content_link">
                        <ul>
                            <li><a href="#">개인정보처리방침</a></li>
                            <li class="hr">&nbsp;</li>
                            <li><a href="#">이용약관</a></li>
                            <li class="hr">&nbsp;</li>
                            <li><a href="/notice/list">공지사항</a></li>
                            <li class="hr">&nbsp;</li>
                            <li><a href="#">Q &amp;A</a></li>
                        </ul>
                    </div>

                    <p class="footer_content_sub_txt">
                        법인명 : (주)편스토랑  |  사업자등록번호 : 000-00-00000  | 벤처기업 : 제 20220923103호
                        <br>특허 제 00-000000호  |  통신판매업신고 : 2022-서울종로구-0000  |   개인정보보호책임자 : 송신애
                        <br>주소 : 서울 종로구 어딘가 159, KH 정보교육원 3층 |  대표이사 :  공석
                        <br>제휴/협력 문의 : asdf@asdf.com  | 
                    </p>
                </div>
                </div>
        </div>
    </footer>
   
	<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <script src="/resources/js/swiper.js"></script>

</body>
</html>
