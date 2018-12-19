<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="resources/css/table.css">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>

<body>
	<center>
			<br>
		<br>
		<br>
		<div class="center wow fadeInDown">
			<img src="resources/corlate/images/logo/mailboxlogo.png" width="100px"
				height="80px" />
		</div>
	
		<table class="type05">
			<tr>
				<th scope="row" class="even">보낸사람</th>
				<td class="even">${memoReceiveContent.memo_send_id}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${memoReceiveContent.memo_title}</td>
			</tr>
			<tr>
				<td colspan="2" class="even" height="200px">${memoReceiveContent.memo_content}</td>
			</tr>
			<tr>
				<th>발신시간</th>
				<td>${memoReceiveContent.memo_send_date}</td>
			</tr>
		</table>
		<a href="memoReceiveList">받은쪽지</a>&nbsp;&nbsp;&nbsp;<a href="memoSendList">보낸쪽지</a>&nbsp;&nbsp;&nbsp;<a
			href="memoSendForm">쪽지보내기</a>
	</center>
</body>
</html>