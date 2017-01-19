<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/resources/css/table.css">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>비밀번호찾기</title>
</head>
<body>
<table class="type04">
<form action="researchPwd" method="post" >
<tr>
<td>
<input type="text" name="mem_id" placeholder="가입시 입력한 ID를 입력하세요" size="65">
</td>
</tr>
<tr>
<td>
<input type="email" name="mem_email" placeholder="가입시 입력한 이메일을 입력하세요" size="65">
</td>
</tr>
<tr>
<td align="center">
<input type="submit" value="찾기">
<a href="javascript:window.close()"><input type="button" value="닫기" /></a>
</td>
</tr>

</form>
</table>
</body>
</html>