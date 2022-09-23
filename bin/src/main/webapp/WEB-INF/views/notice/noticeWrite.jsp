<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   
</head>
<h1 align="center">게시글 등록 페이지</h1>
<br><br>
<form action="/notice/regist" method="post" enctype="multipart/form-data">
    <table align="center" border="1">
        <tr>
            <td>제목</td>
            <td><input type="text" name="noticeTitle"></td>
        </tr>

        <tr>
            <td>내용</td>
            <td><textarea cols="50" rows="10" name="noticeContent"></textarea></td>
        </tr>
        <tr>
            <td>첨부파일</td>
            <td><input type="file" name="uploadFile1"></td>
        </tr>
<!--         <tr> -->
<!--             <td>첨부파일</td> -->
<!--             <td><input type="file" name="uploadFile2"></td> -->
<!--         </tr> -->
<!--         <tr> -->
<!--             <td>첨부파일</td> -->
<!--             <td><input type="file" name="uploadFile3"></td> -->
<!--         </tr> -->
<!--         <tr> -->
<!--             <td>카테고리</td> -->
<!--             <td><select name="" id=""> -->
<!--                 <option value="">게시판 관련</option> -->
<!--                 <option value="">신고 관련</option> -->
<!--                 <option value="">이벤트 관련</option> -->
<!--                 <option value="">계정 관련</option> -->
<!--                 <option value="">이용 관련</option> -->
<!--             </select></td> -->
<!--         </tr> -->
        <tr>
            <td colspan="2">
                <input type="submit" value="등록">
                <input type="reset" value="취소">
            </td>
        </tr>
    </table>
</form>
</body>
</html>