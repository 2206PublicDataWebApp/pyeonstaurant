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
    <style>
        #list {
            margin-left: 7px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <form method="post" action="/notice/regist" enctype="multipart/form-data">
                <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                <thead>
                    <tr>
                        <th colspan="2" style="background-color: #eeeeee; text-align: center;">공지사항 등록</th>						
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="text" class="form-control"  placeholder="공지사항 제목" name="noticeTitle" id="title"></td>
                        
                    </tr>
                    <tr>				
                        <td><textarea class="form-control" placeholder="공지사항 내용" name="noticeContent" style="height: 350px" id="content"></textarea></td>
                    </tr>
                    <tr>
                        <td><input type="file" name="uploadFile" class="isFile" onChange="imgCheck();">
                        </td>
                    </tr>
                    <!-- <tr>
                        <td colspan="2" align="center" >
                            <a href="/notice/list">목록으로</a>
                        </td>
                    </tr> -->
                </tbody>
            </table>
            <a href="/notice/list" class="btn btn-primary pull-right" id="list" >목록으로</a>
            <input type="submit" class="btn btn-primary pull-right" value="등록" onClick="sbm();">
            </form>						
        </div>
    </div>
    
    <script>
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
    </script>
</body>
</html>