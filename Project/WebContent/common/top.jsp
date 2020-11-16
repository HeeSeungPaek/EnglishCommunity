<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 파파고 -->
<script type="text/javascript" src="assets/js/papagoChange.js"></script>

<!-- 상위바 -->
<div class="top-menu">
	<!-- 좌측 네비게이션 -->
	<ul class="navbar-nav">
		<!-- 햄버거 버튼 -->
		<li class="nav-item">
			<a class="nav-link">
				<i class="fas fa-bars" onclick="collapseSidebar()"></i>
			</a>
		</li>
		<!-- //햄버거 버튼 -->
		<!-- 로고 -->
		<li class="nav-item">
			<a href="./Main.go">
				<img src="assets/img/logo.png" alt="ENGcom logo" class="logo">
			</a>
		</li>
		
		<!-- //로고 -->
	</ul>
	<!-- //좌측 네비게이션 -->
	
	<!-- 번역기 11.14 추가 오정은 -->
	<!-- <form class="papago">
		<input type="text" onclick="location.href='kor.papago'" alt ="번역 팝업창 버튼" class="papago-page-btn" placeholder="papago...">
		<i class="fas fa-search"></i>
	</form> -->
	<!-- //번역기 -->
	 <form class="papago" >
	<!--  	<select id="papagoselect" name="papagoselect">
	 	<option value="한영" selected="selected">한->영</option>
	 	<option value="영한">영->한</option>
	 	</select> -->
		<!-- <input type="button" id="papagobutton" value="한영전환" /> -->
		<i class='fas fa-exchange-alt' class='change' id="papagobutton" title="한영 전환"></i>
		<div id="papagoinput_kor" class="">
		<input id='send_text' class='papago-page-btn' name='content' placeholder='한글'/> 
		<input id='result_text' class='papago-page-btn' name='content' placeholder='영어' readonly />
		<i class='fas fa-search search'  id='jsonConvertStringSend' title="번역"></i>
		</div>
		<div id="papagoinput_eng" class="hidden">
		<input id='send_text2' class='papago-page-btn' name='content' placeholder='영어' /> 
		<input id='result_text2' class='papago-page-btn' name='content' placeholder='한글' readonly />
		<i class='fas fa-search search'  id='jsonConvertStringSend2' title="번역"></i>
		</div>
	    <!-- <button class="submit" id="jsonConvertStringSend" type="button">번역</button> -->
	   
	</form>
	
	<!-- 우측 네비게이션 -->
	<ul  class="navbar-nav nav-right" >	
		<div class="avt dropdown" >
			<c:choose>
				<c:when test="${not empty sessionScope.userid}">	
					<img src="assets/img/user.png" alt="User image" class="login" data-toggle="user-menu">
				</c:when>
				<c:otherwise>
					<img src="assets/img/user.png" alt="User image" class="trigger" data-toggle="user-menu">
				</c:otherwise>
			</c:choose>
			<c:if test="${not empty sessionScope.userid}">
				<ul id="user-menu" class="dropdown-menu">
					<li  class="dropdown-menu-item">
						<a href="LogOut.go" class="dropdown-menu-link">
							<div>
								<i class="fas fa-sign-out-alt"></i>
							</div>
							<span>LogOut</span>
						</a>
					</li>
			</c:if>
		</div>
		
		<!-- 로그인 2020.11.14 수정(class user 추가 및 코드 위치 수정) 오정은-->
		<div class="user">
		<c:if test="${not empty sessionScope.userid}">
			<p>${sessionScope.userid}님 환영합니다.</p>
		</c:if>
		</div>
		<!-- //로그인 2020.11.14 수정-->
		<!-- //로그인 -->
	</ul>
	<!-- //우측 네비게이션 -->
</div>
<!-- //상위바 -->