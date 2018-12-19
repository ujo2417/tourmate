<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="resources/css/table.css">
<script language="javascript">
<!--
	function begin() {
		document.replymodifyform.re_content.focus();
	}
	function checkIt() {
		if (!document.replymodifyform.re_content.value) {
			// alertify.alert("댓글을 입력하지 않으셨습니다.");
			document.replymodifyform.re_content.focus();
			return false;
		}

	}
	-->
	<!--
	function openUpdate(userinput) {
		if (userinput.id.value != userinput.mem_id.value) {
			alertify.alert("본인이 작성 한 글만 수정 할 수 있어요~");
			return false;
		} else {
			return true;
		}

	}
	function openDelete(userinput) {
		if (userinput.id.value != userinput.mem_id.value) {
			alertify.alert("본인이 작성 한 글만 지울 수 있어요~");
			return false;
		} else {
			document.location.href = 'freedelete?free_num=${content_view.free_num}';
			return true;
		}
	}
	-->
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>

		 <br><br><br>
	  <div class="center wow fadeInDown">
              <center> <img src="resources/corlate/images/logo/communitylogo.png" width="170px" height="150px" /></center>
               
            </div>
	 
	
		<table class="type06">

			<form action="freemodifyview" method="post">

				<input type="hidden" name="free_num"
					value="${content_view.free_num}">

				<tr>
					<th scope="row" class="even">번호</th>
					<th align="center" class="even">${content_view.free_num}</th>
					<th scope="row" class="even">이름</th>
					<th class="even" align="center">${content_view.mem_id}</th>
					<th scope="row" class="even">히트</th>
					<th align="center" class="even">${content_view.free_readcount}</th>

				</tr>
				<tr>


					<th >제목</th>
					<td colspan="5" align="center">${content_view.free_title}</td>
				</tr>
				<tr>
					
					<td colspan="6" class="even" height="400">${content_view.free_content}</td>
				</tr>
				<tr >
					<td colspan="6" >
						<input type="hidden" name="id"
						value="${ sessionScope.mem_id }"> <a href="freelist"><input type="button" value="목록"></a>
						&nbsp;&nbsp; <input type="hidden" name="mem_id"
						value="${content_view.mem_id }"> <input type="submit"
						value="수정" onclick="return openUpdate(this.form);" >
						&nbsp;&nbsp; <%-- <a href="freedelete?free_num=${content_view.free_num}">삭제</a> &nbsp;&nbsp;  --%>
						<input type="button" value="글삭제"
						onclick="return openDelete(this.form);" >
				</tr>

			</form>
		</table>
	<c:if test="${!empty sessionScope.mem_id}">
		<!-- 댓글쓰기 -->
		<form name="replymodifyform" action="freereplywrite" method="post"
			onSubmit="return checkIt()">
			<input type="hidden" name="re_freenum"
				value="${content_view.free_num}"> <input type="hidden"
				name="mem_id" value="${sessionScope.mem_id }"> <input
				type="text" name="re_content" size="55"> <input
				type="submit" value="댓글등록" >
		</form>
	</c:if>
	<br>
		<!-- 댓글출력 -->

<%-- 		<table class="type03">


			<c:forEach items="${reply_view}" var="re_dto">
				<form action="freereplydelete" method="post">
					<tr>
						<th scope="row" width="100px">${re_dto.mem_id }</th>
						<td>${re_dto.re_content}</td>
						<td>${re_dto.re_writedate}</td>
						<c:if test="${sessionScope.mem_id == re_dto.mem_id}">
							<form action="free_reply_delete" method="post">
								<input type="hidden" name="free_num"
									value="${content_view.free_num}"> <input type="hidden"
									name="re_num" value="${re_dto.re_num}">
								<td><input type="submit" value="삭제"></td>
							</form>
						</c:if>
					</tr>
					</form>
			</c:forEach>
			
		</table> --%>
		
		
		  
		  
		  <c:forEach items="${reply_view}" var="re_dto">
				<form action="freereplydelete" method="post">
				
                        <div>
                          <%--   <div class="pull-left post_comments">
                                <a href="#"><img src="resources/memberPic/${sessionScope.mem_pic}"width="200px"/></a>
                            </div> --%>
                            <div class="media-body post_reply_comments">
                                <h3 style="text-align: left">
					<c:if test="${re_dto.mem_grade <= 100 && re_dto.mem_grade>=0}">
						<img src="resources/grade/grade1.jpg" >
					</c:if>
					<c:if test="${re_dto.mem_grade>100 && re_dto.mem_grade<=300 }">
						<img src="resources/grade/grade2.jpg" >
					</c:if>
					<c:if test="${re_dto.mem_grade>300 && re_dto.mem_grade<1000 }">
						<img src="resources/grade/grade3.jpg" >
					</c:if>
					<c:if test="${re_dto.mem_grade>1000 && re_dto.mem_grade<2500 }">
						<img src="resources/grade/grade4.jpg" >
					</c:if>
					<c:if test="${re_dto.mem_grade>2500}">
						<img src="resources/grade/grade5.jpg" >
					</c:if>${re_dto.mem_id }</h3>
                                <h4 style="text-align: left">${re_dto.re_writedate}</h4>
                                <h5 style="text-align: left">${re_dto.re_content}</h5>
                                  <c:if test="${sessionScope.mem_id == re_dto.mem_id}">
                       <form action="free_reply_delete" method="post">
								<input type="hidden" name="free_num"
									value="${content_view.free_num}"> <input type="hidden"
									name="re_num" value="${re_dto.re_num}">
								<input type="submit" value="삭제">
							</form>
							</c:if>
                            </div>
                        </div>
                      
                </form>
                <br>
			</c:forEach>

		<%-- 	<table width="500" cellpadding="0" cellspacing="0" border="1">

		<c:forEach items="${reply_view}" var="re_dto">
			<form action="freereplydelete" method="post">
				<tr>
					<td>${re_dto.mem_id }
					<td>${re_dto.re_content}</td>
					<td>${re_dto.re_writedate}</td>
					<c:if test="${sessionScope.mem_id == re_dto.mem_id}">
						<form action="free_reply_delete" method="post">
							<input type="hidden" name="free_num"
								value="${content_view.free_num}"> <input type="hidden"
								name="re_num" value="${re_dto.re_num}">
							<td><input type="submit" value="댓글삭제"></td>
						</form>
					</c:if>
				</tr>
		</c:forEach>
		</form>
	</table> --%>
	</center>
</body>
</html>