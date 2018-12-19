<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="resources/css/table.css">

<title>보낸 쪽지함</title>
</head>
<body>
	<center>
		<br>
		<br>
		<br>
		<div class="center wow fadeInDown">
			<img src="resources/corlate/images/logo/mailboxlogo.png" width="100px"
				height="80px" />

			<h3>보낸편지함</h3>
		</div>


<form action="">
<table class="type09">
<thead>
<tr height="60px">
<th scope="cols" align="center"width="100px">받은 사람</th>
<th scope="cols" align="center" width="300">제목</th>
<th scope="cols" align="center" width="100px">보낸 시간</th>
<th scope="cols" align="center" width="100px">읽은 시간</th>
</tr>
</thead>
<c:forEach items="${memoSendList}" var="dto">

<tr>
<td td align="center">${dto.memo_receive_id}</td>
<td td align="center">${dto.memo_title}</td>
<td td align="center">${dto.memo_send_date}</td>
<td>

<c:if test="${dto.memo_open_date == null}">
읽지않음
</c:if>
${dto.memo_open_date}
</td>
</tr>

</c:forEach>
</table>
<br><br>
<a href="memoReceiveList">받은쪽지</a>&nbsp;&nbsp;&nbsp;<a href="memoSendList">보낸쪽지</a>&nbsp;&nbsp;&nbsp;<a href="memoSendForm">쪽지보내기</a>
</form>
<br><br><br>
</body>
</html>