<%@page import="kr.co.engcom.dto.BoardDto"%>
<%@page import="java.util.List"%>
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

	<!-- 컨텐츠 -->
	<div class="wrapper">
		<div class="row">
			<div class="col-13 col-m-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<h1>전체 게시판</h1>
						<i class="fas fa-ellipsis-h"></i>
					</div>
					<div class="card-content">
						<c:set var="userid" value="${sessionScope.userid}"/>
							<c:if test="${not empty sessionScope.userid}">
								<c:if test="${userid=='admin'}">
									<span class="board-total">글 개수 : ${listcount}&nbsp;&nbsp;</span>
								</c:if>
								<!-- 버튼 추가 11.18  오정은 -->
								<button type="button" class="write-btn" onclick="location.href='BoardWrite.bo'" style="background-color: #9161d2;">
									<i class="fas fa-pencil-alt">&nbsp&nbsp글쓰기</i>
								</button>
								<!-- 버튼 추가 11.18  오정은 -->
							</c:if>
						<div class="main-board">
							<table>
								<thead>
									<tr>
										<th>번호</th>
										<th>게시판</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="board" items="${requestScope.boardlist}"
										varStatus="status">
										<tr>
											<td>${board.contentNumber}</td>
											<td>${board.boardName}</td>
											
											<td class="leftAlign">
												<c:choose>
													<c:when test="${board.depth != 0}">
														<c:forEach var="depth" begin="0" end="${(board.depth)*2}">
															&nbsp;
														</c:forEach>
															▶
													</c:when>
													<c:otherwise>
															
													</c:otherwise>
												</c:choose>
												<a href="./BoardDetailService.bo?num=${board.contentNumber}">
													${board.contentTitle}
												</a>
											</td>
											<td>${board.id}</td>
											<td>${board.reportingDate}</td>
											
											
										</tr>
									</c:forEach>
										<c:set var="page" value="${requestScope.page}"/>
										<c:set var="maxpage" value="${requestScope.maxpage}"/>
										<c:set var="startpage" value="${requestScope.startpage}"/>
										<c:set var="endpage" value="${requestScope.endpage}"/>
										<c:set var="listcount" value="${requestScope.listcount}"/>
										
					
								</tbody>
																		<tr align=center height=20>
											<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
												<c:choose>
													<c:when test="${page<=1}">
														[이전]&nbsp;
													</c:when>
													<c:otherwise>
														<a href="./BoardList.bo?page=${page-1}">[이전]</a>&nbsp;
													</c:otherwise>
												</c:choose>
												
												<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
													<c:choose>
														<c:when test="${page==a}">
															[${a}]
														</c:when>
														<c:otherwise>
															<a href="./BoardList.bo?page=${a}">[${a}]</a>
															
														</c:otherwise>
													</c:choose>
												</c:forEach>
												
												<c:choose>
													<c:when test="${page>=maxpage}">
														&nbsp;[다음]
													</c:when>
													<c:otherwise>
														&nbsp;<a href="./BoardList.bo?page=${page+1}">[다음]</a>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //컨텐츠 -->


	<jsp:include page="/common/footer.jsp"></jsp:include>
	<jsp:include page="/common/script.jsp"></jsp:include>
</body>
</html>