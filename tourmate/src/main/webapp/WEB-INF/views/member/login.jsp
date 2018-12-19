<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>User Login Flat Responsive widget Template :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<meta name="keywords"
	content="User Login Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
<link href="resources/web/css/style.css" rel='stylesheet'
	type='text/css' />
<!--web-fonts-->
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>

<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
	$(document).ready(function() {
		$('#delete').click(function() {
			var con = confirm("정말로 탈퇴하시겠습니까?");
			if (con == true) {
				return true;
			} else {
				return false;
			}
		});
	});
</script>
<script type="text/javascript">
<!-- 
function popupID(url){
	var popUrl = url;	//팝업창에 출력될 페이지 URL
	var popOption = "width=500, height=150, resizable=no, scrollbars=no, ,location=no, status=no, left=400, top=100;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption); 
	}
function popupPWD(url){
	var popUrl = url;	//팝업창에 출력될 페이지 URL
	var popOption = "width=500, height=200, resizable=no, scrollbars=no, ,location=no, status=no, left=400, top=100;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption); 
	}
//-->
</script>

<!--/web-fonts-->
</head>
<body>
	<!--User-Login-->
	<h1>User Login</h1>

	<c:if test="${empty sessionScope.mem_id}">

		<!-- <div class="avtar">
	<img src="resources/web/images/avtar.png" />
	<img src="resources/corlate/images/logo.jpg"  width="450px" height="200px" />
</div> -->
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<div class="login-form">
			<p>
				ID가 없으시나요?<a href="joinForm">Register here!</a>
			</p>
			<form name="myform" method="post" action="login">
				<div class="form-text">
					<input type="text" class="text" value="USERNAME" name="mem_id"
						onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'USERNAME';}">
					<input type="password" value="Password" name="mem_pwd"
						onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'Password';}">
					<input type="hidden" name="file" value="${dto.mem_pic}">
				</div>
				<input type="submit" name="submit" value="go">
				<div>
			<a href="javascript:popupID('researchIdForm')">
			<input type="button" value="Search ID" > <!-- onclick="document.location.href='researchIdForm'" -->
			</a> 
			<a href="javascript:popupPWD('researchPwdForm')">
			<input type="button" value="Search Pwd" ><!-- onclick="document.location.href='researchPwdForm'" -->
			</a> 
		</div>
			</form>
		</div>
		<!--/User-Login-->
		<!--start-copyright-->
		
		<br>
		<div class="copy-right">
			<p>
				<a href="index.html" style="font-weight: bold">TourMate에
					오신걸 환영합니다.</a>
			</p>
		</div>
		<!--//end-copyright-->

	</c:if>

	<c:if test="${!empty sessionScope.mem_id}">



		<div class="login-form">

			<br>
			<br>
			<h2>${sessionScope.mem_id}님이로그인 하셨습니다</h2>
			<%-- <form method="post" action="logout">
						<input type="submit" value="로그아웃"> 
					</form>
					<form method="post" action="modifyForm">
						<input type="hidden" name="mem_id" value="${sessionScope.mem_id }">
							<input type="submit" value="정보수정">
					</form>
					<form method="post" action="memberDelete" >
						<input type="hidden" name="mem_id" value="${sessionScope.mem_id }">
							<input type="submit" value="회원탈퇴" id="delete">
					</form> --%>
			2초후 메인페이즈로 이동 합니다.
			<meta http-equiv="Refresh" content="0;url=index">


		</div>
	</c:if>


</body>
</html>