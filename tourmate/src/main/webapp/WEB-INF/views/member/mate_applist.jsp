<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/table.css">

<script type="text/javascript">
	function popupOpen2() {
		window.opener.location.reload();
		window.close();
	}
</script>
</head>
<body>
	<c:if test="${flag == 1 }">
		<script>
			alertify.alert("정원이 초과되었습니다.")
		</script>
	</c:if>

	<br>
	<br>
	<h2 style="font-weight: bold; text-align: center;">신청현황</h2>
	<br>
	<c:if test="${!empty mateapplist}">
	<table border="0" align="center" class="type09">
		<tr>
			<th>ID</th>
			<th>정보</th>
			<th>&nbsp;</th>
			<th>&nbsp;</th>
		</tr>
	<c:forEach items="${ mateapplist }" var="list">
		<tr>
			
				<td>${list.mem_id }&nbsp;&nbsp;</td>
				<td><input type="button" value="상세 정보 보기"
					onclick="location.href='memberDetail?mem_id=${list.mem_id}' ">&nbsp;&nbsp;</td>
				<td><c:if test="${flag == 1 }">
						<input type="button" value="수락" disabled="disabled"
							onclick="location.href='mateappOk?mem_id=${list.mem_id}&mate_num=${list.mate_num}' ">
					</c:if> <c:if test="${flag != 1 }">
						<input type="button" value="수락"
							onclick="location.href='mateappOk?mem_id=${list.mem_id}&mate_num=${list.mate_num}' ">
					</c:if></td>
				<td><input type="button" value="거절"
					onclick="location.href='mateappNo?mem_id=${list.mem_id}&mate_num=${list.mate_num}' ">
				</td>
			
		</tr>
		</c:forEach>
		
	</table>
	</c:if>
	<center>	<a href="javascript:popupOpen2()"><input type="button"value="닫기"></a> </center>

</body>
</html>