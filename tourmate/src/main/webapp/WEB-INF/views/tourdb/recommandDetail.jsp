<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
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
		<center><img src="resources/corlate/images/logo/attraction.png" alt="�������Ұ�" width="180px" height="160px"></center>
		<hr color="gray">
	<table border="0" align="center" style="margin:100px 200px 100px 200px">
		<input type="hidden" value="${twoareaCode}" name="areaCode">
		<input type="hidden" value="${twopageNo}" name="pageNo">

		<c:forEach var="rdlist" items="${recommandDetaillist}">
			<tr>
				<td rowspan="2" width="430" height="250"><img
					src="${rdlist.getFirstimage()}" width="420" height="250"
					id="mainimage" /></td>
					
				<td
					style="vertical-align: top; font-weight: bold; font-size: 20px; height: 120;">&nbsp;&nbsp;&nbsp;${rdlist.getTitle()}</td>
			</tr>
			<tr>
				<td style="vertical-align: top; font-size: 13px;" rowspan="2">
					<br> &nbsp;&nbsp;&nbsp;<b>�ּ�:</b>&nbsp;${rdlist.getAddr1()}&nbsp;"${rdlist.getAddr2()}"<br>
					&nbsp;&nbsp;&nbsp;<b>�����ȣ:</b>&nbsp;${rdlist.getZipcode()}"<br>
					&nbsp;&nbsp;&nbsp;<b>�������뿩:</b>&nbsp;${rdlist.getChkbabycarriage()}"<br>
					&nbsp;&nbsp;&nbsp;<b>�ſ�ī����:</b>&nbsp;${rdlist.getChkcreditcard()}"<br>
					&nbsp;&nbsp;&nbsp;<b>�ֿϵ�������:</b>&nbsp;${rdlist.getChkpet()}"<br>
					&nbsp;&nbsp;&nbsp;<b>ü��ȳ�:</b>&nbsp;${rdlist.getExpguide()}"<br>
					&nbsp;&nbsp;&nbsp;<b>���ǹ׾ȳ�:</b>&nbsp;${rdlist.getInfocenter()}"<br>
					&nbsp;&nbsp;&nbsp;<b>�����ü�:</b>&nbsp;${rdlist.getParking()}"<br>
					&nbsp;&nbsp;&nbsp;<b>����:&nbsp;</b>${rdlist.getRestdate()}"<br>
				<br> &nbsp;&nbsp;&nbsp;<b>Ȩ������:&nbsp;</b>
					${rdlist.getHomepage()}
				</td>
			</tr>

			<tr>
				<td><br> <c:forEach var="sublist" items="${sublist}">
						<img src="${sublist}" width="100" height="70" class="smallimage" />
					</c:forEach></td>

			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" style="font-size: 14px;">
				<hr> 
				<font style="font-size: 16px; font-weight: bold; color: navy;">&nbsp;&nbsp;&nbsp;
						&loz;�Ұ�</font> <br>
				<br>${rdlist.getOverview()}</td>
			</tr>
		</c:forEach>
		
			<tr><td colspan="2">&nbsp;</td></tr> <tr><td colspan="2">&nbsp;</td></tr>
			<tr><td align="center">
			<div id="map" style="width:500px;height:350px;" align="center"></div>
			
			</td>
			</tr>
	</table>
	<div id="clickLatlng"></div>

		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bb4fc8d3b1c4c4602c5256f168a11e0d"></script>
		<c:set var="mapy" value="${mapy}" />
		<c:set var="mapx" value="${mapx}" />
		
		<script>
		
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		    mapOption = { 
			
		        center: new daum.maps.LatLng(<c:out value="${mapy}"/>, <c:out value="${mapx}"/>), // ������ �߽���ǥ
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
			

	
	

</body>
</html>