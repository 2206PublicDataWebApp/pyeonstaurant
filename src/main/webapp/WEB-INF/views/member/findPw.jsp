<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>

 <form action="/member/findPw.kh" method="post">
                    <div class="input-boxes">
                      <div class="input-box">
                        <i class="fas fa-envelope"></i>
                        <input type="text" name="memberEmail" id="email" placeholder="Enter your email" required>
                        <button type="button" id="email_auth_btn" class="email_auth_btn">인증번호 받기</button>
                      </div>
                      
                      <div class="input-box">
                        <i class="fas fa-envelope"></i>
                        <input type="text" id="email_auth_key" placeholder="Verification Code" required>
                      </div>                      
                      
                      <div class="input-box">
                        <i class="fas fa-lock"></i>
                        <input type="password"  id="password" name="memberPwd" placeholder="Enter your password" required>
                      </div>
                      <div class="input-box">
                        <i class="fas fa-lock"></i>
                        <input type="password"  id="password_check" placeholder="Re-Enter your password" required>
                      </div>

                      
                      <div class="button input-box">
                        <input type="submit" id="join" value="Sumbit">
                      </div>
                </form>
</body>
</html>