<%-- 회원가입 폼 요청 처리 결과를 출력할 View 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link type="text/css" href="resources/css/insa.css" rel="stylesheet" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> -->
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
	
	<form name="deleteForm" id="deleteForm" method="post" action="delete">
		<input type="hidden" name="sabun" value="${ domain.sabun }" />
		<input type="hidden" name="pageNum" value="${ pageNum }" />
		<input type="hidden" name="pageNum" value="${ domain.name1 }" />
	</form>
	<form action="update" name="updateForm" method="post"
		id="updateForm" enctype="multipart/form-data">		
		<!-- <div><input type="file" name="face"
					size="100" id="image" maxlength="70" value="사진올리기"/></div> -->
			<input type="hidden" name="sabun1" value="${ domain1.sabun }" />
			<input type="hidden" name="pageNum" value="${ pageNum }" />
			<input type="hidden" name="name2" value="${ domain1.name1 }" />
			<input type="hidden" name="joinGbnCode1" value="${ domain1.joinGbnCode }" />
			<input type="hidden" name="putYn1" value="${ domain1.putYn }" />
			<input type="hidden" name="jobType1" value="${ domain1.jobType }" />
			<input type="hidden" name="posGbnCode1" value="${ domain1.posGbnCode }" />
			<input type="hidden" name="joinDay1" value="${ domain1.joinDay }" />
			<input type="hidden" name="retireDay1" value="${ domain1.retireDay }" />
			<input type="hidden" name="searchOption" value="${ searchOption }" />
			<%-- <c:if test= " ${ searchOption } " >
