<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>TOur MatE</title>
	
	<!-- core CSS -->
    <link href="resources/corlate/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/corlate/css/font-awesome.min.css" rel="stylesheet">
    <link href="resources/corlate/css/animate.min.css" rel="stylesheet">
    <link href="resources/corlate/css/prettyPhoto.css" rel="stylesheet">
    <link href="resources/corlate/css/main.css" rel="stylesheet">
    <link href="resources/corlate/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="resources/corlate/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="resources/corlate/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="resources/corlate/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="resources/corlate/images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->



   <section id="main-slider" class="no-margin">
        <div class="carousel slide">
            <ol class="carousel-indicators">
                <li data-target="#main-slider" data-slide-to="0" class="active"></li>
                <li data-target="#main-slider" data-slide-to="1"></li>
                <li data-target="#main-slider" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">

                 <div class="item active" style="background-image: url(resources/corlate/images/sample6.jpg);height:600px;" >
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1"  style="color: black;font-weight: 800;">Wel Come!!</h1>
                                    <h2 class="animation animated-item-2" style="color: black;font-weight: 600;">TOur MatE에 오신걸 환영합니다.</h2>
                                   <!--  <a class="btn-slide animation animated-item-3" href="#">Read More</a> -->
                                </div>
                            </div>

                            <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <!-- <div class="slider-img">
                                    <img src="resources/corlate/images/slider/img1.png" class="img-responsive">
                                </div> -->
                            </div>

                        </div>
                    </div>
                </div><!--/.item-->

                <div class="item" style="background-image: url(resources/corlate/images/sample4.jpg);height:600px;">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1" style="color: black;font-weight: 800;">Wel Come!!</h1>
                                    <h2 class="animation animated-item-2" style="color: black;font-weight: 600;">TOur MatE에 오신걸 환영합니다.</h2>
                                </div>
                            </div>

                            <div class="col-sm-6 hidden-xs animation animated-item-4">
<!--                                 <div class="slider-img">
                                    <img src="images/slider/img2.png" class="img-responsive">
                                </div> -->
                            </div>

                        </div>
                    </div>
                </div><!--/.item-->

                <div class="item" style="background-image: url(resources/corlate/images/sample5.jpg);height:600px;">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1" style="color: black;font-weight: 800;">Wel Come!!</h1>
                                    <h2 class="animation animated-item-2" style="color: black;font-weight: 600;">TOur MatE에 오신걸 환영합니다.</h2>
                                </div>
                            </div>
                            <div class="col-sm-6 hidden-xs animation animated-item-4">
                             <!--    <div class="slider-img">
                                    <img src="images/slider/img3.png" class="img-responsive">
                                </div> -->
                            </div>
                        </div>
                    </div>
                </div><!--/.item-->
            </div><!--/.carousel-inner-->
        </div><!--/.carousel-->
  
  </section><!--/#main-slider-->
