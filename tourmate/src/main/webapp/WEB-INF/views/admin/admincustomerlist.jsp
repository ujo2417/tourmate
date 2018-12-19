<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
	function deleteCheck(){
	       	if( confirm("정말로 회원을 삭제하시겠습니까?") == true){
				return true;
			}else{
				return false;
			}
	}
</script>
</head>
<body>
<h3>admin 회원관리 게시판</h3>
<table border="1" width="100%">
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>등급</td>
			<td>가입날짜</td>
			<td>성별</td>
			<td>생년월일</td>
			<td>연락처</td>
			<td>이메일</td>2
			<td>주소</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
		<c:forEach  var="adminList" items="${adminList}">
		<tr>
			<td>${adminList.mem_id }</td>
			<td>${adminList.mem_pwd }</td>
			<td>${adminList.mem_name }</td>
			<td>${adminList.mem_grade }</td>
			<td>${adminList.mem_date }</td>
			<td>${adminList.mem_sex }</td>
			<td>${adminList.mem_birth}</td>
			<td>${adminList.mem_phone}${adminList.mem_phone2}${adminList.mem_phone3 }</td>
			<td>${adminList.mem_email }</td>
			<td>${adminList.mem_area}${adminList.mem_address}</td>
		<td>
		
		
		<form action="adminmodifyForm" method="post">		
			<input type="hidden" name="mem_id" value="${adminList.mem_id}">
			<input type="submit" value="modify">
		</form>
		
		</td>
		<td>
		<form action="adminmemberDelete" method="post" onsubmit="return deleteCheck();">
				<input type="hidden" name="mem_id" value="${adminList.mem_id }">
				<input type="hidden" name="mem_pwd" value="${adminList.mem_pwd }">
				<input type="submit" value="delete">
		</form>
		</td>
		</tr>
		</c:forEach>	
		
		</table>
		
</body>
</html>