<input type= "hidden"  name= "type"  value= " ${ type } "  />
<input type= "hidden"  name= "keyword"  value= " ${ keyword } "  />
</c:if> --%>
			
			<!-- test -->
			<div class="func">
				<div>
			<input type="button" id="update" value="수정" />
			<input type="button" id="delete" value="삭제" />
			<input type="button" id="back" value="이전화면" />
			</div>
			</div>
			
			<div class="justify">
			
			
			<div class="item first" style="text-align:center;">
			<div><div>증명사진</div>
			<c:if test="${ domain.profile1 != null }">
					<img id="preview-image" src="resources/upload/${ domain.profile1 }" style="width:180px; height:180px;">
					<div><input type="file" class="up" onchange="fileUpload()" name="profile2" id="profile2" value="${ domain.profile1 }" />
					<input type="text" class="up" onchange="fileUpload()" name="profile3" id="profile3" value="${ domain.profile1 }" />
						
					</div></c:if>
					<c:if test="${ domain.profile1 == null }"><img id="preview-image" src="img/no.jpg" style="width:180px; height:180px;">
						<input type="file" class="up" onchange="fileUpload()" name="profile2" size="70" id="profile2" maxlength="50" /></c:if>
					</div>
				</div>
				
				
				
				
			<div class="item third">
				<div class="between"><div>*사번</div>${ domain1.name1 }
					<input type="text" name="sabun" size="35"  id="sabun" value="${ domain.sabun }" readonly   style="background-color:#dcdcdc;" /></div>
				<div class="between"><div>*아이디</div>
					<input type="text" name="id1" size="23"  id="id1" value="${ domain.id1 }" style="height:30px; text-align:center;" /></div>
				<div class="between"><div>전화번호</div>
					<input type="text" name="phone" size="35"  id="phone" value="${ domain.phone }" /></div>
					<div class="between"><div>*이메일</div>
					<div><input type="text" name="email" size="7"  id="email" value="${ email }" style="height:30px; text-align:center;" />@
					<input type="text" name="emailDomain" id="emailDomain" size="6" value="${ emailDomain }" style="height:30px; text-align:center;" />
					<select name="selectDomain" id="selectDomain" style="width:80px; height:30px;">
						<option>직접입력</option>
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
					</select></div></div>
					<div class="between">
					<c:if test="${ domain.zip == 0 }">
					<input type="text" name="zip1" size="37"  id="zip1" value="" readonly style="background-color:#dcdcdc; height:30px;" /><input type="button" size="25" value="주소검색" id="btnZipcode" name="btnZipcode" style="height:30px;"/>
					</c:if>
					<c:if test="${ domain.zip != 0 }">
					<input type="text" name="zip1" size="37"  id="zip1" value="${ domain.zip }" readonly style="background-color:#dcdcdc; height:30px;"/><input type="button" size="25" value="주소검색" id="btnZipcode" name="btnZipcode" style="height:30px;" />
					</c:if>
					</div>
					
					<div class="between"><div>직위</div>
					<input type="hidden" name="wlrdnl" id="wlrdnl" value="${ domain.posGbnCode }" />
				<select name="posGbnCode" id="posGbnCode" style="width:270px; text-align:center;">
				
						<option value="선택">선택</option>
					<c:forEach var="p" items="${ pos }" varStatus="status">	
					
						<option value="${ p.gubun }${ p.code }">${ p.name }</option>
						
					
					</c:forEach>
					</select>
					</div>
					</div>
					
					
					
					
					
			<div class="item fifth">
				<div class="between"><div>*사원명</div>
					<input type="text" name="name1" size="30"  id="name1" value="${ domain.name1 }" style="text-align:center;" /></div>
				<div class="between"><div>*비밀번호</div>
					<input type="password" name="pwd" size="30"  id="pwd" value="${ domain.pwd }" readonly style="text-align:center;"/></div>
				<div class="between"><div>*휴대폰번호</div>
					<input type="text" name="hp" size="30"  id="hp" value="${ domain.hp }" /></div>
				<div class="between"><div>직종</div>
				<input type="hidden" name="wlrwhd" id="wlrwhd" value="${ domain.jobType }" />
				<select name="jobType" id="jobType" style="width:236px; text-align:center;">
						<option value="선택">선택</option>
					<c:forEach var="k" items="${ job }" varStatus="status">	
					
						<option value="${ k.gubun }${ k.code }">${ k.name }</option>
						
					
					</c:forEach>
					</select></div>
					<div class="between"><div>
					<input type="text" name="addr1" size="50"  id="addr1" value="${ domain.addr1 }" style="background-color:#dcdcdc; height:30px; text-align:center;" /></div></div>
				<div class="between"><div>부서</div>
				<input type="hidden" name="qntj" id="qntj" value="${ domain.deptCode }" />
				<select name="deptCode" id="deptCode" style="width:236px; text-align:center;">
						<option value="선택">선택</option>
					<c:forEach var="d" items="${ dept }" varStatus="status">	
					
						<option value="${ d.gubun }${d.code}">${ d.name }</option>
						
					
					</c:forEach>
					</select></div>
					</div>
					
					
					
				
			
			
			
			<div class="item seventh">
				<div class="between"><div>영문이름</div>
					<input type="text" name="engName" size="30"  id="engName" value="${ domain.engName }" style="text-align:center;" /></div>
				<div class="between"><div>비밀번호 확인</div>
					<input type="password" name="pwdck" size="28"  id="pwdck" maxlength="14" style="text-align:center;"/><div name = "confirmMsg" id="confirmMsg"></div></div>
				<div class="between"><div>*주민번호</div>
					<input type="text" name="regNo" size="30"  id="regNo" value="${ domain.regNo }" />
					<input type="hidden" name="hregNo" id="hregNo" data-reg="${ domain.regNo }" />
				<div class="between"><div>연령</div>
					<input type="text" name="years2" size="9"  id="years2" value="${ domain.years1 }" style="background-color:#dcdcdc; height:30px;" />	
					<div class="between">성별
					<input type="hidden" name="tjdquf" id="tjdquf" value="${ domain.sex }" />
					<select name="sex" id="sex" style="width:166px; height:30px; text-align:center;">
						<option value="선택">선택</option>
					<c:forEach var="g" items="${ gender }" varStatus="status">	
					
						<option value="${ g.gubun }${g.code}">${ g.name }</option>
						
					
					</c:forEach>
					</select></div></div>
					<div class="between"><div>주소2</div>
					<input type="text" name="addr2" size="30"  id="addr2" value="${ domain.addr2 }" style="text-align:center;" /></div>
					
				<div class="between"><div>연봉</div>
					<input type="text" name="salary" size="30"  id="salary" value="${ domain.salary }" /></div>	
				</div>
				</div>
				</div>
				
				<div class="justify">
				
				<div class="item second">
			<div class="between"><div>입사구분</div>
			<input type="hidden" name="dlqtkrnqns" id="dlqtkrnqns" value="${ domain.joinGbnCode }" />
				<select name="joinGbnCode" id="joinGbnCode" style="width:236px; text-align:center;">
						<option value="선택">선택</option>
					<c:forEach var="j" items="${ join }" varStatus="status">	
					
						<option value="${ j.gubun }${ j.code }">${ j.name }</option>
						
					
					</c:forEach>
					</select></div>	
				
				<div class="between"><div>군별</div>
				<input type="hidden" name="rnsquf" id="rnsquf" value="${ domain.milType }" />
						<select name="milType" id="milType"style="width:236px; text-align:center;">
							<option value="선택">선택</option>
							<c:forEach var="m" items="${ milType }" varStatus="status">
							<option value="${ m.gubun }${m.code}">${ m.name }</option>
							</c:forEach>
						</select>
					</div>
				<div class="between"><div>KOSA등록</div>
				<input type="hidden" name="zhtkemdfhr" id="zhtkemdfhr" value="${ domain.kosaRegYn }" />
						<select name="kosaRegYn" id="kosaRegYn" style="width:236px; text-align:center;">
							<option value="선택">선택</option>
						<c:forEach var="k" items="${ kosaYn }" varStatus="status">	
						
							<option value="${ k.gubun }${ k.code}">${ k.name }</option>
							
						
						</c:forEach>
						</select></div>
						<div class="between"><div>사업자번호</div>
					<input type="text" name="cmpRegNo" size="30"  id="cmpRegNo" maxlength="12" value="${ domain.cmpRegNo }" style="text-align:center;" /></div>
					<div class="between"><div>자기소개</div>
					<textarea name="selfIntro" size="100"  id="selfIntro" style="text-align: center; width:237px;"></textarea></div>
					
			</div>
			
			<div class="item fourth">
			<div class="between"><div>최종학력</div>
			<input type="hidden" name="chlwhdgkrfur" id="chlwhdgkrfur" value="${ domain.gartLevel }" />
				<select name="gartLevel" id="gartLevel" style="width:236px; text-align:center;">
						<option value="선택">선택</option>
					<c:forEach var="s" items="${ school }" varStatus="status">	
					
						<option value="${ s.gubun }${ s.code }">${ s.name }</option>
						
					
					</c:forEach>
					</select></div>
					<div class="between"><div>계급</div>
					<input type="hidden" name="rPrmqrmq" id="rPrmqrmq" value="${ domain.milLevel }" />
				<select name="milLevel" id="milLevel" style="width:236px; text-align:center;">
						<option value="선택">선택</option>
					<c:forEach var="g" items="${ grade }" varStatus="status">	
					
						<option value="${ g.gubun }${ g.code }">${ g.name }</option>
						
					
					</c:forEach>
					</select></div>
					<div class="between"><div>KOSA</div>
					<input type="hidden" id="zhtkemd" name="zhtkemd" value="${ domain.kosaClassCode }" />
				<select name="kosaClassCode" id="kosaClassCode" style="width:236px; text-align:center;">
						<option value="선택">선택</option>
					<c:forEach var="k" items="${ kosaGrade }" varStatus="status">	
					
						<option value="${ k.gubun }${ k.code }">${ k.name }</option>
						
					
					</c:forEach>
					</select></div>
					<div class="between"><div>사업체명</div>
					<input type="text" name="crmName" size="30"  id="crmName" value="${ domain.crmName }" style="text-align:center;" /></div>
			</div>
				
				
				
			
			<div class="item sixth">
			<div class="between"><div>투입여부</div>
			<input type="hidden" id="xndlq1" name="xndlq1" value="${ domain.putYn }" />
					<select name="putYn" id="putYn" style="width:236px; text-align:center;">
						<option value="선택">선택</option>
						
					<c:forEach var="y" items="${ yn }" varStatus="status">	
					
						<option value="${ y.gubun }${y.code}">${ y.name }</option>
						
					
					</c:forEach>
					</select></div>		
				<div class="between"><div>입영일</div>
					<input type="date" name="milStartdate" size="15"  id="milStartdate" value="${ domain.milStartdate }" style="width:236px;" /></div>
				<div class="between"><div>입사일</div>
					<input type="date" name="joinDay" size="15"  id="joinDay" value="${ domain.joinDay }" style="width:236px;" /></div>
				<div class="between"><div>사업자등록증</div>
				
				
					<input type="file" class="up" name="cmpRegImage1" size="15"  id="cmpRegImage1" value="${ domain.cmpRegImage }" style="width:236px;" />
					
					
					</div>
					
					
					
					
					
				<div class="between"><div>이력서</div>
				
				
					<input type="file" class="up" name="carrier1" size="15"  id="carrier1" style="width:236px;" />
					
					
					</div>					
					
			</div>
			
				<div class="item eight">
				<div class="between"><div>군필여부</div>
				<input type="hidden" id="rnsdu1" name="rnsdu1" value="${ domain.milYn }" />
					<select name="milYn" id="milYn" style="width:236px; text-align:center;">
						<option value="선택">선택</option>
					<c:forEach var="m" items="${ milYn }" varStatus="status">	
					
						<option value="${ m.gubun }${m.code}">${ m.name }</option>
						
					
					</c:forEach>
					</select></div>
					<div class="between"><div>전역일</div>
					
					<input type="date" name="milEnddate" size="15"  id="milEnddate" value="${ domain.milEnddate }"  style="width:236px;"/></div>
				<div class="between"><div>퇴사일</div>
					<input type="date" name="retireDay" size="15"  id="retireDay" value="${ domain.retireDay }"  style="width:236px;"/></div>
				
				
				
				<div><a href="#" data-toggle="modal" data-target="#myModal">미리보기</a>
					<div class="modal" id="myModal" data-keyboard="false" style="background-color:rgba(0,0,0,0.3); padding-top:50px;" >
					    <div class="modal-dialog modal-xl modal-dialog-centered">
					      <div class="modal-content" style="text-align:center;">
					      
					        <!-- Modal Header -->
					        <div class="modal-header">
					          
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					        </div>
					        
					        <!-- Modal body -->
					        <div class="modal-body">
					        <c:if test="${ not empty domain.cmpRegImage }">
					            <img id="modaltest" class="card-img-top rounded img-fluid" src="resources/upload/${ domain.cmpRegImage }">
					        </c:if>
					        <c:if test="${ empty domain.cmpRegImage }">
					           <img id="modaltest" class="card-img-top rounded img-fluid" src="img/no.jpg">
					        </c:if>
					        </div>
					        
					        <!-- Modal footer -->
					        <div class="modal-footer">
					          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					        </div>
					        
					      </div>
					    </div>
					</div><a href= "fileDownload?fileName=${ domain.cmpRegImage }" >등록증 다운로드</a></div>
				<div><a href="#" data-toggle="modal" data-target="#myModal1">미리보기</a>
					<div class="modal" id="myModal1" data-keyboard="false" style="background-color:rgba(0,0,0,0.3); padding-top:50px;" >
					    <div class="modal-dialog modal-xl modal-dialog-centered">
					      <div class="modal-content" style="text-align:center;">
					      
					        <!-- Modal Header -->
					        <div class="modal-header">
					          
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					        </div>
					        
					        <!-- Modal body -->
					        <div class="modal-body">
					        <c:if test="${not empty domain.carrier }">
					            <img id="modaltest2" class="card-img-top rounded img-fluid" src="resources/upload/${ domain.carrier }">
					        </c:if>
					        <c:if test="${ empty domain.carrier }">
					           <img id="modaltest2" class="card-img-top rounded img-fluid" src="img/no.jpg">
					        </c:if>
					        </div>
					        
					        <!-- Modal footer -->
					        <div class="modal-footer">
					          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					        </div>
					        
					      </div>
					    </div>
					</div><a href= "fileDownload?fileName=${ domain.carrier }" >이력서 다운로드</a></div>
				
			</div>
			
			</div>
			
			
			
		
			
			
	</form>		
	
</article>