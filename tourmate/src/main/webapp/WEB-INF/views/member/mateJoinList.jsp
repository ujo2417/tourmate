<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mate join list</title>
<link rel="stylesheet" href="/resources/css/table.css">
</head>
<body>
<br>
<center><img src="/resources/corlate/images/logo/matelogo.png" width="200px" height="180px" /></center>
<br><br>
	<table width="800" cellpadding="0" cellspacing="0" border="0" class="type09" align="center" style="margin-bottom:245px;">
		<tr>
			<th>번호</th>
			<th width="150">제목</th>
			<th>작성자</th>
			<th>모집인원</th>
			<th>날짜</th>
			<th>조회수</th>
			<th>수락 확인</th>
		</tr>
		<c:forEach items="${mate_list}" var="dto">
			<tr>
				<td>${dto.mate_num}</td>
				<td><a href="matecontentview?mate_num=${dto.mate_num}">${dto.mate_title}&nbsp; (${dto.mate_replynum})</a></td>
				<td>${dto.master_id }</td>
				<td>${dto.mate_present}/${dto.mate_max}</td>
				<td>${dto.mate_date}</td>
				<td>${dto.mate_readcount}</td>
				<td>
				<c:if test="${dto.mate_confirm == 1}">
				신청 완료
				</c:if>
				<c:if test="${dto.mate_confirm == 0}">
				수락 대기 중
				</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>