<br>
 <section id="content">
        <div class="container">
            <div class="row">
                 <div class="col-xs-12 col-sm-8 wow fadeInDown">
                   <div class="tab-wrap"> 
                        <div class="media">
                            <div class="parrent pull-left">
                                <ul class="nav nav-tabs nav-stacked">
                                    <li class=""><a href="#tab1" data-toggle="tab" class="analistic-01">프로포즈 평창</a></li>
                                    <li class=""><a href="#tab2" data-toggle="tab" class="analistic-02">드라마틱 부산</a></li>
                                    <li class=""><a href="#tab3" data-toggle="tab" class="tehnical">놀아보자 보령</a></li>
                                    <li class=""><a href="#tab4" data-toggle="tab" class="tehnical">힐링하자 우도</a></li>
                                    <li class=""><a href="#tab5" data-toggle="tab" class="tehnical">서울근교 계곡</a></li>
                                    
                                    
                                </ul>
                            </div>

                            <div class="parrent media-body">
                                <div class="tab-content">
                                     <div class="tab-pane fade active in" id="tab1">
                                     <div class="media">
                                      <div class="">
                                                <img class="img-responsive" src="resources/corlate/images/tour_image/vview4.jpg" width="500" height="450">
                                            </div> <br>
                                            <div class="media-body">
                                        <p><h4>모네의 정원</h4></p>
                                        프로포즈 장소, 고민하지 말자!<br> 한 드라마의 드라마 촬영지였던 이 곳은 호텔 안의 공원이다. 아늑한 느낌과 조용함이 로맨틱함을 더욱 진하게 느끼게 해 준다. 이 곳에서의 프로포즈를 한다면 100% 성공이지 않을까?
                                     </div>
                                     </div>
									</div>
                                    <div class="tab-pane fade" id="tab2">
                                    <div class="media">
                                      <div class="">
                                                <img class="img-responsive" src="resources/corlate/images/tour_image/vview2.jpg" width="500" height="450">
                                            </div> <br>
                                            <div class="media-body">
                                        <p><h4>광안대교</h4></p>
                                        다가오는 여름, 빼 놓을 수 없는 여행지 부산!<br>부산에 왔으니 탁 트인 바다를 빼놓을 수 없다. 광안리 해변을 걸으며 소소한 얘기를 나누고 광안대교의 야경을 보며 시원한 맥주한 잔 어떨까? '한 여름밤의 꿀'이 되는 순간을 느껴보자 
                                     </div>
                                     </div>
								</div>
                                      <div class="tab-pane fade" id="tab3">
                                      <div class="">
                                                <img class="img-responsive" src="resources/corlate/images/tour_image/vview3.jpg" width="500" height="450">
                                            </div> <br>
                                        <p><h4>보령 머드축제</h4></p>
                                        한바탕 신나게 놀아보자!<br> 머드는 물과는 다른 또 다른 시원함을 선사한다. 많은 사람들이 참가하는 축제이니만큼 그 즐거움은 배로 더해진다. 머드의 시원함을 느껴보고 싶다면 지금 당장 보령으로 달려가자!
                                     </div>
                                     
                                     
                                     <div class="tab-pane fade" id="tab4">
                                      <div class="">
                                                <img class="img-responsive" src="resources/corlate/images/tour_image/vview5.jpg" width="500" height="450">
                                            </div> <br>
                                        <p><h4>제주도의 우도</h4></p>
                                        여긴 우리나라의 우도!<br> 우리나라도 이렇게 아름답고 보기만 해도 힐링이 되는 곳이 있다면 우도를 손에 꼽을 것이다. 우도는 시간이 멈춘듯 온 세상이 아름다움만을 보여준다. 지금 힐링이 필요하다면 망설이지 말고 우도를 택하자! 
                                     </div>

                                     
                                     <div class="tab-pane fade" id="tab5">
                                      <div class="">
                                                <img class="img-responsive" src="resources/corlate/images/tour_image/vview1.jpg" width="500" height="450">
                                            </div> <br>
                                        <p><h4>청평계곡</h4></p>
                                        여름은 물의 계절! <br> 넓은 바다가 아닌 다른 매력을 가진 계곡은 지친 일상에서 잠시 벗어나 산림욕과 함께 즐길 수 있는 물의 시원함을 서울 근교에서 느껴보자!
                                     </div>
                                    
                                    
                                </div> <!--/.tab-content-->  
                            </div> <!--/.media-body--> 
                        </div> <!--/.media-->     
                    </div><!--/.tab-wrap-->               
                </div><!--/.col-sm-6-->
                
                
                
                
                
                
                
                  <div class="col-xs-12 col-sm-4 wow fadeInDown">
                    <div class="testimonial">
                        <h2 style="background-color:#f5f5f5;">공지사항 : READ ME</h2>
                        <br>
                         <div class="media testimonial-inner">
                            <div class="pull-left">
                            	<img class="img-responsive img-circle" src="resources/corlate/images/notice1.png" width="45px" height="20px">
                            </div>
                           
                            <div class="media-body">
                                <p style="font-weight: bold;">공지 1</p>
                                <span><strong>
                                <a href="noticecontentview?notice_num=${notice_main1.notice_num}">${notice_main1.notice_title }</a>
                                </strong></span>
                            </div>
                          
                         </div>
							
                        <div class="media testimonial-inner">
                            <div class="pull-left">
                            	<img class="img-responsive img-circle" src="resources/corlate/images/notice2.png" width="50px" height="22px">
                            </div>
                            <div class="media-body">
                                <p style="font-weight: bold;">공지 2</p>
                                <span><strong>
                                <a href="noticecontentview?notice_num=${notice_main2.notice_num}">${notice_main2.notice_title }</a>
                                </strong> </span>
                            </div>
                         </div>
                         
                         <div class="media testimonial-inner">
                            <div class="pull-left">
                            	   <img class="img-responsive img-circle" src="resources/corlate/images/notice3.png" width="50x" height="25px">
                            </div>
                            <div class="media-body">
                                <p style="font-weight: bold;">공지 3</p>
                                <span><strong>
                                <a href="noticecontentview?notice_num=${notice_main3.notice_num}">${notice_main3.notice_title }</a>
                                </strong></span>
                            </div>
                         </div>

                    </div>
                </div>


            </div><!--/.row-->
        </div><!--/.container-->
    </section><!--/#content-->
    
 
 <!------------------------------------------- 설문조사--------------------------------- -->
     <c:if test="${empty sessionScope.mem_id || investigationConfirm.mem_investigation != 0}">
 <section id="middle">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 wow fadeInDown">
                    <div class="skill">
                        <%-- <h2>Request ${investigationConfirm.mem_investigation }</h2> --%>
                        
                        <p> <br><h2>당신은 여행을 누구와 함께 가나요?</h2></p>

                        <div class="progress-wrap">
                            <h3>가족</h3>
                            <div class="progress">
                              <div class="progress-bar  color1" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${investigationResult.col1rate}%">
                                <span class="bar-width">${investigationResult.col1rate}%</span>
                              </div>

                            </div>
                        </div>

                        <div class="progress-wrap">
                            <h3>애인</h3>
                            <div class="progress">
                              <div class="progress-bar color2" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: ${investigationResult.col2rate}%">
                               <span class="bar-width">${investigationResult.col2rate}%</span>
                              </div>
                            </div>
                        </div>

                        <div class="progress-wrap">
                            <h3>친구</h3>
                            <div class="progress">
                              <div class="progress-bar color3" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${investigationResult.col3rate}%">
                                <span class="bar-width">${investigationResult.col3rate}%</span>
                              </div>
                            </div>
                        </div>

                        <div class="progress-wrap">
                            <h3>기타</h3>
                            <div class="progress">
                              <div class="progress-bar color4" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: ${investigationResult.col4rate}%">
                                <span class="bar-width">${investigationResult.col4rate}%</span>
                              </div>
                            </div>
                        </div>
                        
                      
                    </div><!-- skill -->

                </div><!--/.col-sm-6-->
               </c:if>
               
               <!-- ======================================================================== -->
               
                <c:if test="${!empty sessionScope.mem_id && (investigationConfirm.mem_investigation == 0)}">
 <section id="middle">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 wow fadeInDown">
                    <div class="skill">
                        <%-- <h2>Request ${investigationConfirm.mem_investigation }</h2> --%>
                        
                        <p> <br><h2>당신은 여행을 누구와 함께 가나요?</h2></p>

                        <div class="progress-wrap">
                            <h3>가족</h3>
                            <div class="progress">
                              <div class="progress-bar  color1" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${investigationResult.col1rate}%">
                                <span class="bar-width">${investigationResult.col1rate}%</span>
                              </div>

                            </div>
                        </div>

                        <div class="progress-wrap">
                            <h3>애인</h3>
                            <div class="progress">
                              <div class="progress-bar color2" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: ${investigationResult.col2rate}%">
                               <span class="bar-width">${investigationResult.col2rate}%</span>
                              </div>
                            </div>
                        </div>

                        <div class="progress-wrap">
                            <h3>친구</h3>
                            <div class="progress">
                              <div class="progress-bar color3" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${investigationResult.col3rate}%">
                                <span class="bar-width">${investigationResult.col3rate}%</span>
                              </div>
                            </div>
                        </div>

                        <div class="progress-wrap">
                            <h3>기타</h3>
                            <div class="progress">
                              <div class="progress-bar color4" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: ${investigationResult.col4rate}%">
                                <span class="bar-width">${investigationResult.col4rate}%</span>
                              </div>
                            </div>
                        </div>
                        
                        <br><br>
                        <div class="progress-wrap">
                        
                             <h3>
                             <form action="investigate" method="post">
                             가족&nbsp;<input type="radio" name="radio" value="1" checked="checked"> &nbsp;&nbsp;
                     
                       		   애인&nbsp;<input type="radio" name="radio" value="2">&nbsp;&nbsp;

                    	      친구&nbsp;<input type="radio" name="radio" value="3"> &nbsp;&nbsp;

                        	    기타&nbsp;<input type="radio" name="radio" value="4"> &nbsp;&nbsp;&nbsp;&nbsp;
                        	    
                        	    <input type="submit" value="투표하기">
                        	    </form>
                        	    </h3>
                        	    
                           </div><!-- progress-wrap -->
                           
                    </div><!-- skill -->

                </div><!--/.col-sm-6-->
               </c:if>
              
    
    <!--------------------------------------- 설문 종료---------------------------->
    
                                       <div class="col-sm-6 wow fadeInDown">
                    <div class="accordion">
                        <h2>Travel Column</h2>
                        <div class="panel-group" id="accordion1">
                          <div class="panel panel-default">
                            <div class="panel-heading active">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne1">
                                     여행 읽어주는 남자
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>

                            <div id="collapseOne1" class="panel-collapse collapse in">
                              <div class="panel-body">
                                  <div class="media accordion-inner">
                                        <div class="pull-left">
                                           <a href="http://bya-bya.com/220312404377" target="blank"><img class="img-responsive" src="resources/corlate/images/accodian1.jpg" width="150" height="150"></a>
                                        </div>
                                        <div class="media-body">
                                             <h5>전세계50개국 배낭여행한 남자가 읽어주는 여행칼럼</h5>
                                             <p>김제동과 주진우의 애국소년단이 들려주는 팟캐스트 형태의 방송!애국하자!청춘,청년,국가,애국,연애 이런주제로 이야기를 나누는 내용입니다.</p>
                                        </div>
                                  </div>
                              </div>
                            </div>
                          </div>

                          <div class="panel panel-default" style="background-color: white;">
                            <div class="panel-heading" >
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseTwo1">
                                        여행은 떠나는 자의 몫
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
                            <div id="collapseTwo1" class="panel-collapse collapse" style="background-color: white;">
                               <div class="media accordion-inner" style="margin-top:20px;margin-bottom:15px;margin-right:10px;">
                                     <div class="pull-left" >
                                       <a href="http://m.post.naver.com/viewer/postView.nhn?volumeNo=25087&memberNo=174998&vType=VERTICAL"  target="blank"><img class="img-responsive" src="resources/corlate/images/accodian2.jpg" width="150" height="150" style="margin-top:5px;margin-left: 10px;"></a>
                                      </div>
                                    <div class="media-body" >
                                        <h5>여행칼럼 '걸으며 생각하며'</h5><br>'행복한 마음'이란 뜻을가진 딜쿠샤의 전경을 배경으로한 여행작가 문일식의 여행칼럼입니다.<br>
                                    </div>
                                </div> 
                            </div>
                         </div>

                          <div class="panel panel-default" style="background-color: white;">
                            <div class="panel-heading">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseThree1">
                                        음식 특집으로 한 번 몰고가봐?
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
                            <div id="collapseThree1" class="panel-collapse collapse" style="background-color: white;">
                             <div class="pull-left" style="margin-top:20px;margin-bottom:20px;margin-right:15px;">
                                <a href="http://m.post.naver.com/viewer/postView.nhn?volumeNo=18992&memberNo=1900&vType=VERTICAL"  target="blank"><img class="img-responsive" src="resources/corlate/images/accodian3.jpg" width="150" height="150" style="margin-top:10px;margin-left: 10px;"></a> 
                              </div>
                              <div class="media-body">
                                  <h5> 여행칼럼이 점점 음식으로 흘러가는 것 같습니다.</h5><br> 이전 칼럼에서 음식으로 본 해외여행이라는 주제로 서구 식문화도 재조명해보고 세계여행을 하면서 맛보았던 맛있었던 음식에 관해서도 이야기했었죠. 
                                
                              </div>
                            </div>
                         </div>

             
                        </div><!--/#accordion1-->
                </div>
                </div>
                        </div><!--/#accordion1-->
                    </div>
                </div>

            </div><!--/.row-->
        </div><!--/.container-->
    </section><!--/#middle-->
    
    <br>
    
    <!--------------------------------------- ---------------------------->
    
    
 <section id="recent-works">
        <div class="container">
            <div class="center wow fadeInDown">
                <h2>Tour Epilogue</h2>
                <p class="lead">감동의 순간을 우리 모두 함께 해요</p>
            </div>

            <div class="row">
            
            <c:forEach items="${user_list_main}" var="dto">
                <div class="col-xs-12 col-sm-4 col-md-3" >
                    <div class="recent-work-wrap" onclick="location.href='usercontentview?user_num=${dto.user_num}'">
                        <img class="img-responsive" src="${dto.mem_pic }" alt="">
                        <div class="overlay">
                            <div class="recent-work-inner">
                                <h3><a href="usercontentview?user_num=${dto.user_num}"></a></h3>
                                 <h2 style="color: black">${dto.user_title}&nbsp; (${dto.user_replynum})</h2>
                            	번호 : ${dto.user_num}<br>
                            	작성자 : ${dto.mem_id }<br>
                                	작성일 : ${dto.user_date}<br>
                                	추천수 : ${dto.user_good}<br>
                                
                            </div> 
                        </div>
                    </div>
                </div>   
			</c:forEach>
			
			
			
		
			
			
			
            </div><!-- row -->
        </div><!-- container -->
    </section><!-- #recent-works -->
 
