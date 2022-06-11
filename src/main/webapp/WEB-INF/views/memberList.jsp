<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	
<table class="listTable"  style="width:1500px;">
	<tr>
		<td colspan="10" style="text-align:center;">
			<h2>직원 상세 정보</h2>
		</td>
	</tr>

	<tr>
		<td colspan="10">
			<form name="searchForm" id="searchForm" action="memberList">
			<%-- <input type="hidden" name="sabun" value="${ domain.sabun }" /> --%>
			<input type="hidden" name="pageNum" value="${ pageNum }" />
			
			<div class="justify" style="width:1500px;">
				<div class="item">
					<div class="between"><div>사번</div>
					<input type="text" name="sabun1" size="25"  id="sabun1" /></div>
				</div>
				<div class="item">
					<div class="between"><div>사원명</div>
					<input type="text" name="name2" size="25"  id="name2" style="text-align:center;" /></div>
				</div>
				<div class="item">
					<div class="between"><div>입사구분</div>
						<select name="joinGbnCode1" id="joinGbnCode" style="width:200px; text-align:center;">
							<option name="sel">선택</option>
							<c:forEach var="j" items="${ join }" varStatus="status">	
							<option value="${ j.gubun }${ j.code }" name="joinGbnCode" id="joinGbnCode">${ j.name }</option>
							</c:forEach>
						</select></div></div>
					
					<div class="item">
						<div class="between"><div>투입여부</div>
						<select name="putYn1" id="putYn1" style="width:200px; text-align:center;">
							<option name="sel">선택</option>
							<c:forEach var="y" items="${ yn }" varStatus="status">	
							<option value="${ y.gubun }${ y.code }" name="putYn1" id="putYn1">${ y.name }</option>
							</c:forEach>
						</select></div>
					</div>
					</div>
					
					
					
					
					
					
					
					
					
					
					<div class="justify" style="width:1498px;">
					
					<div class="item">
					<div class="between"><div>직위</div>
						<select name="posGbnCode1" id="posGbnCode1" style="width:200px; text-align:center;">
							<option name="sel">선택</option>
							<c:forEach var="p" items="${ pos }" varStatus="status">	
							<option value="${ p.gubun }${ p.code }" name="posGbnCode1" id="posGbnCode1">${ p.name }</option>
							</c:forEach>
						</select></div></div>
						
						<div class="item">
					<div class="between"><div>입사일</div>
					<input type="date" name="joinDay1" size="15"  id="joinDay1" minLength="10" style="width:200px;" /></div></div>
					
					<div class="item">
					<div class="between"><div>퇴사일</div>
					<input type="date" name="retireDay1" size="15"  id="retireDay1" style="width:200px;" /></div></div>
					
					<div class="item">
					<div class="between"><div>직종</div>
						<select name="jobType1" id="jobType1" style="width:200px; text-align:center;">
							<option name="sel">선택</option>
							<c:forEach var="j" items="${ job }" varStatus="status">	
							<option value="${ j.gubun }${ j.code }" name="jobType1" id="jobType1">${ j.name }</option>
							</c:forEach>
						</select>
					</div>
					</div>
					</div>
					
				
		
				<div style="text-align:right;"><input type="submit" name="search" id="search" value="검색" />
				<input type="button" value="선택삭제" class="btn btn-outline-info" onclick="deleteValue();" />
				<input type="reset" value="초기화" />
				<input type="button" id="back" value="이전화면" />
				</div>
	
			</form>
		</td>	
	</tr>
	

	<tr>
		<th style="width:2px;"><input id="allCheck" type="checkbox" name="allCheck" /></th>
		<th style="width:10px;">사번</th>
		<th style="width:10px;">사원명</th>
		<th style="width:10px;">주민번호</th>
		<th style="width:10px;">핸드폰번호</th>
		<th style="width:10px;">직위</th>
		<th style="width:10px;">입사일자</th>
		<th style="width:10px;">퇴사일자</th>
		<th style="width:10px;">투입여부</th>
		<th style="width:10px;">연봉 (만원)</th>
	</tr>


	<c:if test="${ searchOption and not empty memberList }">
	<c:forEach var="m" items="${ memberList }" varStatus="status">		
	<tr style="text-align:center;">
		<td style="width:10px;"><input type="checkbox" name="RowCheck" value="${ m.sabun }" /></td>
		<td>${ m.sabun  }</td>
		<td><a href="memberUpdateForm?sabun=${m.sabun }&sabun1=${ domain.sabun }&pageNum=${ currentPage }&name2=${domain.name1}&joinGbnCode1=${domain.joinGbnCode}&putYn1=${domain.putYn}&posGbnCode1=${domain.posGbnCode}&joinDay1=${domain.joinDay}&retireDay1=${domain.retireDay}&jobType1=${domain.jobType}">${ m.name1 }</a></td>
		<td>${ m.regNo }</td>
		<td>${ m.hp }</td>
		<c:if test="${ m.posGbnCode == '02001' }">
		<td>사원</td>
		</c:if>
		<c:if test="${ m.posGbnCode == '02002' }">
		<td>대리</td>
		</c:if>
		<c:if test="${ m.posGbnCode == '02003' }">
		<td>과장</td>
		</c:if>
		<c:if test="${ m.posGbnCode == '02004' }">
		<td>차장</td>
		</c:if>
		<c:if test="${ m.posGbnCode == '선택' }">
		<td>-</td>
		</c:if>
		<td>${ m.joinDay }</td>
		<td>${ m.retireDay }</td>
		<c:if test="${ m.putYn == '05001' }">
		<td>Y</td>
		</c:if>
		<c:if test="${ m.putYn == '05002' }">
		<td>N</td>
		</c:if>
		<c:if test="${ m.putYn == '선택' }">
		<td>-</td>
		</c:if>
		<td>${ m.salary }</td>
		
	</tr>
	</c:forEach>
	<tr style="text-align:center">
	<td colspan="10">
	<c:if test= "${ startPage > pageGroup }" >
			<a href= "memberList?pageNum=${ startPage - pageGroup }&type=${ type }&keyword=${ keyword }" >[이전]</a>
	</c:if>
			<c:forEach var= "i"  begin= "${ startPage }"  end= "${ endPage }">
				<c:if test= "${ i == currentPage }" > [ ${ i } ]
				</c:if>
				<c:if test= "${ i != currentPage }" >
				<a href= "memberList?pageNum=${ i }&sabun1=${domain.sabun}&name2=${domain.name1}&joinGbnCode1=${domain.joinGbnCode}&putYn1=${domain.putYn}&posGbnCode1=${domain.posGbnCode}&joinDay1=${domain.joinDay}&retireDay1=${domain.retireDay}&jobType1=${domain.jobType}">[ ${ i } ]</a>
				</c:if>
			</c:forEach>
			<c:if test= "${ endPage < pageCount }" >
			<a href= "memberList?pageNum=${ startPage + pageGroup }&type=${ type }&keyword=${ keyword }">[다음]</a>
			</c:if>
			</td>
	</tr>
	</c:if>
	
	<%-- <fmt:parseDate value="${ m.joinDay }" var="parsejDay" pattern="yy-MM-dd" /> --%>
		<%-- <fmt:formatDate value="${ m.joinDay }" pattern="yyyy-MM-dd" /> --%>
	<c:if test="${ not searchOption and not empty memberList }">
	<c:forEach var="m" items="${ memberList }" varStatus="status">		
	<tr style="text-align:center;">
		
		<td style="width:10px;"><input type="checkbox" name="RowCheck" value="${ m.sabun }" /></td>
		<td style="width:100px;">${ m.sabun  }</td>
		<td style="width:100px;"><a href="memberUpdateForm?sabun=${ m.sabun }&pageNum=${ currentPage }">${ m.name1 }</a></td>
		<td style="width:100px;">${ m.regNo }</td>
		<td style="width:100px;">${ m.hp }</td>
		
		<c:if test="${ m.posGbnCode == '02001' }">
		<td style="width:100px;">사원</td>
		</c:if>
		<c:if test="${ m.posGbnCode == '02002' }">
		<td style="width:100px;">대리</td>
		</c:if>
		<c:if test="${ m.posGbnCode == '02003' }">
		<td style="width:100px;">과장</td>
		</c:if>
		<c:if test="${ m.posGbnCode == '02004' }">
		<td style="width:100px;">차장</td>
		</c:if>
		<c:if test="${ m.posGbnCode == '선택' }">
		<td style="width:100px;">-</td>
		</c:if>
		
		
		
		
		<td style="width:100px;">${ m.joinDay }</td>
		<td style="width:100px;">${ m.retireDay }
		</td>
		
		
		
		<c:if test="${ m.putYn == '05001' }">
		<td style="width:100px;">Y</td>
		</c:if>
		<c:if test="${ m.putYn == '05002' }">
		<td style="width:100px;">N</td>
		</c:if>
		<c:if test="${ m.putYn == '선택' }">
		<td style="width:100px;">-</td>
		</c:if>
		<td style="width:100px;">${ m.salary }</td>
		
		
	</tr>
	</c:forEach>
	
	<tr style="text-align:center">
	<td colspan="10">
	<c:if test= "${ startPage > pageGroup }" >
			<a href= "memberList?pageNum= ${ startPage - pageGroup }" >[이전]</a>
	</c:if>
			<c:forEach var= "i"  begin= "${ startPage }"  end= "${ endPage }" >
				<c:if test= "${ i == currentPage }" > [ ${ i } ]
				</c:if>
				<c:if test= "${ i != currentPage }" >
				<a href= "memberList?pageNum=${ i }" >[ ${ i } ]</a>
				</c:if>
			</c:forEach>
			<c:if test= "${ endPage < pageCount }" >
			<a href= "memberList?pageNum=${ startPage + pageGroup }">[다음]</a>
			</c:if>
			</td>
			</tr>
	</c:if>
<c:if test ="${empty memberList }">
	<tr>
			<td colspan="5" class="asdasd">게시글이 존재하지 않습니다.</td>
		</tr>
	</c:if>

</table>
</article>



