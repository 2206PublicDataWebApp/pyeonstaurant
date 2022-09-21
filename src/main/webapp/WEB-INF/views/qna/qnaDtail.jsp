<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${qa.qaTitle }</title>
</head>
<body>

q&a번호: ${qa.qaNo }
제목 :<c:if test="${qa.qaSecret == true}">
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
  <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/>
</svg>
</c:if>
 ${qa.qaTitle }
작성자 : ${qa.memberEmail }
내용 : ${qa.qaContents }
작성일자 : ${qa.qaNo }



<c:if test="${qa.qaFile1Rename ne null}">
<img src="/resources/qnaImg/${qa.qaFile1Rename}">
</c:if>
<c:if test="${qa.qaFile2Rename ne null}">
<img src="/resources/qnaImg/${qa.qaFile2Rename}">
</c:if>
<c:if test="${qa.qaFile3Rename ne null}">
<img src="/resources/qnaImg/${qa.qaFile3Rename}">
</c:if>
<c:if test="${qa.qaFile4Rename ne null}">
<img src="/resources/qnaImg/${qa.qaFile4Rename}">
</c:if>
<c:if test="${qa.qaFile5Rename ne null}">
<img src="/resources/qnaImg/${qa.qaFile5Rename}">
</c:if> 

<button>목록으로</button>
<button onclick="location.href='/qna/modifyView.do?qaNo=${qa.qaNo}'">수정하기</button>



</body>
</html>