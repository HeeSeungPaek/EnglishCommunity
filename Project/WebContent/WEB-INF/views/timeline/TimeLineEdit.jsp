<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function update(){
		timeform.submit();
	};
</script>
</head>
<body>
	<c:set var="timeline" value="${requestScope.TimeLine}" ></c:set>
	
	
	<form action="TimeLineUpdate.tc" method="post" name="timeform" style="width:100%">
	<input name="timeLineNumber" type="hidden" value="${timeline.timeLineNumber}" id="timeLineNumber" readonly /></td>
		<input name="content_eng" type="text" value="" id="content_eng" class="today-input-en" placeholder="${timeline.timeLineNumber}번글의 수정 할 영문을 입력해 주세요"></input>
		<input name="content_kor" type="text" value="" id="content_kor" class="today-input-ko" placeholder="${timeline.timeLineNumber}번글의 수정 할 한글을 입력해 주세요"/>
		<!-- <input name="timelinenumber" type="text" value="" id="timelinenumber"/> -->
		<div class="today-btn-wrap">
		<a href="javascript:update()" class="enroll-btn">등록</a>
		<a href="javascript:history.go(-1)" class="cancel-btn">취소</a>
		</div>
	</form>
	<%-- <form action="TimeLineUpdate.tc" method="post" name="timeform">
	<div class="card-content">
		<input name="timeLineNumber" type="text" value="${timeline.timeLineNumber}" id="timeLineNumber" readonly /></td>
		<input name="content_eng" type="text" value="" id="content_eng" class="today-input-en" placeholder="영문을 입력해 주세요"/></td>
		<input name="content_kor" type="text" value="" id="content_kor" class="today-input-ko" placeholder="한글을 입력해 주세요"/></td>
		
		
		<a href="javascript:update()" class="enroll-btn">[등록]</a>
		<a href="javascript:history.go(-1)" class="cancel-btn">[취소]</a>
	</div>
	</form>	 --%>
</body>
</html>