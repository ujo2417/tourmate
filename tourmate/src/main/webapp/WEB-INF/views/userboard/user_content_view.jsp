<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script language="javascript">
     <!--
       function begin(){
         document.replymodifyform.re_content.focus();
       }
       function checkIt(){
         if(!document.replymodifyform.re_content.value){
          // alertify.alert("댓글을 입력하지 않으셨습니다.");
           document.replymodifyform.re_content.focus();
           return false;
         }
        
       }
       function popupOpen1(url){
    		var popUrl = url;	//팝업창에 출력될 페이지 URL
    		var popOption = "width=500, height=400, resizable=no, scrollbars=no, ,location=no, status=no, left=400, top=100;";    //팝업창 옵션(optoin)
    			window.open(popUrl,"",popOption); 
    		
    		}
     -->
</script>
<script language="javascript">
	function AjaxEx() {

		var user_num = "user_num=" + document.usermodifyview.user_num.value;
		var mem_id = "mem_id=" + document.usermodifyview.mem_id.value;
		$.ajax({
			url : "/usergood",
			type : "post",
			data : user_num,
			dataType : "json",
			success : function(data) {
				alert(data);
				location.reload(true);
			},

			error : function(request) {

				alert("실패당");

			}
		});

	}
	</script>
<head>
<link rel="stylesheet" href="/resources/css/table.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
	<table class="type06_8" >
		<form action="usermodifyview" name="usermodifyview" method="post">
			
			<input type="hidden" name="user_num" value="${content_view.user_num}"/>
			<input type="hidden" name="mem_id" value="${sessionScope.mem_id}"/>
			<tr>
				<th scope="row" class="even"> 번호 </th>
				<th align="center" class="even"> ${content_view.user_num} </th>
				<th scope="row" class="even"> 히트 </th>
				<th align="center" class="even"> ${content_view.user_readcount} </th>
				<th scope="row" class="even"> 이름 </th>
				<th align="center" class="even">${content_view.mem_id}</th>
			</tr>
			<tr>
				<th align="center"> 제목 </th>
				<td colspan="3" style="text-align: center"> ${content_view.user_title}</td>
				<th align="center"> 추천 </th>
				<td style="text-align: center"> ${content_view.user_good } </td>
				
			</tr>
			<tr>
				
				<td  colspan="6" class="even" height="400"> ${content_view.user_content}</td>
			</tr>
			<tr >
				
				<td colspan="6">
					<c:if test="${content_view.mem_id == sessionScope.mem_id }">
					<input type="submit" value="수정"  > &nbsp;&nbsp;
					<a href="userdelete?user_num=${content_view.user_num}"><input type="button" value="삭제"></a> &nbsp;&nbsp;
					</c:if>
					<a href="userlist"><input type="button" value="목록"></a> &nbsp;&nbsp; 
					<c:if test="${sessionScope.mem_id !=null }">
					
					<a href="javascript:popupOpen1('usergood?user_num=${content_view.user_num}&mem_id=${sessionScope.mem_id}')"><input type="button" value="추천하기" ></a>
					
					</c:if>
					<!-- onclick="AjaxEx()" -->
				</td>
				
			</tr>
			
		</form>
		</table>
		
		<!-- 댓글쓰기 -->	
			<c:if test="${!empty sessionScope.mem_id}">
		<form name="replymodifyform" action="userreplywrite" method="post"  onSubmit="return checkIt()" >
		<input type="hidden" name="re_usernum" value="${content_view.user_num}" >
		<input type="hidden" name="mem_id" value="${sessionScope.mem_id }">
		<input type="text" name="re_content" size = "55"> 
		<input type="submit" value="댓글등록" >
		</form>
		</c:if>
		<br>
		<%-- <!-- 댓글출력 -->
		<table width="500" cellpadding="0" cellspacing="0" border="1">
		
		<c:forEach items="${reply_view}" var="re_dto">
		<form action="userreplydelete" method="post">
		<tr>	
			<td>${re_dto.mem_id }
			<td>${re_dto.re_content}</td>	
			<td>${re_dto.re_writedate}</td>
		<c:if test="${sessionScope.mem_id == re_dto.mem_id}">                      
			<form action="user_reply_delete" method="post">
				<input type="hidden" name="user_num" value="${content_view.user_num}" >
				<input type="hidden" name="re_num" value="${re_dto.re_num}" >
				<td><input type="submit" value="댓글삭제"></td>
			</form>
		</c:if>
		</tr>
		
		</c:forEach>
		</form>
	</table> --%>
	
	 
		  <c:forEach items="${reply_view}" var="re_dto">
				<form action="freereplydelete" method="post">
				
                        <div>
                          <%--   <div class="pull-left post_comments">
                                <a href="#"><img src="resources/memberPic/${sessionScope.mem_pic}"width="200px"/></a>
                            </div> --%>
                            <div class="media-body post_reply_comments">
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
                       <form action="free_reply_delete" method="post">
								<input type="hidden" name="user_num"
									value="${content_view.user_num}"> <input type="hidden"
									name="re_num" value="${re_dto.re_num}">
								<input type="submit" value="삭제">
							</form>
							</c:if>
                            </div>
                        </div>
                      
                </form>
                <br>
			</c:forEach>
	</center>
</body>
</html>