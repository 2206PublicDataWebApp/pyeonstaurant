<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>편스토랑 로그인, 회원가입 페이지</title>
    <link rel="shortcut icon" href="/resources/images/favicon.ico" type="image/x-icon">
	<link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/join.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="/resources/js/join.js"></script>
</head>
<body>
    <header>
        <div class="header-container">
            <h1><a href="#"><img onclick="location.href='/'" src="/resources/images/logo.png"></a></h1>
            <nav class="main-navigation">
                <a href="#"><i class="fa-solid fa-magnifying-glass icon"></i></a>
                <a href="/myRecipe/list"><i class="fa-solid fa-star icon"></i></a>
                <a href="/member/joinView.kh"><i class="fa-regular fa-user icon"></i></a>
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

    <main>
        <div class="container">
            <input type="checkbox" id="flip">
            <div class="cover">
              <div class="front">
                <img src="/resources/images/login_front.jpg" alt="">
                <div class="text">
                  <span class="text-1">편스토랑에서 <br> 새로운 레시피를 만나보세요!</span>
                  <span class="text-2">다양한 레시피</span>
                </div>
              </div>
              <div class="back">
                <img class="backImg" src="/resources/images/login_back2.jpg" alt="">
                <div class="text">
                  <span class="text-1">편스토랑에 오신것을<br>환영합니다</span>
                  <span class="text-2">회원가입 하기</span>
                </div>
              </div>
            </div>
            <div class="forms">
                <div class="form-content">
                  <div class="login-form">
                    <div class="title">로그인</div>
                  <form action="/member/login.kh" method="post">
                    <div class="input-boxes">
                      <div class="input-box">
                        <i class="fas fa-envelope"></i>
                        <input type="text" name="memberEmail" placeholder="이메일을 입력해주세요" required>
                      </div>
                      <div class="input-box">
                        <i class="fas fa-lock"></i>
                        <input type="password" name="memberPwd" placeholder="비밀번호를 입력해주세요" required>
                      </div>
                      <div class="button input-box">
                        <input type="submit" value="Sumbit">
                      </div>
                      <div class="text sign-up-text">아이디가 없으신가요? <label for="flip">회원가입</label></div>
                    </div>
                </form>
              </div>
                <div class="signup-form">
                  <div class="title">회원가입</div>
               <form action="/member/register.kh" method="post">
                    <div class="input-boxes">
                      <div class="input-box">
                        <i class="fas fa-envelope"></i>
                        <input type="text" name="memberEmail" id="email" placeholder="이메일을 입력하세요" required>
                        <button type="button" id="email_auth_btn" class="email_auth_btn">인증번호 받기</button>
                      </div>
                      
                      <div class="input-box">
                        <i class="fas fa-envelope"></i>
                        <input type="text" id="email_auth_key" placeholder="인증번호" required>
                      </div>                      
                      
                      <div class="input-box">
                        <i class="fas fa-lock"></i>
                        <input type="password"  id="password" name="memberPwd" placeholder="비밀번호를 입력하세요" required>
                      </div>
                      <div class="input-box">
                        <i class="fas fa-lock"></i>
                        <input type="password"  id="password_check" placeholder="비밀번호를 확인해주세요" required>
                      </div>
                      <div class="input-box">
                        <i class="fas fa-user"></i>
                        <input type="text" name="memberNickname" placeholder="닉네임을 입력해주세요" required>
                      </div>
                      
                      <div class="button input-box">
                        <input type="submit" id="join" value="회원가입">
                      </div>
                      <div class="text sign-up-text">이미 아이디가 있으신가요? <label for="flip">로그인</label></div>
                </form>
            </div>
            </div>
            </div>
          </div>
    </main>
</body>
</html>