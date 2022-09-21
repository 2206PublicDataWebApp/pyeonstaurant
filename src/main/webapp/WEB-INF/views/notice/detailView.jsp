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
</head>
<body>
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
</body>
</html>