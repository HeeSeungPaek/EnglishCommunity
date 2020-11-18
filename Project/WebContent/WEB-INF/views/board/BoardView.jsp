<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/common/head.jsp"></jsp:include>
</head>

<body class="wrap">
	<jsp:include page="/common/top.jsp"></jsp:include>
	<jsp:include page="/common/left.jsp"></jsp:include>
	<jsp:include page="/common/login.jsp"></jsp:include>
	
	<!-- 해당 글 -->
	<c:set var="board" value="${requestScope.boarddata}" />
	<!-- //해당 글 -->
	
	<!-- 댓글 페이지 -->
	<c:set var="comment" value="${requestScope.commentList }" />
	<c:set var="pagesize" value="${requestScope.pagesize}" />
	<c:set var="pagecount" value="${requestScope.pagecount}" />
	<c:set var="currpage" value="${requestScope.currpage}" />
	<!-- //댓글 페이지 -->
	
	<!-- 컨텐츠 -->
	<div class="wrapper">
		<!-- 전체 게시판 -->
		<div class="row">
			<div class="col-13 col-m-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<h1>${board.boardName} 게시판</h1>
						<i class="fas fa-ellipsis-h"></i>
					</div>
					<div class="card-content">
						<div class="board-confirm">
						<h3>${board.boardName}</h3>
						<h1>${board.contentTitle}</h1>
						<h4>${board.id}</h4>
						<hr>
					</div>
						
						<div class="leftAlign" style="font-family: 돋음;">
							${board.content}
									<br>
									<div class="board-img">
										<div>첨부파일</div>
									</div>
									<c:choose>
										<c:when test="${board.filename != null}">
											<a href="download.jsp?file_name=${board.filename}">
												${board.filename} </a>
										</c:when>
									</c:choose></div>
									<br>
									<span class="board-list-btn">
									<c:if test="${not empty sessionScope.userid}">
										<!-- 답변, 수정, 삭제 -->
										<button class="border-answer" onclick="location.href='./BoardReplyView.bo?num=${board.contentNumber}'">답변</button>
										<button class="border-modify" onclick="location.href='./BoardModify.bo?num=${board.contentNumber}'">수정</button>
										<button class="border-delete" onclick="location.href='./BoardDeleteService.bo?num=${board.contentNumber}'">삭제</button>
										<!-- 답변, 수정, 삭제 -->
									</c:if> 
									</span>
										<!-- 목록 -->
										<button class="border-list" onclick="location.href='./BoardList.bo'">목록</button>
										<!-- //목록 -->
						
					</div>
				</div>
			</div>
		</div>
		<!-- //전체 게시판 -->
		
		<!-- 댓글 div -->
		<div class="row">
			<div class="col-13 col-m-12 col-sm-12">
				<!-- 달린 댓글 표시 -->
				<div class="card">
				
				
					<!-- 달린 댓글 header -->
					<div class="card-header">
						<h3>${board.contentNumber}번글의 댓글</h3>
					</div>
					<!-- //달린 댓글 header -->
					
					<!-- 달린 댓글 contents -->					
					<div class="card-content">
						<c:forEach var="cmt" items="${comment}">
							<div>
								<span class="comment-id">&nbsp;${cmt.id}</span>
								<span class="comment-date">${cmt.redate}</span>
							</div>
							
							<div class="commentarea comment-mb">
								${cmt.commentContent}
							</div>
						</c:forEach>
					</div>
					<!-- //달린 댓글 contents -->

					<!-- 댓글 페이징 -->
					<div class="page-container">
						
						<!-- 부트스트랩 페이지네이션 -->
						<ul class="pagination pagination-sm" style="margin: 0 auto">
						
							<!-- 이전 페이지 버튼 -->
							<c:if test="${currpage>1}">
								<li class="page-item"><a
									href="BoardDetailService.bo?num=${board.contentNumber}&cp=${currpage-1}&ps=${pagesize}"
									class="page-link"><i class="fas fa-arrow-left"></i></a>
								</li>
							</c:if>
							<!-- //이전 페이지 버튼 -->
							
							<!-- 페이지 번호 -->
							<c:forEach var="pnum" begin="1" end="${pagecount}" step="1">
								<c:choose>
									<c:when test="${currpage == pnum}">
										<li class="page-item active">
											<a href="" class="page-link">${pnum}</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a
											href="BoardDetailService.bo?num=${board.contentNumber}&cp=${pnum}&ps=${pagesize}"
											class="page-link">${pnum}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<!-- //페이지 번호 -->
							
							<!-- 다음 페이지 버튼 -->
							<c:if test="${currpage < pagecount}">
								<li class="page-item"><a
									href="BoardDetailService.bo?num=${board.contentNumber}&cp=${currpage+1}&ps=${pagesize}"
									class="page-link"><i class="fas fa-arrow-right"></i></a>
								</li>
							</c:if>
							<!-- //다음 페이지 버튼 -->
							
						</ul>
						<!-- //부트스트랩 페이지네이션 -->
						
					</div>
					<!-- // 댓글 페이징 -->
					
					<hr>

					<div class="card-header">
						<h3>댓글 작성하기</h3>
						<i class="fas fa-ellipsis-h"></i>
					</div>
					<div class="card-content">
						<!--  꼬리글 달기 테이블 -->
						<c:set var="userid" value="${sessionScope.userid}" />
						<form action="BoardCommentService.bo" id="comment" method="POST">
							<!-- hidden 태그  값을 숨겨서 처리  -->
							<input type="hidden" name="contentNumber"
								value="${board.contentNumber}"> <input type="hidden"
								name="userid" value="${userid}">
							<!-- hidden data -->
							<table>
								<c:choose>
									<c:when test="${not empty sessionScope.userid}">
										<tr>
											<td class="leftAlign">${userid}<br> <br> <textarea
													class="textarea" name="commentContent" id="commentContent"
													rows="2" cols="112" placeholder="댓글을 남겨보세요"></textarea>
											</td>
										</tr>
										<tr>
											<td class="rightAlign"><input type="submit" id="send"
												value="등록"></td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<td class="leftAlign">비회원입니다<br> <br> <textarea
													class="textarea" name="commentContent" id="commentContent"
													rows="2" cols="112" readonly placeholder="로그인 후 이용하세요"></textarea>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>

							</table>
						</form>
					</div>
				</div>
				<!-- //달린 댓글 표시 -->
				
			</div>
		</div>
		<!-- //댓글 div -->
		
		
	</div>
	<!-- //컨텐츠 -->


	<jsp:include page="/common/footer.jsp"></jsp:include>
	<jsp:include page="/common/script.jsp"></jsp:include>
</body>
</html>