$(document).ready(function() {
	$("#memberJoinForm").on("submit", function() {
		if($("#id1").val().length <= 0) {
			alert("아이디가 입력되지 않았습니다.\n아이디를 입력해주세요.");
			$("#id1").focus();
			return false;
		}
		if($("#name1").val().length <= 0) {
			alert("이름이 입력되지 않았습니다.\n이름을 입력해주세요.");
			$("#name1").focus();
			return false;
		}
		if($("#pwd").val().length <= 0) {
			alert("패스워드가 입력되지 않았습니다.\n패스워드를 입력해주세요.");
			$("#pwd").focus();
			return false;
		}
		if($("#pwdck").val().length <= 0) {
			alert("패스워드확인이 입력되지 않았습니다.\n패스워드확인을 입력해주세요.");
			$("#pwdck").focus();
			return false;
		}
		
		if($("#hp").val().length <= 0) {
			alert("휴대폰번호가 입력되지 않았습니다.\n휴대폰번호를 입력해주세요.");
			$("#hp").focus();
			return false;
		}
		if($("#regNo").val().length <= 0) {
			alert("주민등록번호가 입력되지 않았습니다.\n주민등록번호를 입력해주세요.");
			$("#regNo").focus();
			return false;
		}
		if($("#email").val().length <= 0) {
			alert("이메일을 입력되지 않았습니다.\n이메일을 입력해주세요.");
			$("#email").focus();
			return false;
		}
		if($("#emailDomain").val().length <= 0) {
			alert("이메일을 입력되지 않았습니다.\n이메일을 입력해주세요.");
			$("#emailDomain").focus();
			return false;
		}
		if($("#joinDay").val().length <= 0) {
			alert("입사일이 입력되지 않았습니다.\n입사일을 입력해주세요.");
			$("#joinDay").focus();
			return false;
		}
		
		
		const sal = $("#salary").val();
		const regex = /[^0-9]/g;				// 숫자가 아닌 문자열을 매칭하는 정규식
		const result = sal.replace(regex, "");	// 원래 문자열에서 숫자가 아닌 모든 문자열을 빈 문자로 변경
		$("#salary").val(result);
		
				
		
		
		if(confirm("정말 등록하시겠습니까?") == true) {
			
		} else {
			return false;
		}		
		
		
	}); //등록
	console.log("ㅣ낭러;ㅣㄴㅇ");
	$("#searchForm").on("submit", function() {
	console.log("나오나");
		console.log("날짜" + $("#joinDay1").getFullYear());
		
		
	}); //검색할때
	
	
	
	
	
	var selec = "";
	$("option[name='sel']").val(selec);
	
	
	
	
	$("#update").on("click", function() {
	
		if($("#id1").val().length <= 0) {
			alert("아이디가 입력되지 않았습니다.\n아이디를 입력해주세요.");
			$("#id1").focus();
			return false;
		}
		if($("#name1").val().length <= 0) {
			alert("이름이 입력되지 않았습니다.\n이름을 입력해주세요.");
			$("#name1").focus();
			return false;
		}
		if($("#pwd").val().length <= 0) {
			alert("패스워드가 입력되지 않았습니다.\n패스워드를 입력해주세요.");
			$("#pwd").focus();
			return false;
		}
		if($("#pwdck").val().length <= 0) {
			alert("패스워드확인이 입력되지 않았습니다.\n패스워드확인을 입력해주세요.");
			$("#pwdck").focus();
			return false;
		}
		if($("#hp").val().length <= 0) {
			alert("휴대폰번호가 입력되지 않았습니다.\n휴대폰번호를 입력해주세요.");
			$("#hp").focus();
			return false;
		}
		if($("#regNo").val().length <= 0) {
			alert("주민등록번호가 입력되지 않았습니다.\n주민등록번호를 입력해주세요.");
			$("#regNo").focus();
			return false;
		}
		if($("#email").val().length <= 0) {
			alert("이메일을 입력되지 않았습니다.\n이메일을 입력해주세요.");
			$("#email").focus();
			return false;
		}
		if($("#emailDomain").val().length <= 0) {
			alert("이메일을 입력되지 않았습니다.\n이메일을 입력해주세요.");
			$("#emailDomain").focus();
			return false;
		}
		if($("#joinDay").val().length <= 0) {
			alert("입사일이 입력되지 않았습니다.\n입사일을 입력해주세요.");
			$("#joinDay").focus();
			return false;
		}
		var rkwk = $("#xndlq").val();
	
	if(rkwk == "05001") {
		$("#xndlq").text("Y");
	} else if(xn == "05002") {
		$("#xndlq").text("N");
	}
	
	const sal = $("#salary").val();
		const regex = /[^0-9]/g;				// 숫자가 아닌 문자열을 매칭하는 정규식
		const result = sal.replace(regex, "");	// 원래 문자열에서 숫자가 아닌 모든 문자열을 빈 문자로 변경
		$("#salary").val(result);
	
		
		
	
	
	
	
	
	
		
		if(confirm("정말 수정하시겠습니까?") == true) {
		
			var hr = $("#hregNo").attr("data-reg");
			$("#regNo").val(hr);
			$("#updateForm").submit();
		} else {
			return false;
		}		
	
		
		
		
		
	});//수정
	
	$("#regNo").on("change", function() {	
		var rr = $("#regNo").val();
		$("#hregNo").attr("data-reg", rr);
	});
	
	
	$("#delete").on("click", function(){
		if($("#pwdck").val().length <= 0) {
			alert("패스워드가 입력되지 않았습니다.\n패스워드를 입력해주세요.");
			$("#pwdck").focus();
			return false;
		}
		
		if(confirm("정말 삭제하시겠습니까?") == true) {
			$("#deleteForm").submit();
		} else {
			return false;
		}		
		console.log("1");
		
		
	});
	
	//var dat = $("#joinDay").val();
		//var datt = dat.substring(0, 9);
		//$("#joinDay").val(datt);
	
	$("#back").on("click", function(){
		history.back();
	});
	
	$("#email").on("keyup", function() {		
		// 아래와 같이 정규표현식을 이용해 영문 대소문자, 숫자만 입력되었는지 체크할 수 있다. 
		var regExp = /[^A-Za-z0-9]+$/;
		if(regExp.test($(this).val())) {
			alert("영문과 숫자만 입력할 수 있습니다.");
			$(this).val($(this).val().replace(regExp, ""));
		}
	});

	
	$("#engName").on("keyup", function() {		
		// 아래와 같이 정규표현식을 이용해 영문 대소문자, 숫자만 입력되었는지 체크할 수 있다. 
		var regExp = /[^A-Za-z]/gi;	
		if(regExp.test($(this).val())) {
			alert("영문만 입력할 수 있습니다.");
			$(this).val($(this).val().replace(regExp, ""));
		}
	});
	
	$("#name1").on("keyup", function() {		
		// 아래와 같이 정규표현식을 이용해 영문 대소문자, 숫자만 입력되었는지 체크할 수 있다. 
		var regExp = /[^ㄱ-힣]/gi;	
		if(regExp.test($(this).val())) {
			alert("한글만 입력할 수 있습니다.");
			$(this).val($(this).val().replace(regExp, ""));
		}
	});

	$("#salary").on("change", function() {	
		var won = "원";	
		const sal = $("#salary").val();
		const sal1 = sal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$("#salary").val(sal1 + won);
	});
	
	if($("#profile3").val() != null) {
	var prof = $("#profile3").val();
	var profi = prof.split("_")[1];
	$("#profile3").val(profi);
	console.log("워메" + $("#profile3").val());
	}
	console.log("잉" + $("#cmpRegImage2").val());
	if($("#cmpRegImage2").val() != null) {
	var cmps = $("#cmpRegImage2").val();
	var cmpss = cmps.split("_")[1];
	$("#cmpRegImage2").val(cmpss);
	}
	console.log("워메" + $("#cmpRegImage2").val());
	if($("#carrier2").val() != null) {
	var car = $("#carrier2").val();
	var carr = car.split("_")[1];
	$("#carrier2").val(carr);
	}
	console.log("워메" + $("#carrier2").val());
	
	
	
	$("#selectDomain").on("change", function() {
		var str = $(this).val();
		
		if(str == "직접입력") {
			$("#emailDomain").val("");
			$("#emailDomain").prop("readonly", false);
		} else if(str == "naver.com") {
			$("#emailDomain").val("naver.com");
			$("#emailDomain").prop("readonly", true);
		} else if(str == "daum.net") {
			$("#emailDomain").val("daum.net");
			$("#emailDomain").prop("readonly", true);
		} else if(str == "gmail.com") {
			$("#emailDomain").val("gmail.com");
			$("#emailDomain").prop("readonly", true);
		}
	});
	//마스킹
	
	$("#regNo").on("focusout", function() {
		
		var first = $("#regNo").val().split("-")[0];
		var second =$("#regNo").val().split("-")[1].replace(/(?<=.{1})./gi,"*");
		comp= first+"-"+second;
		
		$("#regNo").val(comp);
	});
	
	
	//마스킹 빼기
	$("#regNo").on("keyup", function() {		
		const reg = $("#regNo").val();
		regNoo = reg.replace(/(\d{6})(\d{7})/g, '$1-$2');
		$("#hregNo").val(regNoo);
		regNo = reg.replace(/-/g, '').replace(/(\d{6})(\d{7})/g, '$1-$2');
		$("#regNo").val(regNo);
	});
	
	//$("#phone").on("keyup", function() {		
	//	const phon = $("#phone").val();
	//	phone = phon.replace(/-/g, '');
	//	$("#phone").val(phone);
	//});
	
	$("#cmpRegNo").on("keyup", function() {		
		const cmp = $("#cmpRegNo").val();
		cmpRegNo = cmp.replace(/-/g, '').replace(/(\d{3})(\d{2})(\d{5})/g, '$1-$2-$3');
		$("#cmpRegNo").val(cmpRegNo);
	});
	
	$("#hp").on("keyup", function() {		
		const hpa = $("#hp").val();
		hp = hpa.replace(/-/g, '').replace(/(\d{3})(\d{4})(\d{4})/g, '$1-$2-$3');
		$("#hp").val(hp);
	});
	$("#phone").on("keyup", function() {		
		const hpb = $("#phone").val();
		phone = hpb.replace(/-/g, '').replace(/(\d{3})(\d{3})(\d{4})/g, '$1-$2-$3');
		$("#phone").val(phone);
	});
	
	
	

	$("#regNo").on("focusout", function() {
		var gen = $("#regNo").val();
		var gend = gen.substring(7, 8);
		
		
		if(gend == "1" || gend == "3") {
			$("#sex").val("11001");
			
			
		} else if(gend == "2" || gend == "4") {
			$("#sex").val("11002");
		} else {
			alert("뒷자리 첫번째를 확인해주세요.");
			$("#regNo").val("");
		}
	});
	
	$("#regNo").on("focusout", function() {
		var ag = $("#regNo").val();
		var age = ag.substring(7, 8);
		var now = new Date();
		var year = now.getFullYear();
		
		if(age == "1" || age == "2") {
			var my = "19" + ag.substring(0, 2);
			
			$("#years2").val(year - my + 1);
		} else {
			
			var my = "20" + ag.substring(0, 2);
			console.log(my);
			$("#years2").val(year - my + 1);
		}
		
	});
	
	//투입여부
	var xn = $("#xndlq1").val();
	var sd = $("#putYn option[value='05001']").val();
	$("#putYn option[value='"+ xn +"']").attr("selected", true);
	
	//코사등급
	var zh = $("#zhtkemd").val();
	$("#kosaClassCode option[value='"+ zh +"']").attr("selected", true);
	
	
	//군필여부
	var rnsdu = $("#rnsdu1").val();
	$("#milYn option[value='"+ rnsdu +"']").attr("selected", true);
	
	//직위
	var wlr = $("#wlrdnl").val();
	$("#posGbnCode option[value='"+ wlr +"']").attr("selected", true);
	
	//직종
	var whd = $("#wlrwhd").val();
	$("#jobType option[value='"+ whd +"']").attr("selected", true);
	
	//부서
	var qntjtj = $("#qntj").val();
	$("#deptCode option[value='"+ qntjtj +"']").attr("selected", true);
	
	//성별
	var tjdqufquf = $("#tjdquf").val();
	$("#sex option[value='"+ tjdqufquf +"']").attr("selected", true);
	
	//입사구분
	var dlqtkrn = $("#dlqtkrnqns").val();
	$("#joinGbnCode option[value='"+ dlqtkrn +"']").attr("selected", true);
	
	//군별
	var rnsqufquf = $("#rnsquf").val();
	$("#milType option[value='"+ rnsqufquf +"']").attr("selected", true);
	
	//코사등록여부
	var zhtkemdfhrfhr = $("#zhtkemdfhr").val();
	$("#kosaRegYn option[value='"+ zhtkemdfhrfhr +"']").attr("selected", true);
	
	//최종학력
	var chlwhdgkrfurfur = $("#chlwhdgkrfur").val();
	$("#gartLevel option[value='"+ chlwhdgkrfurfur +"']").attr("selected", true);

	//계급
	var rPrmqdl = $("#rPrmqrmq").val();
	$("#milLevel option[value='"+ rPrmqdl +"']").attr("selected", true);
	
	
	
	
	
	
	var du = $("#xndlqduqn").text();
	
	if(du == "05001") {
		$("#xndlqduqn").text("Y");
	} else if(du == "선택") {
		$("#xndlqduqn").text("");
	}
	var cu = $("#wlrdnldl").text();
	
	if(cu == "02001") {
		$("#wlrdnldl").text("사원");
	} else if(cu == "02002") {
		$("#wlrdnldl").text("대리");
	} else if(cu == "02003") {
		$("#wlrdnldl").text("과장");
	}else if(cu == "02004") {
		$("#wlrdnldl").text("차장");
	} else {
		$("#wlrdnldl").text("");
	}
	
	
	
	
	$("#milYn").on("change", function() {
		
		if($("#milYn").val() == "12002") {
			$("#milType").prop("disabled", true);
			$("#milLevel").prop("disabled", true);
			$("#milStartdate").prop("disabled", true);
			$("#milEnddate").prop("disabled", true);
			$("#milType").val("");
			$("#milLevel").val("");
			$("#milStartdate").val("");
			$("#milEnddate").val("");
		} else {
			$("#milType").val("선택");
			$("#milLevel").val("선택");
			$("#milType").prop("disabled", false);
			$("#milLevel").prop("disabled", false);
			$("#milStartdate").prop("disabled", false);
			$("#milEnddate").prop("disabled", false);
		}
	});
	
	
	$("#milEnddate").on("change", function() {
		var startt = $("#milStartdate").val();
		var endd = $("#milEnddate").val();
		if(startt > endd){
			alert("전역일이 입영일보다 빠를 수 없습니다.");
			$("#milEnddate").val("");
		}
	});
	//var fileInput = document.getElementsById("carrier1");
	//$("#pr").on("click", function() {
		//if(fileInput == null) {
		//	return false;
	//	}
	//});
	
	
	$("#retireDay").on("change", function() {
		var join = $("#joinDay").val();
		var retire = $("#retireDay").val();
		if(join > retire){
			alert("퇴사일이 입사일보다 빠를 수 없습니다.");
			$("#retireDay").val("");
		}
	});
	
	$("#kosaRegYn").on("change", function() {
		
		if($("#kosaRegYn").val() == "07002") {
			$("#kosaClassCode").prop("disabled", true);
			$("#kosaClassCode").val("");
		} else {
			$("#kosaClassCode").val("선택");
			
			$("#kosaClassCode").prop("disabled", false);
		}
	});
	
	$("#pwdck").on("focusout", function() {
	var password = $("#pwd").val();
	var passwordCheck = $("#pwdck").val();
	
	if(password == passwordCheck) {
		
		$("#confirmMsg").text("비밀번호 일치");
		
	} else {
		$("#confirmMsg").text("비밀번호 불일치");
		$("#pwdck").val("");
	}
	
	});
	
	
	
	console.log("파일목록" + profile2);
	document.getElementById("profile2").files;

	$("#btnZipcode").click(findZipcode);
	
	
	/*$('input[title="dates"]').datepicker({
		dataformat: 'yy-mm-dd'
	});*/
	
	
	/*$("#regNo").on("focusout", function() {
	console.log($("#regNo").val());
		var regex = "(\\d{6})([- 　\\t\\n\\x0B\\f\\r])[1234]\\d{6}";
		var result = $("#regNo").replaceAll(regex,"$1$2*******");
		console.log(result);
		$("#regNo").val(result);
		
	});*/
	
	
	
	
	
	function readImage(input) {
		if(input.files && input.files[0]) {
			const reader = new FileReader();
			reader.onload = (e) => {
				const previewImage = document.getElementById("preview-image");
				previewImage.src = e.target.result;
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	document.getElementById("profile2").addEventListener("change", (e) => {
		readImage(e.target);
	})
	
	function readImage1(input) {
		if(input.files && input.files[0]) {
			const reader = new FileReader();
			reader.onload = (e) => {
				const previewImage1 = document.getElementById("modaltest");
				previewImage1.src = e.target.result;
				
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	document.getElementById("cmpRegImage1").addEventListener("change", (e) => {
		console.log("sdfasdf");
		readImage1(e.target);
		
	})
	
	
	function readImage2(input) {
		if(input.files && input.files[0]) {
			const reader = new FileReader();
			reader.onload = (e) => {
				const previewImage2 = document.getElementById("modaltest2");
				previewImage2.src = e.target.result;
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	document.getElementById("carrier1").addEventListener("change", (e) => {
		readImage2(e.target);
		
	})
	
	
	
		function fileUpload(){
		var fileInput1 = document.getElementsByClassName("up");
		
		for( var i=0; i<fileInput1.length; i++ ){
			if( fileInput1[i].files.length > 0 ){
				for( var j = 0; j < fileInput1[i].files.length; j++ ){
					console.log(fileInput1[i].files[j].name); // 파일명 출력
				}
			}
			console.log(fileInput1[0].files[0].name);
		}
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});
	

	

	//zip
	function findZipcode() {
		new daum.Postcode({
			oncomplete: function(data) {
	
		var addr = '';
		var extraAddr = '';
	
		if (data.userSelectedType === 'R') {
			addr = data.roadAddress;
		} else { 
			addr = data.roadAddress;
	
		}
	
		if(data.userSelectedType === 'R'){
	
		if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			extraAddr += data.bname;
		}
	
		if(data.buildingName !== '' && data.apartment === 'Y'){
			extraAddr += (extraAddr !== '' ?
			', ' + data.buildingName : data.buildingName);
		}
	
		if(extraAddr !== ''){
			extraAddr = ' (' + extraAddr + ')';
		}
	
			addr += extraAddr;
		}
	
		$("#zip1").val(data.zonecode);
		$("#addr1").val(addr);
	
		$("#addr2").focus();
		}
		}).open();
	
	}
	
	
	
	window.onload = function(){
    	var au = $("#dlqtkdlftl").text();
	if(au != "") {
		var al = $("#dlqtkdlftl").text();
		var sl = al.substring(0, 10);
		$("#dlqtkdlftl").text(sl);
	}	
	
    }
	//입사일 초 지우기
	
	