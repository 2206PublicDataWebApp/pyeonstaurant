<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">${notice.noticeNo }번 게시글 수정하기</h1>
	<br>
	<form action="/notice/modify" method="post" enctype="multipart/form-data">
		<input type="hidden" name="page" value="${page }">
		<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
		<input type="hidden" name="noticeFilename" value="${notice.noticeFilename }">
		<input type="hidden" name="noticeFileRename" value="${notice.noticeFileRename }">
		<table align="center" border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="noticeTitle" value="${notice.noticeTitle }"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="30" rows="7" name="noticeContent">${notice.noticeContent }</textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="reloadFile">
					<a href="#">${notice.noticeFilename }</a>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정">
					<a href="/notice/list">목록으로</a>
					<a href="javascript:history.go(-1);">이전 페이지로</a>
				</td>
			</tr>
		</table>
	</form>  
</body>
</html>