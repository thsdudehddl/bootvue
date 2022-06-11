<%-- 회원가입 폼 요청 처리 결과를 출력할 View 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    <link type="text/css" href="resources/css/insa.css" rel="stylesheet" />
    <script src=
"https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 
	새로운 5자리 우편번호로 회원 주소를 입력 받기 위해 daum.net에서
	제공하는 우편번호 찾기 API를 사용하였다.
	참고 사이트 : http://postcode.map.daum.net/guide
-->    
<!-- <script src=
"https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>   -->  
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/formcheck.js"></script>
<script src="resources/js/insa.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"> -->
<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/insa.css" />

<article>
	
	
	
	<div class="between"><div><a href="main">Pinosoft</a></div>
  <div><a href="main">Home</a>
  <a href="joinForm">Input</a>
  <a href="memberList">Search</a></div></div>
	
	<form action="joinProcess" name="memberJoinForm" method="post"
		id="memberJoinForm" enctype="multipart/form-data">		
		<!-- <div><input type="file" name="face"
					size="100" id="image" maxlength="70" value="사진올리기"/></div> -->
		
			
			
			<!-- test -->
			
			<div class="func">
				<div>
					<input type="submit" value="등록" />
					<input type="reset" value="초기화" />
					<input type="button" id="back" value="이전화면" />
				</div>
			</div>			
			<div class="justify">
			
				<div class="item first" style="text-align:center;">
					<div><img id="preview-image" src="img/no.jpg" style="width:180px; height:180px;">
						<input type="file" class="up" onchange="fileUpload()" name="profile2" size="70" id="profile2" maxlength="50" />
					</div>
					</div>
					
				
				
				
				
				
				
			<div class="item third">
				<div class="between"><div>*사번</div>
					<input type="text" size="35"  id="sabun" readonly placeholder="자동생성"  style="background-color:#dcdcdc;" /></div>
				<div class="between"><div>*아이디</div>
					<div><input type="text" name="id1" size="23"  id="id1" style="height:30px; text-align: center;"/>
					<button class="idChk" type="button" name="idChk" id="idChk" onclick="fn_idChk();" value="N" style="height:30px;" >중복확인</button></div></div>
				<div class="between"><div>전화번호</div>
					<input type="text" name="phone" size="35"  id="phone" maxlength="12" /></div>
				<div class="between"><div>*이메일</div>
					<div><input type="text" name="email" size="7"  id="email" style="height:30px; text-align: center;" />@
					<input type="text" name="emailDomain" id="emailDomain" size="6"  style="background-color:#dcdcdc; height:30px; text-align: center;" />
					<select name="selectDomain" id="selectDomain" style="width:80px; height:30px;">
						<option>직접입력</option>
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
					</select></div></div>
					
					<div class="between">
					<input type="text" name="zip1" size="37"  id="zip1" placeholder="우편번호" readonly  style="background-color:#dcdcdc; height:30px; text-align: right;" /><input type="button" value="주소검색" size="25" id="btnZipcode" name="btnZipcode" style="height:30px;" /></div>
					
					
					<div class="between"><div>직위</div>
				<select name="posGbnCode" id="posGbnCode" style="width:270px; text-align:center;">
						<option>선택</option>
					<c:forEach var="p" items="${ pos }" varStatus="status">	
					
						<option value="${ p.gubun }${ p.code }" name="posGbnCode" id="posGbnCode">${ p.name }</option>
						
					
					</c:forEach>
					</select></div>
					
				</div>
				
				
				
				
			<div class="item fifth">
				<div class="between"><div>*사원명</div>
					<input type="text" name="name1" size="30"  id="name1" style="text-align: center;"/></div>
				<div class="between"><div>*비밀번호</div>
					<input type="password" name="pwd" size="30"  id="pwd" style="text-align: center;" /></div>
				<div class="between"><div>*휴대폰번호</div>
					<input type="text" name="hp" size="30"  id="hp" maxlength="13"/></div>
					<div class="between">
					<div>직종</div>
				<select name="jobType" id="jobType" style="width:236px; text-align:center;">
						<option>선택</option>
					<c:forEach var="k" items="${ job }" varStatus="status">	
					
						<option value="${ k.gubun }${ k.code }" name="jobType" id="jobType">${ k.name }</option>
						
					
					</c:forEach>
					</select>
					</div>
					
				<div class="between"><div>
					<input type="text" name="addr1" size="50"  id="addr1" placeholder="주소" readonly  style="background-color:#dcdcdc; height:30px; text-align: center;" /></div></div>
						
				
				<div class="between"><div>부서</div>
				<select name="deptCode" id="deptCode" style="width:236px; text-align:center;">
						<option>선택</option>
					<c:forEach var="d" items="${ dept }" varStatus="status">	
					
						<option value="${ d.gubun }${d.code}" name="deptCode" id="deptCode">${ d.name }</option>
						
					
					</c:forEach>
					</select></div>
					</div>
					
					
			
			
			<div class="item seventh">
				<div class="between"><div>영문이름</div>
					<input type="text" name="engName" size="30"  id="engName" style="text-align: center;" /></div>
				<div class="between"><div>비밀번호 확인</div>
					<input type="password" name="pwdck" size="28"  id="pwdck" maxlength="14" style="text-align: center;"/><div name = "confirmMsg" id="confirmMsg"></div></div>
				<div class="between"><div>*주민번호</div>
					<input type="text" name="regNo" size=30  id="regNo" maxlength="14"/>
					<input type="hidden" name="hregNo" id="hregNo" data-reg="" />
					</div>
					
					<div class="between">
					<div>연령</div>
					<input type="text" name="years2" size="9"  id="years2" placeholder="자동생성"  style="background-color:#dcdcdc; width:106px; height:30px;" />
					<div class="between">성별<div></div>
					<select name="sex" id="sex" style="width:156px; height:30px; text-align:center;">
						<option>선택</option>
					<c:forEach var="g" items="${ gender }" varStatus="status">	
					
						<option value="${ g.gubun }${g.code}" name="sex" id="sex">${ g.name }</option>
						
					
					</c:forEach>
					</select></div></div>
					<div class="between"><div>주소2</div>
					<input type="text" name="addr2" size="30"  id="addr2" placeholder="세부주소" style="text-align: center;" /></div>
				<div class="between"><div>연봉</div>
					<input type="text" name="salary1" size="30"  id="salary" /></div>	
				</div>
				
				
				
				
				
			</div>
			<div class="justify">
			
			
			
			
			
			
			<div class="item second">
					<div class="between"><div>입사구분</div>
						<select name="joinGbnCode" id="joinGbnCode" style="width:236px; text-align:center;">
							<option>선택</option>
							<c:forEach var="j" items="${ join }" varStatus="status">	
							<option value="${ j.gubun }${ j.code }" name="joinGbnCode" id="joinGbnCode">${ j.name }</option>
							</c:forEach>
						</select>
					</div>
					<div class="between"><div>군별</div>
						<select name="milType" id="milType" style="width:236px; text-align:center;">
							<option>선택</option>
							<c:forEach var="m" items="${ milType }" varStatus="status">
							<option value="${ m.gubun }${m.code}" name="milType" id="milType">${ m.name }</option>
							</c:forEach>
						</select>
					</div>
					
						<div class="between"><div>KOSA등록</div>
						<select name="kosaRegYn" id="kosaRegYn" style="width:236px; text-align:center;">
							<option>선택</option>
						<c:forEach var="k" items="${ kosaYn }" varStatus="status">	
						
							<option value="${ k.gubun }${ k.code}" name="kosaRegYn" id="kosaRegYn">${ k.name }</option>
							
						
						</c:forEach>
						</select></div>
						<div class="between"><div>사업자번호</div>
						<input type="text" name="cmpRegNo" size="30"  id="cmpRegNo" maxlength="12"/></div>
						<div class="between"><div>자기소개</div>
						<textarea name="selfIntro" size="100"  id="selfIntro" style="text-align: center; width:237px;"></textarea></div>
						
				</div>
			
			
			
			
			
			<div class="item fourth">
					<div class="between"><div>최종학력</div>
				<select name="gartLevel" id="gartLevel" style="width:236px; text-align:center;">
						<option>선택</option>
					<c:forEach var="s" items="${ school }" varStatus="status">	
					
						<option value="${ s.gubun }${ s.code }" name="gartLevel" id="gartLevel">${ s.name }</option>
						
					
					</c:forEach>
					</select></div>
					
					<div class="between"><div>계급</div>
				<select name="milLevel" id="milLevel" style="width:236px; text-align:center;">
						<option>선택</option>
					<c:forEach var="g" items="${ grade }" varStatus="status">	
					
						<option value="${ g.gubun }${ g.code }" name="milLevel" id="milLevel">${ g.name }</option>
						
					
					</c:forEach>
					</select></div>
					
					<div class="between"><div>KOSA</div>
				<select name="kosaClassCode" id="kosaClassCode" style="width:236px; text-align:center;">
						<option>선택</option>
					<c:forEach var="k" items="${ kosaGrade }" varStatus="status">	
					
						<option value="${ k.gubun }${ k.code }" name="kosaClassCode" id="kosaClassCode">${ k.name }</option>
						
					
					</c:forEach>
					</select></div>
					<div class="between"><div>사업체명</div>
					<input type="text" name="crmName" size="30"  id="crmName" style="text-align:center;" /></div>
			</div>
			
			
			
			
			<div class="item sixth">
				<div class="between"><div>투입여부</div>
					<select name="putYn" id="putYn" style="width:236px; text-align:center;">
						<option>선택</option>
					<c:forEach var="y" items="${ yn }" varStatus="status">	
					
						<option value="${ y.gubun }${y.code}" name="putYn" id="putYn">${ y.name }</option>
						
					
					</c:forEach>
					</select></div>
				<div class="between"><div>입영일</div>
					<input type="date" name="milStartdate" size="30"  id="milStartdate" title="dates" max="9999-12-31" style="width:236px;" /></div>
				<div class="between"><div>*입사일</div>
					<input type="date" name="joinDay" size="30"  id="joinDay" title="dates" max="9999-12-31" data-format="yyyy-mm-dd" style="width:236px;" /></div>
				<div class="between"><div>사업자등록증</div>
					</div>
				
				<div class="between"><div>이력서</div>
					</div>		
							
			</div>
			
			
			<div class="item eight">
					<div class="between"><div>군필여부</div>
					<select name="milYn" id="milYn" style="width:236px;">
						<option>선택</option>
					<c:forEach var="m" items="${ milYn }" varStatus="status">	
					
						<option value="${ m.gubun }${m.code}" name="milYn" id="milYn">${ m.name }</option>
						
					
					</c:forEach>
					</select></div>
				<div class="between"><div>전역일</div>
					<input type="date" name="milEnddate" size="15"  id="milEnddate" title="dates" max="9999-12-31" style="width:236px;" /></div>
				<div class="between"><div>퇴사일</div>
					<input type="date" name="retireDay" size="15"  id="retireDay" title="dates" max="9999-12-31" style="width:236px;" /></div>
				<div class="between">
				<a href="#" data-toggle="modal" data-target="#myModal">미리보기</a>
				
					<div class="modal" id="myModal" data-keyboard="false" style="background-color:rgba(0,0,0,0.3); padding-top:50px;" >
					    
					      <div class="modal-content" style="text-align:center;" >
					      
					        <!-- Modal Header -->
					        <div class="modal-header">
					          
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					        </div>
					        
					        <!-- Modal body -->
					        <div class="modal-body">
					            <img id="modaltest" class="card-img-top rounded img-fluid" src="img/no.jpg">
					        </div>
					        
					        <!-- Modal footer -->
					        <div class="modal-footer">
					          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					        </div>
					        
					      </div>
					    
					</div>
					
					<input type="file" class="up" onchange="fileUpload()" name="cmpRegImage1" size="70" id="cmpRegImage1" maxlength="50" value="등록증 업로드"  style="text-align:center;" />
					</div>
					
					
					<div class="between">
					<a href="#" data-toggle="modal" data-target="#myModal1">미리보기</a>
					
					<div class="modal" id="myModal1" data-keyboard="false" style="background-color:rgba(0,0,0,0.3); padding-top:50px;" >
					    <div class="modal-dialog modal-xl modal-dialog-centered">
					      <div class="modal-content" style="text-align:center;">
					      
					        <!-- Modal Header -->
					        <div class="modal-header">
					          
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					        </div>
					        
					        <!-- Modal body -->
					        <div class="modal-body">
					            
					            
					            	<img id="modaltest2" class="card-img-top rounded img-fluid" src="img/no.jpg">
					            
					           
					        </div>
					        
					        <!-- Modal footer -->
					        <div class="modal-footer">
					          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					        </div>
					        
					      </div>
					    </div>
					</div>
					
					<input type="file" class="up" onchange="fileUpload()" name="carrier1" size="70" id="carrier1" maxlength="50" value="이력서 업로드" />
					<!-- <input type="text" name="carrier1" size="10"  id="carrier1" disabled="disabled" maxlength="1" value="파일 선택" />
					<label for="upload_file" style="border : solid 1px black;">이력서 사진 업로드</label>
					<input type="file" id="upload_file" accept="image/*" required=true style="position:absolute; clip:rect(0, 0, 0, 0);" /></div> -->
					</div>
			</div>
			
			
			</div>
			
			
			
			
			
	</form>	
	
</article>