
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-1.7.js"
	type="text/javascript"></script>
<link rel="stylesheet" href="/resources/css/table.css">
<html>



<script language="javascript">
	function AjaxEx() {

		var mate_num = "mate_num=" + document.check.mate_num.value;
		$.ajax({
			url : "/mateapp",
			type : "post",
			data : mate_num,
			dataType : "json",
			success : function(data) {
				alert(data);
			},

			error : function(request) {

				alert("실패당");

			}
		});

	}
	<!--
	function begin() {
		document.replymodifyform.re_content.focus();
	}
	function checkIt() {

		if (!document.replymodifyform.re_content.value) {
			alertify.alert("댓글을 입력하지 않으셨습니다.");
			document.replymodifyform.re_content.focus();
			return false;
		}

	}

	-->
</script>
<script type="text/javascript">
<!-- 상세보기 팝업
function popupOpen(url){
	var popUrl = url;	//팝업창에 출력될 페이지 URL
	var popOption = "width=500, height=400, resizable=no, scrollbars=no, ,location=no, status=no, left=400, top=100;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption); 
	}


function popupOpen1(url){
	var popUrl = url;	//팝업창에 출력될 페이지 URL
	var popOption = "width=500, height=400, resizable=no, scrollbars=no, ,location=no, status=no, left=400, top=100;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption); 
	
	}

//-->
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>


		<center>
			<br>
			<section id="recent-works">
			<div class="container">
				<div class="center wow fadeInDown">
					<img src="/resources/corlate/images/logo/matelogo.png"
						width="200px" height="180px" />

				</div>
			</div>
			</section>
			<table class="type04_1">
				<form action="matemodifyview" method="post">
					<input type="hidden" name="mate_num"
						value="${content_view.mate_num}">

					<tr>
						<th>Mate List</th>

						<th>작성자</th>

						<th><a href="javascript:popupOpen('memberDetail?mem_id=${content_view.mem_id}');">${content_view.mem_id }</a>
						</th>

						<th>조회수</th>
						<th>${content_view.mate_readcount}</th>
					</tr>

					<tr>
						<td rowspan="3"><c:forEach items="${matemem }" var="matemem">


	<c:if test="${value == 1 }">
									<%-- <input type="button" value="상세 정보 보기"
										onclick="location.href='memberDetail?mem_id=${matemem.mem_id}' ">&nbsp;&nbsp; --%>
					<a href="javascript:popupOpen('memberDetail?mem_id=${matemem.mem_id}');" > ${matemem.mem_id }	</a>					
	</c:if>
	<c:if test="${value != 1 }">
	 ${matemem.mem_id }
	</c:if>

								<c:if test="${matemem.mem_id == sessionScope.mem_id }">
									<c:if test="${mem_id != sessionScope.mem_id }">
										
										<a href="matedrop?mem_id=${matemem.mem_id}&mate_num=${matemem.mate_num }&writer_id=${mem_id }">탈퇴</a>
										
										<%-- <input type="button" value="탈퇴"
											onclick="location.href='matedrop?mem_id=${matemem.mem_id}&mate_num=${matemem.mate_num }&writer_id=${mem_id }' "> --%>
									</c:if>
								
								</c:if>

								<c:if test="${mem_id == sessionScope.mem_id }">
									<c:if test="${matemem.mem_id != sessionScope.mem_id }">
									
									<a href="mateexile?mem_id=${matemem.mem_id}&mate_num=${matemem.mate_num }&writer_id=${mem_id }">/ 추방</a>
										<%-- <input type="button" value="추방"
											onclick="location.href='mateexile?mem_id=${matemem.mem_id}&mate_num=${matemem.mate_num }&writer_id=${mem_id }' "> --%>
											
									</c:if>
								</c:if>
								<br>
							</c:forEach></td>
						<th>신청인원</th>
						<th>${content_view.mate_present}/${content_view.mate_max}</th>
						<th>여행기간</th>
						<td>

							${content_view.mate_date1}&nbsp;&nbsp;~&nbsp;&nbsp;${content_view.mate_date2}
						</td>

					</tr>

					<tr>
						<td height="20px" colspan="4"><h2>${content_view.mate_title}</h2></td>

					</tr>
					<tr>
						<td height="400px" colspan="4">${content_view.mate_content}</td>
					</tr>
						<tr>
				<td >
					<a href="matelist"><input type="button" value="목록"></a> &nbsp;&nbsp; 
					<c:if test="${sessionScope.mem_id == content_view.mem_id }">
						<input type="submit" value="수정" > &nbsp;&nbsp;
						<a href="matedelete?mate_num=${content_view.mate_num}"><input type="button" value="삭제"></a> &nbsp;&nbsp; 
					</c:if>
				<!-- </td> -->
			<!-- </tr> -->
		</form>
		</td>
		<td colspan="4">
		<form action="" name="check">
			<c:if test="${sessionScope.mem_id != null }">
			<!-- <tr> -->
				<!-- <td colspan="2">  -->
					<!-- 전체사용자 용-->
					<%-- <input type="button" value="멤버보기" onclick="location.href='matemem?mate_num=${content_view.mate_num}&mem_id=${content_view.mem_id }' "> --%>
					<!-- 게시자 용 -->
					<c:if test="${sessionScope.mem_id == content_view.mem_id}">
						<a href="javascript:popupOpen1('mateapplist?mate_num=${content_view.mate_num}')"><input type="button" value="신청현황"></a>
					</c:if>
					<!-- 게스트 용 -->
					<c:if test="${sessionScope.mem_id != content_view.mem_id }">
						<c:if test="${content_view.mate_present >= content_view.mate_max }">
							<input type="button" value="신청하기" disabled="disabled" onclick="AjaxEx()">
						</c:if>
						<c:if test="${content_view.mate_present < content_view.mate_max }">
							<input type="hidden" value="${content_view.mate_num }" id="mate_num">
							<input type="hidden" value="${sessionScope.mem_id }" id="mem_id">
							<%-- <input type="button" value="신청하기"  onclick="location.href='mateapp?mate_num=${content_view.mate_num}&mem_id=${sessionScope.mem_id}' "> --%>
							<a href="javascript:popupOpen1('mateapp?mate_num=${content_view.mate_num}&mem_id=${sessionScope.mem_id}')"><input type="button" value="신청하기"></a>
							
