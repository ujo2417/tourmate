<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ı� �Խ��� �� ����������</title>
<link rel="stylesheet" href="resources/css/table.css">
</head>
<body>
<br><center>
<img src="resources/corlate/images/logo/epiloguelogo.png" width="200px" height="180px" />
</center><br><br>
<table border="0" align="center" style="text-align: center;margin-bottom:180px;">
	<tr>
	  <td>
		<table border="0" class="type09" width="500px">
			<tr>
				<td colspan="4" align="center" style="font-size:16px;color: navy;font-weight: bold;">${mem_id}�� �Խñ�</td>
			</tr>
			
			
			<tr>
				
				<th>�۹�ȣ</th>
				<th>�ۼ���</th>
				<th>����</th>
				<th>��¥</th>
			</tr>
			<c:forEach items="${memberview_user}" var="udto">
			<tr>
			
				<td>${udto.user_num}</td>
				<td>${udto.mem_id}</td>
				<td><a href="usercontentview?user_num=${udto.user_num}">${udto.user_title}</a></td>
				<td>${udto.user_date}</td>
			</tr>
			</c:forEach>
		
		
		</table>
	 </td>
	 <td width="100px">&nbsp;</td>
	 <td>	
		<table border="0" class="type09" width="500px">	
			<tr>
				<td colspan="4" style="font-size:16px;color: navy;font-weight: bold;">${mem_id}���� ���</td>
			</tr>
			
			<tr>
				<th>��ȣ</th>
				<th>�̸�</th>
				<th>����</th>
				<th>��¥</th>
			</tr>
		<c:forEach items="${memberview_user_reply}" var="user_reply">
			<tr>
				
				<td>${user_reply.user_num}</td>
				<td>${user_reply.mem_id}</td>
				<td><a href="usercontentview?user_num=${user_reply.user_num}">${user_reply.user_title}</a></td>
				<td>${user_reply.user_date}</td>
			</tr>
		</c:forEach>
	</table>
	</td>
 </tr>
</table>
</body>
</html>