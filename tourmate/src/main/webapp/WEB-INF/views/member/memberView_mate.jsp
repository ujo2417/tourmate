<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>투어메이트 게시판 내 후기 보기</title>
<link rel="stylesheet" href="resources/css/table.css">
</head>
<body>
<br><center>
<img src="resources/corlate/images/logo/mytourmateviewlogo.png" width="200px" height="180px" />
</center><br><br>
<table border="0" align="center" style="text-align: center;margin-bottom:180px;">
	<tr>
	  <td>
		<table border="0" class="type09" width="500px">
			<tr>
				<td colspan="4" align="center" style="font-size:16px;color: navy;font-weight: bold;">${mem_id}님 게시글</td>
			</tr>
			
			<tr>
				
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>날짜</th>
			</tr>
			<c:forEach items="${memberview_mate}" var="mdto">
				<tr>
					
					<td>${mdto.mate_num}</td>
					<td>${mdto.mem_id}</td>
					<td><a href="matecontentview?mate_num=${mdto.mate_num}">${mdto.mate_title}</a></td>
					<td>${mdto.mate_date}</td>
				</tr>
		 </c:forEach>
		
		
		</table>
	 </td>
	 <td width="100px">&nbsp;</td>
	 <td>	
		<table border="0" class="type09" width="500px">	
			<tr>
				<td colspan="4" style="font-size:16px;color: navy;font-weight: bold;">${mem_id}님의 댓글</td>
			</tr>
			
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>제목</th>
				<th>날짜</th>
			</tr>
			<c:forEach items="${memberview_mate_reply}" var="mate_reply">
			<tr>
				
				<td>${mate_reply.mate_num}</td>
				<td>${mate_reply.mem_id}</td>
				<td><a href="matecontentview?mate_num=${mate_reply.mate_num}">${mate_reply.mate_title}</a></td>
				<td>${mate_reply.mate_date}</td>
			</tr>
		</c:forEach>
	</table>
	</td>
 </tr>
</table>
</body>
</html>