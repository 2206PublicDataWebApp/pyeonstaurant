<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>편스토랑</title>
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/join.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
    <header>
        <div class="header-container">
            <h1><a href="#"><img src="https://statics.goorm.io/logo/edu/goorm_edu.svg" alt="goorm edu"></a></h1>
            <nav class="main-navigation">
                <a href="#" class="header-search"></a>
                <a href="#" class="header-cart"></a>
                <a href="#" class="header-mypage"></a>
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
            <input type="checkbox" id="flip">
            <div class="cover">
              <div class="front">
                <img src="/resources/images/login_front.jpg" alt="">
                <div class="text">
                  <span class="text-1">Every new friend is a <br> new adventure</span>
                  <span class="text-2">Let's get connected</span>
                </div>
              </div>
              <div class="back">
                <img class="backImg" src="/resources/images/login_back2.jpg" alt="">
                <div class="text">
                  <span class="text-1">Complete miles of journey <br> with one step</span>
                  <span class="text-2">Let's get started</span>
                </div>
              </div>
            </div>
            <div class="forms">
                <div class="form-content">
                  <div class="login-form">
                    <div class="title">Login</div>
                  <form action="/member/login.kh" method="post">
                    <div class="input-boxes">
                      <div class="input-box">
                        <i class="fas fa-envelope"></i>
                        <input type="text" name="memberEmail" placeholder="Enter your email" required>
                      </div>
                      <div class="input-box">
                        <i class="fas fa-lock"></i>
                        <input type="password" name="memberPwd" placeholder="Enter your password" required>
                      </div>
                      <div class="text"><a href="#">Forgot password?</a></div>
                      <div class="button input-box">
                        <input type="submit" value="Sumbit">
                      </div>
                      <div class="text sign-up-text">Don't have an account? <label for="flip">Sigup now</label></div>
                    </div>
                </form>
              </div>
                <div class="signup-form">
                  <div class="title">Signup</div>
               <form action="/member/register.kh" method="post">
                    <div class="input-boxes">
                      <div class="input-box">
                        <i class="fas fa-envelope"></i>
                        <input type="text" name="memberEmail" id="email" placeholder="Enter your email" required>
                        <button type="button" id="email_auth_btn" class="email_auth_btn">인증번호 받기</button>
                        <input type="text" placeholder="인증번호 입력" id="email_auth_key">
                      </div>
                      
                      <!--
                      <div class="input-box">
                        <i class="fas fa-envelope"></i>
                        <input type="text" placeholder="Verification Code" required>
                      </div>
                      -->
                      <div class="input-box">
                        <i class="fas fa-lock"></i>
                        <input type="password"  name="memberPwd" placeholder="Enter your password" required>
                      </div>
                      <!--  <div class="input-box">
                        <i class="fas fa-lock"></i>
                        <input type="text" placeholder="Re-Enter your password" required>
                        -->
                      </div>
                      <div class="input-box">
                        <i class="fas fa-user"></i>
                        <input type="text" name="memberNickname" placeholder="Enter your Nickname" required>
                      </div>
                      
                      <div class="button input-box">
                        <input type="submit" value="Sumbit">
                      </div>
                      <div class="text sign-up-text">Already have an account? <label for="flip">Login now</label></div>
                </form>
            </div>
            </div>
            </div>
          </div>
    </main>

    <div class="fixed-icon">
        <a href="#" class="store-icon"><img src="/resources/images/store.png"></a>
        <a href="#"><img src="/resources/images/chat.png"></a>
    </div>
    
	<script src="/resources/js/join.js"></script>

</body>
</html>