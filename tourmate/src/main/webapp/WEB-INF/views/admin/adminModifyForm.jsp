<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script language="JavaScript">

function checkIt() {
	
   var userinput = eval("document.userinput");
   var phone = /^[0-9]{3,4}$/;
	
	
   if (phone.test(document.getElementById("telnumber").value) != true) {
		alertify.alert('휴대폰 번호가 잘못되었습니다');
		return false;
	}
	if (phone.test(document.getElementById("telnumber2").value) != true) {
		alertify.alert('휴대폰 번호가 잘못되었습니다');
		return false;
	}
   if (!userinput.mem_pwd.value) {
      alertify.alert("비밀번호를 입력하세요");
      return false;
   }
   if (userinput.mem_pwd.value != userinput.mem_pwd2.value) {
      alertify.alert("비밀번호를 동일하게 입력하세요");
      return false;
   }

   if (!userinput.mem_name.value) {
      alertify.alert("사용자 이름을 입력하세요");
      return false;
   }
   if (!userinput.mem_phone.value || !userinput.mem_phone2.value || !userinput.mem_phone3.value){
	   alertify.alert("휴대폰 번호를 입력하세요")
	   return false;
   }
   
   if (!userinput.mem_address.value){
	   alertify.alert("주소를 입력하세요")
	   return false;
   }
   
}

</script>
<body bgcolor="${bodyback_c}">
<h3 align="center">Modify</h3>
<form action="adminModifyOk" method="post" name="userinput" onsubmit="return checkIt()">
	<table border="0" >
		<tr>
			<td>ID</td>
			<td colspan="2"><input type="text" name="mem_id"  value="${adminList.mem_id }" readonly="readonly"></td>
			
		</tr>
		<tr>
			<td>비밀번호</td>
			<td colspan="2"><input type="password" name="mem_pwd" value="${adminList.mem_pwd }"></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td colspan="2"><input type="password" name="mem_pwd2"  value="${adminList.mem_pwd }"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td colspan="2"><input type="text" name="mem_name" value="${adminList.mem_name }"></td>
		</tr>
		<tr>
			<td>사진</td>
			<td colspan="2"><input type="text" name="mem_pic" value="${adminList.mem_pic }"></td>
		</tr>
		<tr>
			<td>연락처</td>
			<td colspan="1">
			<select name="mem_phone" >
				<option value="010">010</option>
				<option value="011">011</option>
			</select>
			-<input type="text" name="mem_phone2" id="telnumber" value="${adminList.mem_phone2 }">-<input type="text" name="mem_phone3" id="telnumber2" value="${adminList.mem_phone3 }">
			</td>
			
		</tr>
		<tr>
			<td>주소</td>
			<td colspan="3">
			<select  name="mem_area" value="${adminList.mem_area }">
				<option value="경기">경기도</option>
				<option value="강원">강원도</option>
				<option value="충청">충청도</option>
				<option value="대전">대전</option>
				<option value="경북">경상북도</option>
				<option value="경남">경상남도</option>
				<option value="대구">대구</option>
				<option value="전북">전라북도</option>
				<option value="전남">전라남도</option>
				<option value="광주">광주</option>
				<option value="부산">부산</option>
				<option value="울산">울산</option>
			</select>
			<input type="text" name="mem_address" value="${adminList.mem_address }">
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td colspan="3">
			<select name="mem_sex" value="${ adminList.mem_sex }">
				<option value="남">남</option>
				<option value="여">여</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>E-mail</td>
			<td><input type="email" name="mem_email" value="${adminList.mem_email }"></td>
		</tr>
		<tr>
			<td><input type="submit" value="save"></td>
			<td><input type="reset" value="cancel"></td>
		</tr>
	</table>
</form>
  
</body>
</html>