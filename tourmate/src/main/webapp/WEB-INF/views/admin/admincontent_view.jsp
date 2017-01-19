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
     -->
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table width="500" cellpadding="0" cellspacing="0" border="1">
			
			<input type="hidden" name="free_num" value="${content_view.free_num}">
			<tr>
				<td width="50"> 번호 </td>
				<td> ${content_view.free_num} </td>
			</tr>
			<tr>
				<td > 히트 </td>
				<td> ${content_view.free_readcount} </td>
			</tr>
			<tr>
				<td > 이름 </td>
				<td>${content_view.mem_id}</td>
			</tr>
			<tr>
				<td > 제목 </td>
				<td> ${content_view.free_title}</td>
			</tr>
			<tr>
				<td> 내용 </td>
				<td height = "200"> ${content_view.free_content}</td>
			</tr>
			<tr >
				<td colspan="2">
				<a href="adminFreelist">목록보기</a> &nbsp;&nbsp; 
				<a href="adminFreelistDelete?free_num=${content_view.free_num}">삭제</a> &nbsp;&nbsp; 
				
			</tr>
		</table>
		
		<!-- 댓글쓰기 -->
		<form name="replymodifyform" action="adminfreereplywrite" method="post"  onSubmit="return checkIt()">
		<input type="hidden" name="re_freenum" value="${content_view.free_num}" >
		<input type="hidden" name="mem_id" value="${sessionScope.mem_id }">
		<input type="text" name="re_content" size = "55"> 
		<input type="submit" value="댓글등록">
		</form>
		
		<!-- 댓글출력 -->
		<table width="500" cellpadding="0" cellspacing="0" border="1">
		
		<c:forEach items="${reply_view}" var="re_dto">
		<form action="adminfreereplydelete" method="post">
		<tr>	
			<td>${re_dto.mem_id }
			<td>${re_dto.re_content}</td>	
			<td>${re_dto.re_writedate}</td>
		<c:if test="${sessionScope.mem_id == re_dto.mem_id}">                      
			<form action="free_reply_delete" method="post">
				<input type="hidden" name="free_num" value="${content_view.free_num}" >
				<input type="hidden" name="re_num" value="${re_dto.re_num}" >
				<td><input type="submit" value="댓글삭제"></td>
			</form>
		</c:if>
		</tr>
		</form>
		</c:forEach>
		
	</table>
	
</body>
</html>