	//번역을 위해서 button 이벤트를 위해서 사용하는 것
		$('#jsonConvertStringSend').click(function() {
			//번역할 object를 생성
			var test = {
				"original_str" : $("#send_text").val()
			};
			jsonSend(test);
		});

function jsonSend(test) {
$.ajax({
				type : "POST",
				url : "kor.papago",
				data : test, //json을 보내는 방법
				success : function(data) { //서블렛을 통한 결과 값을 받을 수 있습니다.
					console.log(data);
					//alert(data);

					//string의 값을 object 형식으로 변환합니다.
					var resulut_obj = JSON.parse(data);
					//결과값을 textarea에 넣기 위해서
					$("#result_text").val(
							resulut_obj.message.result.translatedText);
				},
				error : function(e) {
					console.log(e);
					alert('실패했습니다.');
				}
			});
		}
		
$('#jsonConvertStringSend2').click(function() {
	//번역할 object를 생성
	var test = {
		"original_str" : $("#send_text2").val()
	};
	jsonSend2(test);
});


function jsonSend2(test) {
$.ajax({
		type : "POST",
		url : "eng.papago",
		data : test, //json을 보내는 방법
		success : function(data) { //서블렛을 통한 결과 값을 받을 수 있습니다.
			console.log(data);
			//alert(data);

			//string의 값을 object 형식으로 변환합니다.
			var resulut_obj = JSON.parse(data);
			//결과값을 textarea에 넣기 위해서
			$("#result_text2").val(
					resulut_obj.message.result.translatedText);
		},
		error : function(e) {
			console.log(e);
			alert('실패했습니다.');
		}
	});
}

