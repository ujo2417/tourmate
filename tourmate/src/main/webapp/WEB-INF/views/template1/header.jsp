<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>


<head>

<!-- alert 꾸미기 -->

<link rel="stylesheet" href="/resources/alertify/alertify.core.css" />
<link rel="stylesheet" href="/resources/alertify/alertify.default.css" id="toggleCSS" />
<script src="/resources/alertify/alertify.min.js"></script>

<!-- alert 꾸미기 -->


    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>TOur MatE</title>
	
	<!-- core CSS -->
    <link href="/resources/corlate/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/corlate/css/font-awesome.min.css" rel="stylesheet">
    <link href="/resources/corlate/css/animate.min.css" rel="stylesheet">
    <link href="/resources/corlate/css/prettyPhoto.css" rel="stylesheet">
    <link href="/resources/corlate/css/main.css" rel="stylesheet">
    <link href="/resources/corlate/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="/resources/corlate/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/resources/corlate/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/resources/corlate/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/resources/corlate/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="/resources/corlate/images/ico/apple-touch-icon-57-precomposed.png">


   <!-- Bootstrap Core CSS -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/bootstrap/css/stylish-portfolio.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

</head>







<body class="homepage">

    <header id="header">
   
        <div class="top-bar">
        <div class="container">
        <div class="row">
        <div class="col-sm-6 col-xs-4">
        <div></i> </p></div>
        </div>
                    
	<c:if test="${empty sessionScope.mem_id}">
		<div id="iddesign" align="right">
		<b>
		<a href="loginform">Login</a> &nbsp;&nbsp; 
		<a href="joinForm">Regist</a>
 		</b>
		</div>
	</c:if> 

	<c:if test="${!empty sessionScope.mem_id}">

	<div class="iddesign" align="right">

	<form id="iddesign" name="logout" action="logout.do" method="post">
		<c:if test="${sessionScope.mem_grade <= 100 && sessionScope.mem_grade >=0}">
			<img src="/resources/grade/grade1.jpg" >
		</c:if>
		<c:if test="${sessionScope.mem_grade>100 && sessionScope.mem_grade<=300 }">
			<img src="/resources/grade/grade2.jpg" >
		</c:if>
		<c:if test="${sessionScope.mem_grade>300 && sessionScope.mem_grade<1000 }">
			<img src="/resources/grade/grade3.jpg" >
		</c:if>
		<c:if test="${sessionScope.mem_grade>1000 && sessionScope.mem_grade<2500 }">
			<img src="/resources/grade/grade4.jpg" >
		</c:if>
		<c:if test="${sessionScope.mem_grade>2500}">
			<img src="/resources/grade/grade5.jpg" >
		</c:if>
		<b>
		<a href="modifyForm">${sessionScope.mem_id}</a>님, 로그인 중 입니다. &nbsp;&nbsp; 
		<a href="memoReceiveList">쪽지함    (${sessionScope.memoReceiveCount})</a> &nbsp;&nbsp; 
		<a href="logout.do">LOGOUT</a> &nbsp;&nbsp; 
		<a href="mypage?id=${sessionScope.memId }">MYPAGE</a>
		</b>
	</form>
	</div>
	</c:if> 
	</div>
	</div><!--/.container-->
</div><!--/.top-bar-->

			
				
	<nav class="navbar navbar-inverse" role="banner">
	<div class="container">
	
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
			<a class="navbar-brand" href="index.html"><img src="/resources/corlate/images/logo.jpg" width="160" height="70" alt="logo"></a>
	</div>
				
	<div class="collapse navbar-collapse navbar-right">
	<ul class="nav navbar-nav">
		<li class=""><a href="index.html">Home</a></li>
	<c:if test="${mem_id!='admin'}">
		<li><a href="matelist">TourMate</a></li>
		<li><a href="freelist">자유게시판</a></li>
		<li><a href="userlist">후기게시판</a></li>
	</c:if>
                      	
	<c:if test="${mem_id=='admin'}">
                      	
	<li class="dropdown">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown">게시판 관리<i class="fa fa-angle-down"></i></a>
		<ul class="dropdown-menu">
			<li><a href="noticelist">공지사항</a></li>
			<li><a href="adminmatelist">TourMate</a></li>
			<li><a href="adminFreelist">자유게시판</a></li>
			<li><a href="adminUserlist">후기게시판</a></li>                                
		</ul>
	</li>
    
	<li><a href="adminpage">회원관리</a></li>
                        </c:if>
                                                                   
	<li class="dropdown">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown">여행지소개<i class="fa fa-angle-down"></i></a>
	<ul class="dropdown-menu">
		<li><a href="recommand">관광지</a></li>
		<li><a href="food">맛집</a></li>
		<li><a href="corse">여행코스</a></li>
	</ul>
                        </li>
                        <c:if test="${mem_id!='admin'}">
                        <li><a href="contact">Contact</a></li> 
                        </c:if>                       
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
		
    </header><!--/header-->
    
    <!-- 
    <script src="/resources/corlate/js/jquery.js"></script>
    <script src="/resources/corlate/js/bootstrap.min.js"></script>
    <script src="/resources/corlate/js/jquery.prettyPhoto.js"></script>
    <script src="/resources/corlate/js/jquery.isotope.min.js"></script>
    <script src="/resources/corlate/js/main.js"></script>
    <script src="/resources/corlate/js/wow.min.js"></script>
     -->
 
    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>

	<!-- /resources/corlate/js/jquery.js -->
	<script src="/resources/corlate/js/jquery.js"></script>



    <!-- Custom Theme JavaScript -->
    <script>
    // Closes the sidebar menu
    $("#menu-close").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });

    // Opens the sidebar menu
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    }); 
    </script>
    
    
    
</body>
