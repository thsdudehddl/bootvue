$(function() {
	
	var chkObj = document.getElementsByName("RowCheck");
	var rowCnt = chkObj.length;
	
	$("input[name='allCheck']").click(function(){
		var chk_listArr = $("input[name='RowCheck']");
		for (var i =0; i < chk_listArr.length; i++){
			chk_listArr[i].checked = this.checked;
		}
	});
	
	$("input[name='RowCheck']").click(function(){
		
		if($("input[name='RowCheck']:checked").length == rowCnt){
				$("input[name='allCheck']")[0].checked = true;
			
		} else {
				$("input[name='allCheck']")[0].checked = false;
		}
		
	});
	
	
	console.log("체크박스 선택완료");
	

	
});

	
	//아이디 중복체크
	function fn_idChk() {
	var id = $("#id1").val();
		$.ajax({
			url : "idChk",
			type : "POST",
			data : "id1=" + id,
			success : function(data) {
			console.log("data");
				if(data != 0) {
				
					alert("중복된 아이디입니다.");
					$("#id1").val("");
				}
			}
		})
	}	



//선택박스 체크
	
	function deleteValue() {
		
		var url = "ajaxDelete";
		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		for(var i = 0; i < list.length; i++) {
			
			if(list[i].checked){
				valueArr.push(list[i].value);
			}
			
		}
		if(valueArr.length == 0){
			
			alert("선택사항이 없습니다.");
			
		} else {
			
			var chk = confirm("정말 삭제하시겠습니까?");
			$.ajax({
			url : url,
			type : 'POST',
			traditional : true,
			data : {
					valueArr : valueArr
					},
			success: function(jdata){
					console.log("엥" + jdata);
				if(jdata = 1) {
					alert("삭제성공");
					location.replace("memberList")
				}else {
				 alert("삭제실패");
			}	
		
		}
		});
	
	}
	}
	
	

