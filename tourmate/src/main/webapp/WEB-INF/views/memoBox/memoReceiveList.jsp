<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="resources/css/table.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>받은 쪽지함</title>

<script type="text/javascript">
function checkForm() {
		
	alertify.confirm("쪽지를 삭제하시겠습니까?.", function (e) {
		
		if (e) {
			alertify.success("삭제완료");

			setTimeout(function(){
				document.memoReceiveDel.submit();
					}, 1000);
			    exit;
		
		} else {
			alertify.error("취소");

		}
	});
}
</script>

</head>
<body>
	<center>
		<br>
		<br>
		<br>
		<div class="center wow fadeInDown">
			<img src="resources/corlate/images/logo/mailboxlogo.png" width="100px"
				height="80px" />

			<h3>읽지않음(${memoReceiveCount })</h3>
		</div>

<form action="memoReceiveDel" name="memoReceiveDel">

	<table class="type09">


			<thead>
				<tr>
				<tr height="60px">
					<th scope="cols" align="center" width="100">보낸사람</th>
					<th scope="cols" align="center" width="300">제목</th>
					<th scope="cols" align="center" width="100">보낸시간</th>
					<th scope="cols" align="center" width="100">읽은시간</th>
					<th scope="cols" align="center" width="100">쪽지삭제</th>
				</tr>
			</thead>
			<c:forEach items="${memoReceiveList}" var="dto">

				<tr>
					<td align="center"><a href="memoReceiveContent?memo_num=${dto.memo_num}">
					${dto.memo_send_id}</a></td>
					<td align="center"><a href="memoReceiveContent?memo_num=${dto.memo_num}">${dto.memo_title}</a></td>
					<td align="center"><a href="memoReceiveContent?memo_num=${dto.memo_num}">${dto.memo_send_date}</a></td>
					<td align="center"><c:if test="${dto.memo_open_date == null}">
							<a href="memoReceiveContent?memo_num=${dto.memo_num}">읽지않음</a>
						</c:if> ${dto.memo_open_date}</td>


						<input type="hidden" name="memo_num" value="${dto.memo_num}">
						<td><input type=button value="쪽지삭제" style="margin-left: 20px" onclick="checkForm();"></td>
				
				</tr>

			</c:forEach>


	</table>	
</form>
	
	
		<br><br>
		<a href="memoReceiveList">받은쪽지</a>&nbsp;&nbsp;&nbsp;<a href="memoSendList">보낸쪽지&nbsp;&nbsp;&nbsp;</a><a
			href="memoSendForm">쪽지보내기</a>
	</center>
	<br><br><br>
</body>
</html>