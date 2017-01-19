<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>adminuserlist</title>
<script type="text/javascript">
	function deleteCheck(){
	       	if( confirm("정말로 작성글을 삭제하시겠습니까?") == true){
				return true;
			}else{
				return false;
			}
	}
</script>
</head>
<body>

	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td width="150">제목</td>
			<td>날짜</td>
			<td>히트</td>
			<td>글삭제</td>
		</tr>
		<c:forEach items="${user_list}" var="dto">
			<tr>
				<td>${dto.user_num}</td>
				<td>${dto.mem_id }</td>
				<td><a href="adminusercontentview?user_num=${dto.user_num}">${dto.user_title}&nbsp; (${dto.user_replynum})</a></td>
				<td>${dto.user_date}</td>
				<td>${dto.user_readcount}</td>
			<td colspan="5">
			<form action="adminuserdelete" method="post" onsubmit="return deleteCheck();">
				<input type="hidden" name="user_num" value="${dto.user_num }">
				<input type="submit" value="delete">
			</form>
			</td>
			</tr>
		</c:forEach>
	</table>

	<c:if test="${ count > 0 }">
		<!--  전체 페이지의 수를 연산 -->
		<c:set var="pageCount"
			value="${ count / pageSize + (count % pageSize ==0 ? 0 : 1) }" />
		<c:set var="startPage" value="${ 1 }" />
		<!-- 차후 수정!! -->
		<c:set var="pageBlock" value="${ 5 }" />


		<fmt:parseNumber var="result" value="${ currentPage / pageBlock }"
			integerOnly="true" />
		<c:if test="${ currentPage % pageBlock != 0 }">
			<c:set var="startPage" value="${ result * pageBlock + 1 }" />
		</c:if>

		<c:if test="${ currentPage % pageBlock == 0 }">
			<c:set var="startPage" value="${ (result - 1) * pageBlock + 1 }" />
		</c:if>

		<c:set var="endPage" value="${ startPage + pageBlock -1 }" />

		<c:if test="${ endPage > pageCount }">
			<c:set var="endPage" value="${ pageCount }" />
		</c:if>

		<c:if test="${startPage >5 }">
			<a href="adminUserlist?pageNum=${ startPage-5  }">[이전] </a>
		</c:if>

			<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="adminUserlist?pageNum=${i}">[${ i }] </a>
		</c:forEach>

		<c:if test="${ endPage < pageCount }">
			<a href="adminUserlist?pageNum=${startPage+5}">[다음] </a>
		</c:if>
	</c:if>

<h6><b>글 목록(전체 글 : ${ count })</b></h6>
   <table>
      <tr>
      <td>
    		<select name="select" class="searchSelect">
	          	<option value="writer">작성자</option>
	          	<option value="title">글제목</option>
	          	<option value="contents">글내용</option>
        	</select>
      </td>
         <td colspan="5">
            <form action="adminUserSearchlist" name="search" onSubmit="return openSearch()">
            <input  id="hrid1" type="text" name="mem_id" placeholder="작성자를 검색 하세요">
            <input  id="hrid2" type="text" name="user_title" placeholder="제목을 검색 하세요">
            <input  id="hrid3" type="text" name="user_content" placeholder="내용을 검색 하세요">
            <input class="button" type="submit" value="검색">
			</form>
		</td>
      </tr>     
	</table>
<script type="text/javascript">
	$(function () {
		$("input[name='user_title']").attr("type" , "hidden");
		$("input[name='user_content']").attr("type" , "hidden");
	});
	 $('.searchSelect').change(function () {
		if ($('select option:selected').val() == "writer") {
			$("input[name='mem_id']").attr("type" , "text");
			$("input[name='user_title']").attr("type" , "hidden");
			$("input[name='user_content']").attr("type" , "hidden");
		}
		if ($('select option:selected').val() == "title") {
			$("input[name='mem_id']").attr("type" , "hidden");
			$("input[name='user_title']").attr("type" , "text");
			$("input[name='user_content']").attr("type" , "hidden");
		}
		if ($('select option:selected').val() == "contents") {
			$("input[name='mem_id']").attr("type" , "hidden");
			$("input[name='user_title']").attr("type" , "hidden");
			$("input[name='user_content']").attr("type" , "text");
		}
		
	}); 
</script>
</body>
</html>