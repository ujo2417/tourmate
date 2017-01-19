<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="/resources/css/table.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>member detail</title>

</head>
<body>
<center>
	<form action="joinOk" method="post" name="userinput" enctype="multipart/form-data"	onsubmit="return checkIt()">
		<table class="type06_3">
				<tr>
				<th rowspan="3"><img src="resources/memberPic/${dto.mem_pic}" width="150" height="100"/>
				</th>
				
				<td>
     		  	ID : ${dto.mem_id }
				</td>
			</tr>
			<tr>
				<td> 이름 : ${dto.mem_name }</td>
			</tr>
		
			<tr>
				<td> ${dto.mem_phone }&nbsp;-&nbsp;${dto.mem_phone2 }&nbsp;-&nbsp;${dto.mem_phone3 } </td>
			</tr>
			<tr>
				<th>지역</th>
				<td>${dto.mem_area}</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${dto.mem_sex }</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>${dto.mem_birth }</td>
			</tr>

			<tr>
				<th>E-mail</th>
				<td>${dto.mem_email }</td>
			</tr>
			<tr>
			
				
				<th colspan="2">
					<a href="javascript:history.go(-1)"><input type="button" value="뒤로가기" /></a>
					<a href="javascript:window.close()"><input type="button" value="닫기" /></a>
				</th>
			</tr>
		</table>
	</form>
	</center>
</body>
</html>