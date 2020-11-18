/*	
파일명: BoardWriteCheck.js
설명: 게시판 글작성시 정규표현식 및 유효성 검사
작성일: 2020-11-14
작성자: 도재구
*/

$(function() {
	$('#boardform').attr('onsubmit', 'return boardWriteCheck()');

	/*
	// ID 중복 유무 비동기로 확인하는 함수
	$("#contentTitle").keyup(function() {
			$.ajax({
				url : "CheckId",
				type : "POST",
				dataType : "html",
				data : {
					data : $(this).val()
				},
				success : function(responsedata) {
					if (responsedata == "true") {
						$('#guide').empty();
						$('#guide').text("이미 존재하는 아이디입니다.");
						$('#guide').css({
							"color":"red",
							"font-size":"12px"
						});
						totalCheck = false;
					}else if($('#userid').val() == ''){
						$('#guide').empty();
						$('#guide').text("사용하실 아이디를 입력해주세요.");
						$('#guide').css({
							"color":"green",
							"font-size":"12px"
						});
						totalCheck = false;
					}else if(Validate($('#userid')) == false){
						$('#guide').empty();
						$('#guide').text("30자 이내로 입력해주세요");
						$('#guide').css({
							"color":"red",
							"font-size":"12px"
						});
						totalCheck = false;
					}else {
						$('#guide').empty();
						$('#guide').text("사용 가능한 Id입니다.");
						$('#guide').css({
							"color":"green",
							"font-size":"12px"
						});
						totalCheck = true;
					}
				}
			});
		});
		*/
});

const Validate = function(targetEle) {
	let checkFlag = false;
	let regex = "";

	switch (targetEle.prop("id")) {
		case "contentTitle":
			regex = /^.{1,30}$/; //모든 글자 1글자 이상 30글자 이하
			break;
		case "summernote":
			regex = /^.{1,30}$/;
			break;
	}
	if (regex.test(targetEle.val())) {
		checkFlag = true;
	}
	return checkFlag;
}

const boardWriteCheck = function() {
	console.log("check2");
	let submitFlag = false;

	if ($('#contentTitle').val() == '' ||
		$('#contentTitle').val() == null) {
		swal("제목을 입력해주세요.", "공백은 허용되지 않습니다.", "error");

	} else if (!Validate($('#contentTitle'))) {
		swal("제목을 다시 입력해주세요.", "최대길이 30자 입니다", "error");

	} else if ($('#summernote').val() == '' ||
		$('#summernote').val() == null) {
		swal("글 내용을 작성해주세요.", "공백은 허용되지 않습니다.", "error");

	} else if (!Validate('#summernote')) { 
		swal("글 내용을 다시 입력해 주세요.", "최대길이 600자 입니다.", "error");

	} else if (totalCheck) {
		submitFlag = true;
	}
	return submitFlag;
}
