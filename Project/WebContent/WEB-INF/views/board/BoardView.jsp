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
	
	<!-- 11.18 수정 및 추가 오정은 -->
	<!-- 컨텐츠 -->
	<div class="wrapper">
		<!-- 전체 게시판 -->
		<div class="row">
			<div class="col-13 col-m-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<h1>${board.boardName} 게시판</h1>
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
										<div>첨부파일&nbsp;&nbsp;&nbsp;&nbsp;
										<c:choose>
										<c:when test="${board.filename != null}">
											<a href="download.jsp?file_name=${board.filename}">
												${board.filename} </a>
										</c:when>
										</c:choose>
										</div>
									</div>
									
						</div>
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
						
						<!-- 댓글 수정여부 받아서 검사 == span 수정중 추가할 것**************   -->
						
					</div>
					<!-- //달린 댓글 header -->
					
					<!-- 달린 댓글 contents -->					
					<div class="card-content">
						<c:forEach var="cmt" items="${comment}">
							<div name="comments-target">
								<span class="comment-id">&nbsp;${cmt.id}</span>
								<c:if test="${cmt.update_Flag eq 'Y'}">
								<span class="comment-updated">&nbsp;(수정됨)</span>
								</c:if>
								<span class="comment-date">${cmt.redate}</span>
							</div>
							
							<!-- 댓글 수정, 삭제 버튼 조건! -->
							<c:choose>
							<c:when test="${cmt.id eq sessionScope.userid || sessionScope.usercode eq 1}">
							<div id="comment-target">
								<input type="hidden" name="commentNumber" value="${cmt.commentNumber}">
								<div class="commentarea" value="${cmt.commentContent}">
									${cmt.commentContent}
								</div>
								<textarea class="update-area" id="updateContent" name="updateContent">
								</textarea>
								<div class="comment-mt comment-mb">
									<button type="button" class="comment-btn cmt-delete">댓글 삭제</button>
									<button type="button" class="comment-btn cmt-update">댓글 수정</button>
									<button type="button" class="comment-btn updateConfirm">수정하기</button>
									<button type="button" class="comment-btn updateCancel">돌아가기</button>
								</div>
							</div>
							</c:when>
							<c:otherwise>
							<div class="commentarea comment-mb">
								${cmt.commentContent}
							</div>
							</c:otherwise>
							</c:choose>
							<!-- //댓글 수정, 삭제 버튼 조건! -->
							
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
					
					
					<!-- 11.18 수정 및 추가 오정은 -->
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
											<div class="leftAlign">${userid}<br> <br> <textarea
													class="textarea" name="commentContent" id="commentContent"
													placeholder="댓글을 남겨보세요"></textarea>
									</div>
										<!-- 댓글 등록 -->
										<div class="comment-update">
											<button class="board-update" type="submit" id="send">등록</button>
										</div>
										<!-- //댓글 등록 -->
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
								<!-- //11.18 수정 및 추가 오정은 -->

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
<!-- //11.18 수정 및 추가 오정은 -->

	<jsp:include page="/common/footer.jsp"></jsp:include>
	<jsp:include page="/common/script.jsp"></jsp:include>
	
	<script type="text/javascript">
		// 댓글 수정삭제버튼이 없을 경우 js 에러 > 방지하는 조건문
		if($('#comment-target').length){	// 댓글 수정,삭제 버튼이 존재 = 1
			//console.log($(this).length);
			
			$(function(){
				$('.cmt-update').each(function(){
					
					var cmtupdate;
					var cmtdelete;
					var confirmbtn;
					var cancelbtn;
					
					$(this).click(function(){
						// 기존 코멘트 가져오기
						var cmtContent = $(this).parent().siblings('.commentarea').attr("value");
						//console.log(cmtContent);
						
						// 기존 요소 가지고 있기
						var parentEle = $(this).parent();
						updateBtn = $(this);
						deleteBtn = $(this).siblings('.cmt-delete');	//확실한건지모름
						var hiddenArea = $(this).parent().siblings('.update-area');
						
						cmtupdate = $(this);
						cmtdelete = $(this).siblings('.cmt-delete');
						confirmbtn = $(this).siblings('.updateConfirm');
						cancelbtn = $(this).siblings('.updateCancel');
						
						// 새로운 textarea (수정하는 칸)
						$(this).parent().siblings('.update-area').css('display','block').text(cmtContent);
						$(this).css('display','none');
						$(this).siblings('.cmt-delete').css('display','none');
						$(this).siblings('.updateConfirm').css('display','block');
						$(this).siblings('.updateCancel').css('display','block');
						
						// '수정하기' 버튼
						parentEle.children('.updateConfirm').on({	// $(this) 는 .updateConfirm
							click:function(){
								//console.log($(this).parent().siblings('.update-area').val());
								//console.log($(this).parent().siblings('.update-area').text());
								if($(this).parent().siblings('.update-area').val() === ""){
									swal({
										title: "수정하실 댓글을 입력해주세요.",
										text: "공백은 허용하지 않습니다!",
										icon: "warning",
										button: "고칠게요!",
									});
								}else {
									swal({
										title: "정말로 수정하시겠어요?",
										icon: "info",
										closeOnClickOutSide: false,	// 확인 버튼(true) 제외하고 모두 (false || null) = false
										buttons: {
											cancle: {	// cancel 아닌가???
												text: '마음이 바꼈어요..',
												value: false,
												className: 'cancel-btn'
											},
											confirm: {
												text: "수정할게요!",
												value: true,
												className: 'confirm-btn'
											}
										}
									}).then(function(isConfirmed){
										if(isConfirmed == null || !isConfirmed) {	/*수정취소*/
											swal("수정을 취소하셨습니다.", "수정하기 창을 닫으시려면 '돌아가기' 버튼을 눌러주세요.", "warning");
										}else if (isConfirmed){						/*수정확인*/
											//console.log("수정할 내용:"+parentEle.siblings('.update-area').val().trim());
											//console.log("수정할 번호"+parentEle.siblings('input:hidden').val());
											
											$.ajax({
												url:"UpdateComment",
												type: "POST",
												dataType:"html",
												data : {
													updateContent: parentEle.siblings('.update-area').val().trim(),
													commentNumber: parentEle.siblings('input[type="hidden"]').val()
												},
												success:function(responseData){
													
													// 성공적으로 댓글 수정되었을 경우
													if(responseData.trim() === "Complete"){
														let updatedCmt = cmtupdate.parent().siblings('.update-area').val();
														console.log(updatedCmt);
														cmtupdate.parent().siblings('.commentarea').attr("value",updatedCmt);
														cmtupdate.parent().siblings('.commentarea').text(updatedCmt);
														cmtupdate.parent().siblings('.update-area').css('display','none').text("");
														
														cmtupdate.css('display','block');
														cmtdelete.css('display','block');
														confirmbtn.css('display','none');
														cancelbtn.css('display','none');
														
														swal("수정 완료", "댓글이 성공적으로 수정되었습니다.", "success");
														setTimeout(function(){
															location.reload();
														},1500);
													}else {
														swal("수정 실패", "다시 시도해주세요.", "error");
													}
												},
												error : function(request, status, error ) {   // 오류가 발생했을 때 호출된다. 
													console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
													swal("에러 발생", "다시 시도해주세요.", "error");
												}
											});
										}
									});
									
								}
							}
						})
						
						// '돌아가기' 버튼
						parentEle.children('.updateCancel').on({
							click:function(){
								$(this).parent().siblings('.update-area').css('display','none').text('');
								$(this).parent().siblings('.update-area').attr('value','');
								cmtupdate.css('display','block');
								cmtdelete.css('display','block');
								confirmbtn.css('display','none');
								$(this).css('display','none');
								
								console.log("돌아가기 버튼 클릭함.")
							}
						});
						
					});
				});
				
				// 댓글 삭제 버튼
				$('.cmt-delete').each(function(){
					$(this).click(function(){
						var numberForDelete = $(this).parent().siblings('input[type="hidden"]').val();
						console.log($(this).parent().siblings('input[type="hidden"]').val());
						var cmtTarget_1 = $(this).parent().parent().siblings('div[name="comments-target"]');
						var cmtTarget_2 = $(this).parent().parent();
						
						swal({
							title: "정말로 삭제하시겠어요?",
							icon: "info",
							closeOnClickOutSide: false,	// 확인 버튼(true) 제외하고 모두 (false || null) = false
							buttons: {
								cancle: {	// cancel 아닌가???
									text: '아니오',
									value: false,
									className: 'cancel-btn'
								},
								confirm: {
									text: "삭제할래요.",
									value: true,
									className: 'confirm-btn'
								}
							}
						}).then(function(isAllowed){
							// 삭제 반대했을 경우
							if(isAllowed == null || !isAllowed){
								swal("삭제를 취소하셨습니다.");
							}else {
								// 삭제할 경우
								$.ajax({
									url:"DeleteComment",
									type: "POST",
									dataType:"html",
									data : {
										commentNumber: numberForDelete
									},
									success:function(responseData){
										
										// 성공적으로 댓글 삭제되었을 경우
										if(responseData.trim() === "Complete"){
											swal("삭제 완료", "댓글이 성공적으로 삭제되었습니다.", "success");
											setTimeout(function(){
												location.reload();
											},1500);
										}else {
											swal("삭제 실패", "다시 시도해주세요.", "error");
										}
									},
									error : function(request, status, error ) {   // 오류가 발생했을 때 호출된다. 
										console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
										swal("에러 발생", "다시 시도해주세요.", "error");
									}
								});
							}
						});
					});
				});
			});
		}else{								// 댓글 수정,삭제 X = 0;				
			console.log("X");
		}
	</script>
</body>
</html>