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
</head>
<body>
    <div class="container">
        <div class="row">
            <form method="post" action="/notice/modify" enctype="multipart/form-data">
                <input type="hidden" name="page" value="${page }">
		<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
		<input type="hidden" name="noticeFilename" value="${notice.noticeFilename }">
		<input type="hidden" name="noticeFileRename" value="${notice.noticeFileRename }">
                <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                <thead>
                    <tr>
                        <th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정하기</th>						
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="text" class="form-control"  placeholder="글 제목" name="noticeTitle" value="${notice.noticeTitle }" id="title"></td>
                        
                    </tr>
                    <tr>				
                        <td><textarea class="form-control" placeholder="글 내용" name="noticeContent" style="height: 350px" id="content">${notice.noticeContent }</textarea></td>
                    </tr>
                    <tr>
                        <td><input type="file" name="reloadFile" class="isFile" onChange="imgCheck()" >
                            <a href="#">${notice.noticeFilename }</a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="수정" class="btn btn-primary pull-center" onClick="sbm();">
                            <a href="/notice/list" class="btn btn-primary pull-center">목록으로</a>
                        </td>
                    </tr>
                </tbody>
            </table>
            </form>						
        </div>
    </div>
    <script>
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
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>

</body>
</html>