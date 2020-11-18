<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/common/summernote.jsp"></jsp:include>

<script>

	function addboard() {
		boardform.submit();
	}
	
    $(document).ready(function() {
	    $('#summernote').summernote({
	        placeholder: '내용을 입력하세요',
	        tabsize: 2,
	        height: 120,
	        toolbar: [
					['style', ['style']
				],
				['font', 
					['bold', 'underline', 'clear']
				],
		        ['color', 
		        	['color']
		        ],
		        ['para', 
		        	['ul', 'ol', 'paragraph']
		        ],
		        ['table', 
		        	['table']
		        ],
		        ['insert', 
		        	['link', 'picture', 'video']
		        ],
		        ['view', 
		        	['fullscreen', 'codeview', 'help']
		        ]
	        ]
	      });

    });


</script>
</head>
<body>
	<jsp:include page="/common/top.jsp"></jsp:include>
	<jsp:include page="/common/left.jsp"></jsp:include>
	<jsp:include page="/common/login.jsp"></jsp:include>
	<c:set var="userid" value="${sessionScope.userid}" />
	<!-- 컨텐츠 -->
	<div class="wrapper">
		<!-- 전체 게시판 -->
		<div class="row">
			<div class="col-13 col-m-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<h1>게시판 글쓰기</h1>
					</div>
					<div class="card-content">
						<form action="./BoardAddService.bo" method="post"
							enctype="multipart/form-data" id="boardform" name="boardform">
							<input type="hidden" name="id" value="${userid}">
							<!-- 11.18 수정 및 추가 오정은 -->
							<!-- 게시판  선택 -->
							<select id="english" name="boardName" class="board-select">
								<option value="" selected disabled hidden>게시판을 선택해주세요</option>
								<option value="Grammar">Grammar</option>
								<option value="Reading">Reading</option>
								<option value="Listening">Listening</option>
							</select>
							<!-- //게시판  선택 -->
							
							<!-- 제목 작성 -->
							<input id="contentTitle" name="contentTitle" type="text" 
							class="board-title" placeholder="제목을 입력해 주세요.">
							<!-- //제목 작성 -->
							
							<!-- 내용 작성 -->
							<textarea id="summernote" name="content"
									style="resize: vertical;"></textarea>
							<!-- 내용 작성 -->
							
							<!-- 이미지 업로드 -->
							<div class="board-img">
								<input name="filename" type="file"/>
							</div>
							<!-- 이미지 업로드 -->
								
							<!-- 버튼 -->
							<div class="board-btns">
								<button class="board-update" type="submit" value="등록">등록</button>
								<!-- <a href="javascript:addboard()">[등록]</a>&nbsp;&nbsp; -->
								<button class="board-back" onclick="location.href='javascript:history.go(-1)'">뒤로</button></a>
							</div>
							<!-- //버튼 -->
							<!-- //11.18 수정 및 추가 오정은 -->
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