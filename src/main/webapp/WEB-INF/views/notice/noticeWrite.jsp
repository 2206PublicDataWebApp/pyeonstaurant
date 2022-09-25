<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <style>
        #list {
            margin-left: 7px;
        }
    </style>
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
    	<div class="container">
        <div class="row">
            <form method="post" action="/notice/regist" enctype="multipart/form-data">
                <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                <thead>
                    <tr>
                        <th colspan="2" style="background-color: #eeeeee; text-align: center;">공지사항 등록</th>						
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="text" class="form-control"  placeholder="공지사항 제목" name="noticeTitle" id="title"></td>
                        
                    </tr>
                    <tr>				
                        <td><textarea class="form-control" placeholder="공지사항 내용" name="noticeContent" style="height: 350px" id="content"></textarea></td>
                    </tr>
                    <tr>
                        <td><input type="file" name="uploadFile" class="isFile" onChange="imgCheck();">
                        </td>
                    </tr>
                    <!-- <tr>
                        <td colspan="2" align="center" >
                            <a href="/notice/list">목록으로</a>
                        </td>
                    </tr> -->
                </tbody>
            </table>
            <a href="/notice/list" class="btn btn-primary pull-right" id="list" >목록으로</a>
            <input type="submit" class="btn btn-primary pull-right" value="등록" onClick="sbm();">
            </form>						
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
    
    <script>
	var imgFile = document.querySelectorAll('.isFile');
	var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/i;
	var fileSize;
	
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

    
    function sbm(){
		var title = document.getElementById("title");
		var content = document.getElementById("content");
		if(title.value == "") {
			alert("제목을 1자 이상 입력해주세요.");
			title.focus();
			event.preventDefault();
			return false;
		}
		
		if(content.value == "") {
			alert("내용을 1자 이상 입력해주세요.");
			content.focus();
			event.preventDefault();
			return false;
		}
	}	
    </script>
</body>
</html>