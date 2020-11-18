<%@page import="kr.co.engcom.dto.CMBoardDTO"%>
<%@page import="kr.co.engcom.dto.CMBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	String id=null;
	if(session.getAttribute("id")!=null){
		id=(String)session.getAttribute("id");
	}
	List CMBoardList = (List)request.getAttribute("CMBoardList");
	int listcount = ((Integer)request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer)request.getAttribute("page")).intValue();
	int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer)request.getAttribute("startpage")).intValue();
	int endpage = ((Integer)request.getAttribute("endpage")).intValue();
%>
<html>
<head>
	<title>퀴즈 캔버스</title>
	<jsp:include page="/common/head.jsp"></jsp:include>
</head>
<!-- 퀴즈 캔버스 -->
<body>
	<jsp:include page="/common/top.jsp"></jsp:include>
	<jsp:include page="/common/left.jsp"></jsp:include>
	<jsp:include page="/common/login.jsp"></jsp:include>
		
	<div class="wrapper">
		<div class="row">
			<div class="col-13 col-m-12 col-sm-12">
				<div class="card">
						<div class="card-header">
							<h1>퀴즈 캔버스</h1>
						</div>
						<div class="card-content">
							<!-- 전체 목록 개수, 글쓰기 버튼 11.17 오정은 수정 -->
							<span class="total">전체 ${listcount}건</span>
								<%if(id!=null && id.equals("admin")){%>
								<span>
								<!--<a href="./MemberListAction.me">[회원관리]</a>  -->
								<%}%>
					   			<button type="button" class="write-btn" onclick="location.href='writeView.cm'">
						   			<i class="fas fa-pencil-alt">&nbsp&nbsp글쓰기</i>
					   			</button>
					   		</span>
					   		<!-- //전체 목록 개수, 글쓰기 버튼 11.17 오정은 수정 -->
					   		
					   		<!-- 게시판 11.17 오정은 수정 -->
						   	<div class="main-board">
							   	<table>
							   		<!-- 게시판 top -->
								   	<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>날짜</th>
										</tr>
									</thead>
									<!-- //게시판 top -->
									
									<!-- 게시글 -->
									<tbody>
										<%
											for(int i=0; i<CMBoardList.size(); i++){
												CMBoardDTO bl= (CMBoardDTO)CMBoardList.get(i);
										%>
										<tr align="center" valign="middle" bordercolor="#333333"
											onmouseover="this.style.backgroundColor='F8F8F8'"
											onmouseout="this.style.backgroundColor=''">
											<td>
												<%=bl.getCMBoardNumber()%>
											</td>
											<td>
												<div align="left">
													<a href="./CMBoardDetailService.cm?num=<%=bl.getCMBoardNumber()%>">
														<%=bl.getCMBoardSubject()%>
													</a>
												</div>
											</td>
											<td>
												<div align="center"><%=bl.getCMBoardId() %></div>
											</td>
											<td>
												<div align="center"><%=bl.getCMBoardDate() %></div>
											</td>	
										</tr>
									<%} %>
									<!-- //게시글 11.17 오정은 수정-->
									</tbody>
								</table>
							</div>
								
							<!-- 페이징 처리 11.17 오정은 수정-->
							<div class="paging">
								<%if(nowpage<=1){ %>
								&nbsp;
								<%}else{ %>
								<a href="./list.cm?page=<%=nowpage-1 %>" class="direction prev"></a>&nbsp;
								<%} %>
								
								<%for(int a=startpage;a<=endpage;a++){
									if(a==nowpage){%>
									<strong><%=a %></strong>
									<%}else{ %>
									<a href="./list.cm?page=<%=a %>"><%=a %></a>
									&nbsp;
									<%} %>
								<%} %>
								
								<%if(nowpage>=maxpage){ %>
								<%}else{ %>
								<a href="./list.cm?page=<%=nowpage+1 %>" class="direction next"></a>
								<%} %>
						<!-- //페이징 처리 11.17 오정은 수정-->
						</div>
					</div>
		 		</div>
	 		</div>
 		</div>
	</div>
	<jsp:include page="/common/footer.jsp"></jsp:include>	
	<jsp:include page="/common/script.jsp"></jsp:include>	
</body>
</html>