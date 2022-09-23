<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>공지사항 리스트</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<style type="text/css">
			li {list-style: none; display:inline; padding: 6px;}
		</style>
</head>
<body>
	<div class="container">
		<header>
			<h1>공지사항</h1>
		</header>
		<hr />	
		<section id="container">
				<table class="table table-hover">
					<thead>
						<tr><th>번호</th>
							<th>제목</th>
							<th>날짜</th>
							<th>첨부파일</th>
						</tr>
					</thead>
					
					<c:if test="${!empty nList }">
			<c:forEach items="${nList }" var="notice" varStatus="i">
				<tr>
					<td>${i.count }</td>
					<td><a href="/notice/detail?noticeNo=${notice.noticeNo }&page=${currentPage }">${notice.noticeTitle }</a></td>
					<td>${notice.noticeDate }</td>
					<td>
						<c:if test="${!empty notice.noticeFilename }">
							O
						</c:if>
						<c:if test="${empty notice.noticeFilename }">
							X
						</c:if>
					</td>
<!-- 					<form action="/notice/remove" method="get"> -->
<!-- 					<td><input type="submit" value="삭제"></td> -->
<!-- 					</form> -->
				</tr>
			</c:forEach>
			<tr align="center" height="20">
			<td colspan="4">
				<c:if test="${currentPage != 1 }">
					<a href="/notice/${urlVal }?page=${currentPage - 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}">[이전]</a>
				</c:if>
				<c:forEach var="p" begin="${startNavi }" end="${endNavi }">
					<c:if test="${currentPage eq p }">
						<b>${p }</b>
					</c:if>
					<c:if test="${currentPage ne p }">
						<a href="/notice/${urlVal }?page=${p }&searchCondition=${searchCondition}&searchValue=${searchValue}">${p }</a>
					</c:if>
				</c:forEach>
				<c:if test="${maxPage > currentPage }">
					<a href="/notice/${urlVal }?page=${currentPage + 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}">[다음]</a>
				</c:if>
				
			</td>
			
		</tr>
		<button onclick="location.href='/notice/writeView.kh';" class="btn btn-primary pull-right">글쓰기</button>
		</c:if>
					
				</table>
				
				<form action="/notice/search" method="get">
				<div class="search row">
					<div class="col-xs-2 col-sm-2">
						<select name="searchCondition" class="form-control">
							<option value="all" <c:if test="${searchCondition eq 'all' }">selected</c:if>>전체</option>
							<option value="title" <c:if test="${searchCondition eq 'title' }">selected</c:if>>제목</option>
							<option value="contents" <c:if test="${searchCondition eq 'contents' }">selected</c:if>>내용</option>
						</select>
					</div>
					 
					<div class="col-xs-10 col-sm-10">
						<div class="input-group">
							<input type="text" name="searchValue" value="${searchValue }" class="form-control" id="searchVal">
							<span class="input-group-btn">
								<input type="submit" value="검색" class="btn btn-default" onClick="sbm();">
							</span>
						</div>
					</div>
				</form>
		</section>	
	</div>
	<script>
	function sbm(){
		var searchVal = document.getElementById("searchVal");
		if(searchVal.value == "") {
			alert("검색어를 입력해주세요.");
			searchVal.focus();
			event.preventDefault();
			return false;
		}
	}	
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>

</body>
</html>