<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세페이지</title>
</head>
<body>
	<h1 align="center">${notice.noticeNo }번 게시글 상세 보기</h1>
	<br><br>
	<table align="center" width="500" border="1">
		<tr>
			<td>제목</td>
			<td>${notice.noticeTitle }</td>
		</tr>
		<tr>
			<td>작성날짜</td>
			<td>${notice.noticeDate }</td>
		</tr>
		<tr height="300">
			<td>내용</td>
			<td>${notice.noticeContent }
			<%-- <img alt="본문이미지" src="/resources/buploadFiles/${notice.noticeFileRename }"> --%>
			</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
				<img alt="본문이미지" src="/resources/buploadFiles/${notice.noticeFileRename }" 
				width="300" height="300">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href="/notice/modifyView?noticeNo=${notice.noticeNo }&page=${page}">수정 페이지로 이동</a>
				<a href="#" onclick="noticeRemove(${page});">삭제하기</a>
			</td>
		</tr>
	</table>
<script>
function noticeRemove(value) {
	event.preventDefault(); // 하이퍼링크 이동 방지
	if(confirm("게시물을 삭제하시겠습니까?")) {
		location.href="/notice/remove?page="+value;
	}
}
</script>
</body>
</html>