<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>������ �Ұ� ������ ������</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script type="text/javascript">
 $(document).ready(function() {
	 var mainImage = $('#mainimage').attr("src");
       $('.smallimage').hover(function () {
    	   $('#mainimage').attr("src" , $(this).attr("src"));
       }).mouseout(function () {
    	   $('#mainimage').attr("src" , mainImage);
       });
 });
</script>
</head>
<body>
		<br>
		<center><img src="/resources/corlate/images/logo/foodlogo.png" alt="�������Ұ�" width="180px" height="160px"></center>
	<hr color="gray">
		<table border="0" align="center" style="margin:100px 200px 100px 200px">
			
		  <c:forEach var="fdlist" items="${foodDetaillist}">
			<tr>
				<td rowspan="2" width="430" height="250"><img src="${fdlist.getFirstimage()}" width="420" height="250" id="mainimage"/></td>
				<td style="vertical-align:top;font-weight: bold;font-size:20px;height:120;">&nbsp;&nbsp;&nbsp;${fdlist.getTitle()}</td>
			</tr>
			<tr>
				<td style="vertical-align:top;font-size:13px;" rowspan="2">
					<br>
					&nbsp;&nbsp;&nbsp;<b>�ּ�:</b>&nbsp;${fdlist.getAddr1()}&nbsp;"${rdlist.getAddr2()}"<br>
					&nbsp;&nbsp;&nbsp;<b>�����ȣ:</b>&nbsp;${fdlist.getZipcode()}"<br>
					&nbsp;&nbsp;&nbsp;<b>��ǥ��ȭ:</b>&nbsp;${fdlist.getInfocenterfood()}"<br>
					&nbsp;&nbsp;&nbsp;<b>��ǥ�޴�:</b>&nbsp;${fdlist.getFirstmenu()}"<br>
					&nbsp;&nbsp;&nbsp;<b>ī����:</b>&nbsp;${fdlist.getChkcreditcardfood()}"<br>
					&nbsp;&nbsp;&nbsp;<b>��̳��̹�:</b>&nbsp;${fdlist.getKidsfacility()}"<br>
					&nbsp;&nbsp;&nbsp;<b>���ǹ׾ȳ�:</b>&nbsp;${fdlist.getInfocenterfood()}"<br>
					&nbsp;&nbsp;&nbsp;<b>�����ð�:</b>&nbsp;${fdlist.getOpentimefood()}"<br>
					&nbsp;&nbsp;&nbsp;<b>����:</b>&nbsp;${fdlist.getRestdatefood()}"<br>
					&nbsp;&nbsp;&nbsp;<b>���尡�ɿ���:</b>&nbsp;${fdlist.getPacking()}"<br>
					&nbsp;&nbsp;&nbsp;<b>����:</b>&nbsp;${fdlist.getParkingfood()}"<br>
					&nbsp;&nbsp;&nbsp;<b>����:</b>&nbsp;${fdlist.getReservationfood()}"<br>
					&nbsp;&nbsp;&nbsp;<b>���¼�:</b>&nbsp;${fdlist.getSeat()}"<br>
					&nbsp;&nbsp;&nbsp;<b>��:</b>&nbsp;${fdlist.getSmoking()}"<br>
					&nbsp;&nbsp;&nbsp;<b>�ָ޴�:</b>&nbsp;${fdlist.getTreatmenu()}"
			   </td>
			</tr>
			
			<tr>
				<td><br>
				<c:forEach var="fsublist" items="${fsublist}">
				<img src="${fsublist}" width="100" height="70" class="smallimage" />
				</c:forEach>
				</td>
			</tr>
			<tr><td colspan="2">&nbsp;</td></tr><tr><td colspan="2">&nbsp;</td></tr>
			<tr>
				<td colspan="2"  style="font-size:14px;"><hr>
				<font style="font-size:16px; font-weight:bold;color: navy;">&nbsp;&nbsp;&nbsp; &loz;�Ұ�</font>
				<br><br>${fdlist.getOverview()}</td>
			</tr>
		  </c:forEach>
		  <tr><td colspan="2">&nbsp;</td></tr> <tr><td colspan="2">&nbsp;</td></tr>
			<tr>
				<td >
						<div id="map" style="width:600px;height:350px;"></div>
						
						<div id="clickLatlng"></div>
						
						<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=667ad238388d91f9d4a3e7b2924c45a3"></script>
						<c:set var="mapy" value="${mapy}" />
						<c:set var="mapx" value="${mapx}" />
						
						<script>
						
						var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
						    mapOption = { 
							
						        center: new daum.maps.LatLng(<c:out value="${mapy}" />, <c:out value="${mapx}" />), // ������ �߽���ǥ
						        level: 3 // ������ Ȯ�� ����
						    };
						var map = new daum.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
						
						// ������ Ŭ���� ��ġ�� ǥ���� ��Ŀ�Դϴ�
						var marker = new daum.maps.Marker({ 
						    // ���� �߽���ǥ�� ��Ŀ�� �����մϴ� 
						    position: map.getCenter() 
						}); 
						// ������ ��Ŀ�� ǥ���մϴ�
						marker.setMap(map);
						
						// ������ Ŭ�� �̺�Ʈ�� ����մϴ�
						// ������ Ŭ���ϸ� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���մϴ�
						daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
						  
						    
						});
						</script>
										
				</td>
			</tr>
	</table>
	
</body>
</html>