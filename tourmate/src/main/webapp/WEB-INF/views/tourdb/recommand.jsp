<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행지 소개</title>
<style type="text/css">
	a:link{color:black;}
	a:visited{color:black;}
	a:hover{color:silver;}
</style>

</head>
<body>
<center>
	<br>
	<center><img src="resources/corlate/images/logo/attraction.png" alt="관광지소개" width="200px" height="180px"></center>
	<!-- search -->
	<form action="recommand" method="post">
	<table>
	  <tr>
	  	<td>
	  	<%-- areaCode : ${areaCode } <br>
	  	pageNo : ${pageNo } <br> --%>
	  	
	 	<select name = "areaCode" onchange="this.form.submit()"><!-- onchange="this.form.submit()" -->
             <option value="${areaCode }">--${areaName }--</option>
             <option value="1">서울</option>
             <option value="2">인천</option>
             <option value="3">대전</option>
             <option value="4">대구</option>
             <option value="5">광주</option> 
             <option value="6">부산</option>
             <option value="7">울산</option>
             <option value="8">세종특별자치시</option>
             <option value="31">경기도</option>
             <option value="32">강원도</option>
             <option value="33">충청북도</option>
             <option value="34">충정남도</option>
             <option value="35">경상북도</option>
             <option value="36">경상남도</option>
             <option value="37">전라북도</option>
             <option value="38">전라남도</option>
             <option value="39">제주도</option>
        </select>
        
		<!-- <input type="hidden" value="1" name="areaCode"> -->
		<c:if test="${areaCode == null}">
			<select name ="pageNo" style="vertical-align:top;"onchange="this.form.submit()">
	             <option value="1">
	             --1--</option>
	             <c:forEach var="i" begin="1" end="36">
	             	<option value="${i }">${i }</option>
	             </c:forEach>
	       </select>
        </c:if>
        <c:if test="${areaCode == 1}">
			<select name ="pageNo" style="vertical-align:top;"onchange="this.form.submit()">
	             <option value="1">
	             --${pageNo }--</option>
	             <c:forEach var="i" begin="1" end="36">
	             	<option value="${i }">${i }</option>
	             </c:forEach>
	       </select>
        </c:if>
         <c:if test="${areaCode == 2}">
         	<select name ="pageNo" style="vertical-align:top;"onchange="this.form.submit()">
	             <option value="1">--${pageNo }--</option>
	             <c:forEach var="i" begin="1" end="18">
	             	<option value="${i }">${i }</option>
	             </c:forEach>
	       </select>
         </c:if>
      	 <c:if test="${areaCode == 3}">
         	<select name ="pageNo" style="vertical-align:top;"onchange="this.form.submit()">
	             <option value="1">--${pageNo }--</option>
	             <c:forEach var="i" begin="1" end="6">
	             	<option value="${i }">${i }</option>
	             </c:forEach>
	       </select>
         </c:if>
        <c:if test="${areaCode == 4}">
         	<select name ="pageNo" style="vertical-align:top;"onchange="this.form.submit()">
	             <option value="1">--${pageNo }--</option>
	             <c:forEach var="i" begin="1" end="14">
	             	<option value="${i }">${i }</option>
	             </c:forEach>
	       </select>
         </c:if>
        <c:if test="${areaCode == 5}">
         	<select name ="pageNo" style="vertical-align:top;"onchange="this.form.submit()">
	             <option value="1">--${pageNo }--</option>
	             <c:forEach var="i" begin="1" end="9">
	             	<option value="${i }">${i }</option>
	             </c:forEach>
	       </select>
         </c:if>
	    <c:if test="${areaCode == 6}">
			<select name ="pageNo" style="vertical-align:top;"onchange="this.form.submit()">
	             <option value="1">--${pageNo }--</option>
	             <c:forEach var="i" begin="1" end="14">
	             	<option value="${i }">${i }</option>
	             </c:forEach>
	       </select>
        </c:if>
         <c:if test="${areaCode == 7}">
         	<select name ="pageNo" style="vertical-align:top;"onchange="this.form.submit()">
	             <option value="1">--${pageNo }--</option>
	             <c:forEach var="i" begin="1" end="9">
	             	<option value="${i }">${i }</option>
	             </c:forEach>
	       </select>
         </c:if>
      	 <c:if test="${areaCode == 8}">
         	<select name ="pageNo" style="vertical-align:top;"onchange="this.form.submit()">
	             <option value="1">--${pageNo }--</option>
	             <c:forEach var="i" begin="1" end="3">
	             	<option value="${i }">${i }</option>
	             </c:forEach>
	       </select>
         </c:if>
        <c:if test="${areaCode == 31}">
         	<select name ="pageNo" style="vertical-align:top;"onchange="this.form.submit()">
	             <option value="1">--${pageNo }--</option>
	             <c:forEach var="i" begin="1" end="71">
	             	<option value="${i }">${i }</option>
	             </c:forEach>
	       </select>
         </c:if>
        <c:if test="${areaCode == 32}">
         	<select name ="pageNo" style="vertical-align:top;"onchange="this.form.submit()">
	             <option value="1">--${pageNo }--</option>
	             <c:forEach var="i" begin="1" end="67">
	             	<option value="${i }">${i }</option>
	             </c:forEach>
	       </select>
         </c:if>
	    <c:if test="${areaCode == 33}">
			<select name ="pageNo" style="vertical-align:top;"onchange="this.form.submit()">
	             <option value="1">--${pageNo }--</option>
	             <c:forEach var="i" begin="1" end="49">
	             	<option value="${i }">${i }</option>
	             </c:forEach>
	       </select>
        </c:if>
         <c:if test="${areaCode == 34}">
         	<select name ="pageNo" style="vertical-align:top;"onchange="this.form.submit()">
	             <option value="1">--${pageNo }--</option>
	             <c:forEach var="i" begin="1" end="53">
	             	<option value="${i }">${i }</option>
	             </c:forEach>
	       </select>
         </c:if>
      	 <c:if test="${areaCode == 35}">
         	<select name ="pageNo" style="vertical-align:top;"onchange="this.form.submit()">
	             <option value="1">--${pageNo }--</option>
	             <c:forEach var="i" begin="1" end="86">
	             	<option value="${i }">${i }</option>
	             </c:forEach>
	       </select>
         </c:if>
        <c:if test="${areaCode == 36}">
         	<select name ="pageNo" style="vertical-align:top;"onchange="this.form.submit()">
	             <option value="1">--${pageNo }--</option>
	             <c:forEach var="i" begin="1" end="73">
	             	<option value="${i }">${i }</option>
	             </c:forEach>
	       </select>
         </c:if>
       <c:if test="${areaCode == 37}">
         	<select name ="pageNo" style="vertical-align:top;"onchange="this.form.submit()">
	             <option value="1">--${pageNo }--</option>
	             <c:forEach var="i" begin="1" end="71">
	             	<option value="${i }">${i }</option>
	             </c:forEach>
	       </select>
         </c:if>
      	 <c:if test="${areaCode == 38}">
         	<select name ="pageNo" style="vertical-align:top;"onchange="this.form.submit()">
	             <option value="1">--${pageNo }--</option>
	             <c:forEach var="i" begin="1" end="76">
	             	<option value="${i }">${i }</option>
	             </c:forEach>
	       </select>
         </c:if>
        <c:if test="${areaCode == 39}">
         	<select name ="pageNo" style="vertical-align:top;"onchange="this.form.submit()">
	             <option value="1">--${pageNo }--</option>
	             <c:forEach var="i" begin="1" end="25">
	             	<option value="${i }">${i }</option>
	             </c:forEach>
	       </select>
         </c:if>                           
        <!-- <input type="submit" value="선택" /> -->
        </td>
        <!-- 
        <td>
        	<input type="submit" value="검색" />
        </td> -->
      </tr>
	</table>
