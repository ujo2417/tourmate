<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${matemem }" var="matemem">
${matemem.mem_id }&nbsp;&nbsp;<input type="button" value="상세 정보 보기" onclick="location.href='memberDetail?mem_id=${matemem.mem_id}' " >&nbsp;&nbsp;
	<c:if test="${matemem.mem_id == sessionScope.mem_id }">
		<c:if test="${mem_id != sessionScope.mem_id }">
			<input type="button" value="탈퇴" onclick="location.href='matedrop?mem_id=${matemem.mem_id}&mate_num=${matemem.mate_num }&writer_id=${mem_id }' ">
		</c:if>
	</c:if> 
	
	<c:if test="${mem_id == sessionScope.mem_id }">
		<c:if test="${matemem.mem_id != sessionScope.mem_id }">
			<input type="button" value="추방" onclick="location.href='mateexile?mem_id=${matemem.mem_id}&mate_num=${matemem.mate_num }&writer_id=${mem_id }' ">
		</c:if>
	</c:if>
	<br>
</c:forEach>
<%-- <a href="matecontentview?mate_num=${matemem.mate_num }">뒤로가기</a> --%>
<input type="button" value="뒤로가기" onclick="location.href='matecontentview?mate_num=${mate_num }'">
</body>
</html>