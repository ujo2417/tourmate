<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>adminfreelist</title>
<script type="text/javascript">
	function deleteCheck(){
	       	if( confirm("정말로 회원을 삭제하시겠습니까?") == true){
				return true;
			}else{
				return false;
			}
	}
	      function openCofirmid(mateinput) {
         if(mateinput.id.value==""){
            alertify.alert("로그인 후 이용 가능합니다.");
            return;
         }
         location.href="matewriteview";
      }
      
      function openSearch() {
         if(search.subject.value==""){
            alertify.alert("검색어를 입력하세요.");
            return;
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
		<c:forEach items="${free_list}" var="dto">
			<tr>
				<td>${dto.free_num}</td>
				<td>${dto.mem_id }</td>
				<td><a href="adminfreecontentview?free_num=${dto.free_num}">${dto.free_title}&nbsp; (${dto.free_replynum})</a></td>
				<td>${dto.free_date}</td>
				<td>${dto.free_readcount}</td>
			<td colspan="5">
			<form action="adminFreelistDelete" method="post" onsubmit="return deleteCheck();">
				<input type="hidden" name="free_num" value="${dto.free_num }">
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
			<a href="adminFreeSearchlist?pageNum=${ startPage-5  }&free_title=${free_title}&free_content=${free_content}&mem_id=${mem_id}">[이전] </a>
		</c:if>

			<c:forEach var="i" begin="${startPage }" end="${ endPage }">
			<a href="adminFreeSearchlist?pageNum=${i}&free_title=${free_title}&free_content=${free_content}&mem_id=${mem_id}">[${ i }] </a>
		</c:forEach>

		<c:if test="${ endPage < pageCount }">
			<a href="adminFreeSearchlist?pageNum=${ startPage+5 }&free_title=${free_title}&free_content=${free_content}&mem_id=${mem_id}">[다음] </a>
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
            <form action="adminFreeSearchlist" name="search" onSubmit="return openSearch()">
            <input  id="hrid1" type="text" name="mem_id" placeholder="작성자를 검색 하세요">
            <input  id="hrid2" type="text" name="free_title" placeholder="제목을 검색 하세요">
            <input  id="hrid3" type="text" name="free_content" placeholder="내용을 검색 하세요">
            <input class="button" type="submit" value="검색">
			</form>
		</td>
      </tr>     
	</table>
	<script type="text/javascript">
	$(function () {
		$("input[name='free_title']").attr("type" , "hidden");
		$("input[name='free_content']").attr("type" , "hidden");
	});
	 $('.searchSelect').change(function () {
		if ($('select option:selected').val() == "writer") {
			$("input[name='mem_id']").attr("type" , "text");
			$("input[name='free_title']").attr("type" , "hidden");
			$("input[name='free_content']").attr("type" , "hidden");
		}
		if ($('select option:selected').val() == "title") {
			$("input[name='mem_id']").attr("type" , "hidden");
			$("input[name='free_title']").attr("type" , "text");
			$("input[name='free_content']").attr("type" , "hidden");
		}
		if ($('select option:selected').val() == "contents") {
			$("input[name='mem_id']").attr("type" , "hidden");
			$("input[name='free_title']").attr("type" , "hidden");
			$("input[name='free_content']").attr("type" , "text");
		}
		
	}); 
</script>
</body>
</html>