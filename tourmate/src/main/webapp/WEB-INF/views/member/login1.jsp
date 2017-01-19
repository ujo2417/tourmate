<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
$(document).ready(function () {
	$('#delete').click(function(){
		var con = confirm("정말로 탈퇴하시겠습니까?");
		if(con==true){
			return true;
		} else{
			return false;
		}
	});
});

</script>

<script language="javascript">
	
     <!--
       function begin(){
         document.myform.mem_id.focus();
       }
       function checkIt(){
         if(!document.myform.mem_id.value){
           alertify.alert("아이디를 입력하지 않으셨습니다.");
           document.myform.mem_id.focus();
           return false;
         }
         if(!document.myform.mem_pwd.value){
           alertify.alert("비밀번호를 입력하지 않으셨습니다.");
           document.myform.mem_pwd.focus();
           return false;
         }
         
       }
     -->
   </script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<title>Insert title here</title>
</head>
<body>
	<c:if test="${empty sessionScope.mem_id}">

		<table cellSpacing=1 cellPadding=1 width="260" border=1 align="center">
			<TR height="30" weigth="50">
				<TD colspan="2" align="middle" bgcolor="${title_c}"><STRONG>회원로그인</STRONG></TD>
			</TR>
			<tr height="30">
				<form name="myform" method="post" action="login" onsubmit="return checkIt()">
					<td width="110" bgcolor="${title_c}" align=center>아이디</td>
					<td width="150" bgcolor="${value_c}" align=center><input
						type="text" name="mem_id" size="15" maxlength="10"></td>
			</tr>
			<tr height="30">

				<td width="110" bgcolor="${title_c}" align=center>패스워드</td>
				<td width="150" bgcolor="${value_c}" align=center><input
					type="password" name="mem_pwd" size="15" maxlength="10"></td>
			</tr>
			<tr height="30">
				<td colspan="3" bgcolor="${title_c}" align="center"><input
					type="submit" name="Submit" value="로그인" > <input
					type="button" value="회원가입"
					onclick="document.location.href='joinForm'">
					<input type="button" value="아이디찾기" onclick="document.location.href='researchIdForm'">
					<input type="button" value="비밀번호 찾기" onclick="document.location.href='researchPwdForm'">
					
					</td>
				</form>
			</tr>
		</table>
	</c:if>

	<c:if test="${!empty sessionScope.mem_id}">
		<table width=500 cellpadding="0" cellspacing="0" align="center"
			border="1">
			<tr>


				<td rowspan="3" bgcolor="${value_c}" align="center">
					${sessionScope.mem_id}님이 <br> 방문하셨습니다
					<form method="post" action="logout">
						<input type="submit" value="로그아웃"> 
					</form>
					<form method="post" action="modifyForm">
						<input type="hidden" name="mem_id" value="${sessionScope.mem_id }">
							<input type="submit" value="정보수정">
					</form>
					<form method="post" action="memberDelete" >
						<input type="hidden" name="mem_id" value="${sessionScope.mem_id }">
							<input type="submit" value="회원탈퇴" id="delete">
					</form>
					2초후이동
					            <meta http-equiv="Refresh" content="0;url=index">
				</td>
			</tr>

		</table>
		<br>
	</c:if>
	<!-- 
	<form action="login" name="myform" method="post" onSubmit="return checkIt()">
		id<input type="text" name="mem_id">
		pwd<input type="password" name="mem_pwd">
		<input type="submit" value="전송" >
		<input type="button" value="회원가입" onClick="location.href='joinform'">
	</form> -->
</body>
</html>