<br><br>
 <section id="services" class="service-item">
	   <div class="container">
            <div class="center wow fadeInDown"><br>
                <h2>Tour Mate</h2>
                <p class="lead">같이 여행을 떠날 Tour Mate를 찾습니다.</p>
            </div>

            <div class="row">
			<c:forEach items="${mate_list}" var="dto">
			<center>
                <div class="col-sm-6 col-md-4">
                    <div class="media services-wrap wow fadeInDown"  onclick="location.href='matecontentview?mate_num=${dto.mate_num}&mem_id=${dto.mem_id}'">
                        <div class="pull-left">
                            <img class="img-responsive" src="">
                        </div>
                     
                        <div class="media-body">
                            <h5 class="media-heading">
                            <a href="matecontentview?mate_num=${dto.mate_num}&mem_id=${dto.mem_id}">${dto.mate_num }.&nbsp;${dto.mate_title }
                            </h5><br>
                            <h4 class="media-heading">
                            작성자&nbsp;:&nbsp;${dto.mem_id }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;모집인원&nbsp;:&nbsp;${dto.mate_present }/${dto.mate_max } </a>
                            </h4>
                            <p></p>
                       
                        </div>
                    </div>
                </div>
                </center>
                </c:forEach>
                                              
            </div><!--/.row-->
        </div><!--/.container-->
    </section><!--/#services-->
   
    <script src="resources/corlate/js/jquery.js"></script>
    <script src="resources/corlate/js/bootstrap.min.js"></script>
    <script src="resources/corlate/js/jquery.prettyPhoto.js"></script>
    <script src="resources/corlate/js/jquery.isotope.min.js"></script>
    <script src="resources/corlate/js/main.js"></script>
    <script src="resources/corlate/js/wow.min.js"></script>

</html>