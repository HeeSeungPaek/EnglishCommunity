
			$(document).ready(function(){
			$('#papagobutton').click(function(){
				$('#papagoinput_kor').toggleClass('hidden');
				$('#papagoinput_eng').toggleClass('hidden');
				document.getElementById("send_text2").value="";
				document.getElementById("result_text2").value="";
				document.getElementById("send_text").value="";
				document.getElementById("result_text").value="";
				})							
			})