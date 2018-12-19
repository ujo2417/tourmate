<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코스 디테일 페이지</title>
</head>
<body>

<br>
		<center><img src="resources/corlate/images/logo/tourcourselogo.png" alt="코스소개" width="200px" height="180px"></center>
	<hr color="gray">
		<table border=	"0" align="center" style="margin:100px 200px 100px 200px">
			
		  <c:forEach var="cdlist" items="${corseDetaillist}">
			<tr>
				<td rowspan="2" width="430" height="250"><img src="${cdlist.getFirstimage()}" width="420" height="250" /></td>
				<td style="vertical-align:top;" rowspan="2">
				&nbsp;&nbsp;&nbsp;<font style="font-weight: bold;font-size:20px;">${cdlist.getTitle()}</font><br><br>
				&nbsp;&nbsp;&nbsp;<b>총거리:</b>&nbsp;${cdlist.getDistance()}<br>
				&nbsp;&nbsp;&nbsp;<b>소요시간:</b>&nbsp;${cdlist.getTaketime()}
				</td>
			</tr>
		
				<tr><td colspan="2">&nbsp;</td></tr>
			<tr>
				<td colspan="2"  style="font-size:14px;"><hr>
					<font style="font-size:16px; font-weight:bold;color: navy;">&nbsp;&nbsp;&nbsp; &loz;소개</font>
					<br><br>${cdlist.getOverview()}</td>
			</tr>
			
			<tr><td colspan="2">&nbsp;</td></tr><tr><td colspan="2">&nbsp;</td></tr>
			
			<tr >
				<td colspan="2" style="font-weight: bold;font-size:24px;font-style: oblique;color: navy;" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&lt;${cdlist.getTitle()}:&nbsp;코스소개&gt;</td>
			</tr>
			
			
			<table border="0" style="margin:0px 490px 100px 410px" width="550px">
				<tr align="center" >
				
					<td >
					<c:forEach var="csublist" items="${csublist}">
						<font style="font-size:19px;font-weight: bold;">&raquo;${csublist.subname}</font><br><br>
						<img src="${csublist.subdetailimg}" width="450" height="300"/><br><br>
						&nbsp;&nbsp; ${csublist.subdetailoverview}<br><br>
					</c:forEach>
					</td>
					
				
				</tr>
			</table>
		
		  </c:forEach>
		</table>

		
</body>
</html>