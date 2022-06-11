<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="resources/css/insa.css" />
<article>
<div class="between"><div><a href="main">Pinosoft</a></div>
  <div><a href="main">Home</a>
  <a href="joinForm">Input</a>
  <a href="memberList">Search</a></div></div>


</br></br></br></br>
  
	<div class="between">
    <div></div><h1>인사관리시스템</h1><div></div></div>
   
   	<div class="between">
    <div></div>
    <form action="joinForm" name="memberJoinForm" method="post"
		id="memberJoinForm">
	<div id="home">		
		인사 정보 입력<input type="submit" value="입력" />
	</div>
	</form>
	<div></div>
	</div>
	
	
	<div class="between">
    <div></div>
	<form action="memberList" name="memberList" method="post"
		id="memberList">
	<div id="home">		
		인사 정보 조회<input type="submit" value="조회" />
	</div>			
	</form>
	<div></div>
	</div>
</article>
