<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쪽지 보내기 form</title>
<link rel="stylesheet" href="/resources/css/table.css">

<script type="text/javascript">
function AjaxEx(){
	
var confirm_id = "confirm_id="+document.userinput.memo_receive_id.value;

$.ajax({
	
	url : "/memoConfirmId",
	type : "post",
	data : confirm_id,
	dataType : "json",
	success : function(data) {
		var encode = decodeURIComponent(data);
		document.getElementById("result").innerHTML = encode;
		
		},
		
	error : function(request) {
	
		alert("fail");
		
	}
});
}
</script>

<script>
function checkForm() {
	
	if(!userinput.memo_receive_id.value){
	
		alertify.alert("보낼 아이디를 입력하세요");
		document.userinput.memo_receive_id.focus();
		exit;
	}
	if(!userinput.memo_title.value){
	
		alertify.alert("제목 입력하세요");
		document.userinput.memo_title.focus();
		exit;
	}
	if(!userinput.memo_content.value){
	
		alertify.alert("내용을 입력하세요");
		document.userinput.memo_content.focus();
		exit;
	}
	
	alertify.confirm("쪽지를 보내시겠습니까?.", function (e) {
		
		if (e) {
			alertify.success("전송완료");
			
			setTimeout(function()
					{
				
				document.userinput.submit();

					}, 1000);
		
		} else {
			alertify.error("취소");
			return false;
		}
	});

}

</script>
</head>
<body>

<center>

		<br>
		<div class="center wow fadeInDown">
			<img src="/resources/corlate/images/logo/writelogo.png" width="200px"
				height="180px" />

		</div>
<form action="memoSend" name="userinput">		
<table class="type04_1">
<tr>
<th scope="row">보내는사람</th>
<td><input type="text" size="23" name="memo_send_id" value="${ sessionScope.mem_id }" readonly="readonly"/></td>
</tr>
<tr>
<th scope="row">받는사람</th>
<td><input type="text" id="memo_receive_id" name="memo_receive_id" size="23" oninput="AjaxEx()"/></td>
<div id="result" name="result"></div>
</tr>
<tr>
<th scope="row">제목</th>
<td><input type="text" name="memo_title" size="23"/></td>
</tr>
<tr>
<td align="center" colspan="2"><textarea name="memo_content" cols="38" rows="8"></textarea></td>
</tr>

<tr align="center">
<td colspan="2"> <input type="button" width="60px" height="30px" value="쪽지보내기" onclick="checkForm()"></td>
</tr>
</table>
<a href="memoReceiveList">받은쪽지</a>&nbsp;&nbsp;&nbsp;<a href="memoSendList">보낸쪽지</a>&nbsp;&nbsp;&nbsp;<a href="memoSendForm">쪽지보내기</a>
</form>
</center>
</body>
</html>