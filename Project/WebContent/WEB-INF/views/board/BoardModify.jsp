<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/common/summernote.jsp"></jsp:include>
<script language="javascript">
	function addboard() {
		boardform.submit();
	}
    $(document).ready(function() {
        $('#summernote').summernote({ // summernote를 사용하기 위한 선언
            height: 400,
			callbacks: { // 콜백을 사용
                // 이미지를 업로드할 경우 이벤트를 발생
			    onImageUpload: function(files, editor, welEditable) {
				    sendFile(files[0], this);
				}
			}
		});
	});

    
    /* summernote에서 이미지 업로드시 실행할 함수 */
 	function sendFile(file, editor) {
        // 파일 전송을 위한 폼생성
 		data = new FormData();
 	    data.append("uploadFile", file);
 	    $.ajax({
 	        data : data,
 	        type : "POST",
 	      	enctype: 'multipart/form-data',
 	        url : "./summernote_imageUpload.jsp",
 	        cache : false,
 	        contentType : false,
 	        processData : false,
 	        success : function(data) { // 처리가 성공할 경우
                // 에디터에 이미지 출력
 	        	$(editor).summernote('editor.insertImage', data.url);
 	        	//$('#summernote').append('<img src="'+data.url+'"/>');
 	        },
 	  		error:function(request,status,error){
 		    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 		   }

 	    });
 	}
</script>



</head>

<body class="wrap">
	<jsp:include page="/common/top.jsp"></jsp:include>
	<jsp:include page="/common/left.jsp"></jsp:include>
	<jsp:include page="/common/login.jsp"></jsp:include>
	<c:set var="userid" value="${sessionScope.userid}"/>
	<c:set var="board" value="${requestScope.boarddata}"/>
	<!-- 컨텐츠 -->
	<div class="wrapper">
		<!-- 전체 게시판 -->
		<div class="row">
			<div class="col-13 col-m-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<h1>글쓰기</h1>
						<i class="fas fa-ellipsis-h"></i>
					</div>
					<div class="card-content">

						<form action="./BoardModifyService.bo" method="post"
							enctype="multipart/form-data" id="boardform" name="boardform">
							<input type="hidden" name="id" value="${userid}">
							<input type="hidden" name="contentNumber" value="${board.contentNumber}">
							<table>
							
								<tr>
									<td>
										<div align="center">글쓴이</div>
									</td>
									<td class="leftAlign">${userid}</td>
								</tr>

								<tr>
									<td>
										<div align="center">게시판 종류</div>
									</td>
									<td class="leftAlign">
									<!--<select name=boardCode>
									    <option value="1" selected>Grammer</option>
									    <option value="2">Reading</option>
									    <option value="3" >Listening</option>
									</select> -->
									${board.boardName}
									</td>
								</tr>
								<tr>
									<td>
										<div align="center">제 목</div>
									</td>
									<td><input id="contentTitle" name="contentTitle" type="text" size="50"
										maxlength="100" value="${board.contentTitle}" style="width:100%;" /></td>
								</tr>
								<tr>
									<td>
										<div align="center">내 용</div>
									</td>
									<td style="text-align:left;">
									<textarea id="summernote" name="content" >${board.content}</textarea>
									</td>
								</tr>
								<tr>
									<td>
										<div align="center">파일 첨부</div>
									</td>
									<td class="leftAlign">
										<input name="filename" type="file" />
										<c:choose>
											<c:when test="${board.filename != null}">
												<a href="download.jsp?file_name=${board.filename}">
													${board.filename} </a>
											</c:when>
										</c:choose>
									</td>
									
								</tr>
								
								<tr bgcolor="cccccc">
									<td colspan="2" style="height: 1px;"></td>
									
								</tr>
								<tr>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr align="center" valign="middle">
									<td colspan="5">
									<input type="submit" value="등록">
									<!-- <a href="javascript:addboard()">[수정]</a>&nbsp;&nbsp; -->
									<button type="button" onclick="javascript:history.go(-1)">뒤로</button>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
			<!-- //전체 게시판 -->
		</div>
		<!-- //컨텐츠 -->
	</div>


		<jsp:include page="/common/footer.jsp"></jsp:include>
		<jsp:include page="/common/script.jsp"></jsp:include>
</body>
</html>