<%-- 		onclick="AjaxEx()"					  
 --%>				</c:if>
					</c:if>
				</td>
			</tr>
			</c:if>
			</form>
	</table>
</form>



			<!-- =================================================== 댓글 ================================ -->
			<!-- 댓글쓰기 -->
			<c:if test="${sessionScope.mem_id != null }">
				<form name="replymodifyform" action="matereplywrite" method="post"
					onSubmit="return checkIt()">
					<input type="hidden" name="re_matenum"
						value="${content_view.mate_num}"> <input type="hidden"
						name="mem_id" value="${sessionScope.mem_id }"> <input
						type="text" name="re_content" size="55"> <input
						type="submit" value="댓글등록" >
				</form>
			</c:if><br>
			
			<!-- 댓글출력 -->
			<center>
			  <c:forEach items="${reply_view}" var="re_dto">
				<form action="matereplydelete" method="post">
				
                       <center>
                            <div  class="media-body post_reply_comments">
                                <h3 style="text-align: left"><c:if test="${re_dto.mem_grade <= 100 && re_dto.mem_grade >=0}">
						<img src="/resources/grade/grade1.jpg" >
					</c:if>
					<c:if test="${re_dto.mem_grade>100 && re_dto.mem_grade<=300 }">
						<img src="/resources/grade/grade2.jpg" >
					</c:if>
					<c:if test="${re_dto.mem_grade>300 && re_dto.mem_grade<1000 }">
						<img src="/resources/grade/grade3.jpg" >
					</c:if>
					<c:if test="${re_dto.mem_grade>1000 && re_dto.mem_grade<2500 }">
						<img src="/resources/grade/grade4.jpg" >
					</c:if>
					<c:if test="${re_dto.mem_grade>2500}">
						<img src="/resources/grade/grade5.jpg" >
					</c:if>${re_dto.mem_id }</h3>
                                <h4 style="text-align: left">${re_dto.re_writedate}</h4>
                                <h5 style="text-align: left">${re_dto.re_content}</h5>
                                  <c:if test="${sessionScope.mem_id == re_dto.mem_id}">
                       <form action="mate_reply_delete" method="post">
								<input type="hidden" name="mate_num"
									value="${content_view.mate_num}"> <input type="hidden"
									name="re_num" value="${re_dto.re_num}">
								<input type="submit" value="삭제" >
							</form>
							</c:if>
                            </div>
                            </center>
                        </div>
                      
                </form>
                <br>
			</c:forEach>
			
</center>
			
		</center>
</body>
</html>