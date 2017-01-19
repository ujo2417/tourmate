<%@page contentType="text/html; charset=UTF-8"%>



<head>
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
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/resources/corlate/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/resources/corlate/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/resources/corlate/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="/resources/corlate/images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->


<body class="homepage">

<section>
  <c:if test="${empty sessionScope.mem_id}">

						<div id="iddesign" align="right">


							<form class="iddesign" name="myform" action="login"
								method="post" onSubmit="return checkIt()">

								<label class="iddesign"> <input type="text"
									class="fields" name="mem_id" size="10" placeholder="ID" />
								</label> <label> <input type="password" class="fields"
									name="mem_pwd" size="10" placeholder="Password" /> <input
									type="submit" class="button22" name="Submit" value="LOGIN" />&nbsp;&nbsp;&nbsp;

									<input type="button" value="REGIST" class="button22"
									onclick="location.href='inputForm.do'"> &nbsp; <input
									type="button" value="SearchID" class="button22"
									onclick="location.href='researchId.do'"> &nbsp; <input
									type="button" value="SearchPW"  class="button22"
									onclick="location.href='researchPwd.do'"> <!-- <input type="submit" class="classname" name="Submit" value="LOGIN" />&nbsp;&nbsp;&nbsp;
									<a href="inputForm.do">REGIST</a> <a href="researchId.do">SearchID</a>
									<a href="researchPwd.do">SearchPwd</a> -->
								</label>

							</form>
						</div>
					</c:if>

					<c:if test="${!empty sessionScope.mem_id}">

						<div class="iddesign" align="right">

							<form id="iddesign" name="logout" action="logout.do"
								method="post">

								<b>${sessionScope.mem_id}님, 로그인 중 입니다. <br> <a
									href="logout.do">LOGOUT</a> &nbsp;&nbsp; <a
									href="modify.do?id=${sessionScope.mem_id }">MODIFY</a></b>
							</form>
						</div>
					</c:if>
    
    </section><!--/#bottom-->
    
    <script src="/resources/corlate/js/jquery.js"></script>
    <script src="/resources/corlate/js/bootstrap.min.js"></script>
    <script src="/resources/corlate/js/jquery.prettyPhoto.js"></script>
    <script src="/resources/corlate/js/jquery.isotope.min.js"></script>
    <script src="/resources/corlate/js/main.js"></script>
    <script src="/resources/corlate/js/wow.min.js"></script>

    </body>
