<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/swiper.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
</head>
<body>
 <header>
        <div class="header-container">
            <h1><a href="#"><img onclick="location.href='/'" src="https://statics.goorm.io/logo/edu/goorm_edu.svg" alt="goorm edu" ></a></h1>
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
        <nav class="navbar navbar-default">

		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">


		</div>
	</nav>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글보기</th>						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글제목</td>
						<td colspan="2">${notice.noticeTitle }</td>
					</tr>
					<tr>
						<td>작성 날짜</td>
						<td colspan="2">${notice.noticeDate }</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2">${notice.noticeContent }</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><img alt="본문이미지" src="/resources/buploadFiles/${notice.noticeFileRename }" 
                            width="300" height="300"></td>
					</tr>
                    <tr>
                        <td colspan="2" align="center">
                            <a href="/notice/modifyView?noticeNo=${notice.noticeNo }&page=${page}" class="btn btn-primary pull-center">수정 페이지로 이동</a>
                            <a href="#" onclick="noticeRemove(${page});" class="btn btn-primary pull-center">삭제하기</a>
                        </td>
                    </tr>
				</tbody>
			</table>
			<a href="/notice/list" class="btn btn-primary pull-right">목록</a>	
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
   
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>

    <script>
        function noticeRemove(value) {
            event.preventDefault(); // 하이퍼링크 이동 방지
            if(confirm("게시물을 삭제하시겠습니까?")) {
                location.href="/notice/remove?page="+value;
                alert("삭제되었습니다.");
            }
        }
        </script>
         <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <script src="/resources/js/swiper.js"></script>
</body>
</html>