<!-- 	</form> -->
	 
	<br><hr><br>
	
	<!-- content -->
	<div>
		  <table border="0"  align="center" width="90%" border="0" cellpadding="10" cellspacing="0" class="listtable">
			  <c:set var="i" value="0" />
			  <c:forEach var="j" begin="1" end="4">
						<tr>
							  <c:forEach var="rlist" items="${recommandlist}" begin="${i}" end="${i+3}">
							 
							  	<td align="center">
							  		<a href="recommandDetail?contentId=${rlist.getContentid()}" style="text-decoration:none">
									<img src="${rlist.getFirstimage()}" width="200" height="150"/><br>
									<font size="2"><c:out value="${rlist.getTitle()}"></c:out></font>
									</a>
								</td>
							
							 </c:forEach>
						</tr>
			  <c:set var="i" value="${i+4}" />	
			  </c:forEach>
		  </table>
	</div>
	<br>
	<!-- page -->
		
<!-- <form action="recommand" method="post"> -->
        
	    
	    
	</form> 
</center>
</body>
</html>
<%--  <c:out value="${rlist.getAddr1()}"></c:out>
					<c:out value="${rlist.getAddr2()}"></c:out><br>
					<c:out value="${rlist.getCat1()}"></c:out><br>
					<c:out value="${rlist.getCat2()}"></c:out><br>
					<c:out value="${rlist.getCat3()}"></c:out><br>
					<c:out value="${rlist.getMapx()}"></c:out><br>
					<c:out value="${rlist.getMapy()}"></c:out><br>
					<c:out value="${rlist.getZipcode()}"></c:out><br>
					<c:out value="${rlist.getAreacode()}"></c:out><br>
					<c:out value="${rlist.getContentid()}"></c:out><br>
					<c:out value="${rlist.getContenttypeid()}"></c:out><br>
					<c:out value="${rlist.getCreatedtime()}"></c:out><br>
					<c:out value="${rlist.getMlevel()}"></c:out><br>
					<c:out value="${rlist.getModifiedtime()}"></c:out><br>
					<c:out value="${rlist.getReadcount()}"></c:out><br>
					<c:out value="${rlist.getSigungucode()}"></c:out>  --%>