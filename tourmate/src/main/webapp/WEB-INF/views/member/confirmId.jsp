<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<script language="javascript">
<!--
  function setid()
    {		
    	opener.document.userinput.mem_id.value="${mem_id}";
		self.close();
	}
-->
</script>
<head>

</head>

<title>ID 중복확인</title>

<body>
<center>
<c:if test="${check == 1}"> 
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr> 
    <td height="39">${mem_id} 는 이미 사용중인 아이디입니다.</td>
  </tr>
</table>
<form name="checkForm" method="post" action="confirmId">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td align="center"> 
       다른 아이디를 선택하세요.<p>
       <input type="text" size="10" maxlength="12" name="mem_id"> 
       <input type="submit" value="ID중복확인">
    </td>
  </tr>
</table>
</form>
</c:if>
<c:if test="${check == -1}"> 
<form name="checkFormOk" method="post" action="joinForm">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <t> 
    <td align="center"> 
    	<input type="hidden" name="mem_id" value="${mem_id }"/>
    	<input type="hidden" name="check" value="${check }"/>
      <p>입력하신 ${mem_id} 는 사용하실 수 있는 ID입니다. </p>
      <input type="submit" value="닫기" onclick="setid()">
    </td>
  </tr>
</table>
</form>
</c:if>
</center>
</body>
</html>

