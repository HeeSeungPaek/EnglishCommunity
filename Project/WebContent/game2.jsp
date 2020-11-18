<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/game2.css">
<style type="text/css">

</style>
<script src="assets/js/game2.js" defer>
    </script>
</head>
<body class="game">
 <div class='container word_' id="main">
    <div class="word_board">
      <ul id="box_1" class="word_box">
      <li id="R" class="word_item" draggable="true"><i>R</i></li>
      </ul>

      <ul id="box_2" class="word_box">
      <li id="T" class="word_item" draggable="true"><i>T</i></li>
      </ul>
    
      <ul id="box_3" class="word_box">
        <li id="N" class="word_item" draggable="true"><i>N</i></li>
      </ul>
   
      <ul id="box_4" class="word_box">
        <li id="E" class="word_item" draggable="true"><i>E</i></li>
      </ul>
    
      <ul id="box_5" class="word_box">
        <li id="U" class="word_item" draggable="true"><i>U</i></li>
      </ul>
      
      <ul id="box_6" class="word_box">
        <li id="I" class="word_item" draggable="true"><i>I</i></li>
      </ul>
 
      <ul id="box_7" class="word_box">
        <li id="L" class="word_item" draggable="true"><i>L</i></li>
      </ul>
     
      <ul id="box_8" class="word_box">
        <li id="V" class="word_item" draggable="true"><i>V</i></li>
      </ul>
   
      <ul id="box_9" class="word_box">
        <li id="O" class="word_item" draggable="true"><i>O</i></li>
      </ul>
      
      <ul id="box_10" class="word_box">
        <li id="O" class="word_item" draggable="true"><i>O</i></li>
      </ul>
    </div>
    <H3 class="h3">오늘의 단어</H3>
    <ul style="padding-left: 0px;" class="result"><i class="result">혁명</i></ul>
    <div id="answer" class="answer_board">
      <div id="answer_inner" class="answer_inner">
        <ul id="R" class="word_answer" ></ul>
        <ul id="E" class="word_answer" ></ul>
        <ul id="V" class="word_answer" ></ul>
        <ul id="O" class="word_answer" ></ul>
        <ul id="L" class="word_answer" ></ul>
        <ul id="U" class="word_answer" ></ul>
        <ul id="T" class="word_answer" ></ul>
        <ul id="I" class="word_answer" ></ul>
        <ul id="O" class="word_answer" ></ul>
        <ul id="N" class="word_answer" ></ul>
     
      
      
      </div>
    </div>
  </div>
  <div id="message"></div>
</body>

</html>