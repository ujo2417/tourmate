<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
      function openCofirmid(userinput) {
         if(userinput.id.value==""){
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
      
  	function deleteCheck(){
       	if( confirm("정말로 회원을 삭제하시겠습니까?") == true){
			return true;
		}else{
			return false;
		}
  	}
  	
  	function select(){
  		if(select.mem_id.value=="writer")
  	}
      
   </script>
</head>
<body>
<h1><b><font color="red">메이트게시판</font></b></h1>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>번호</td>
			<td width="150">제목</td>
			<td>작성자</td>
			<td>날짜</td>
			<td>히트</td>
			<td>글삭제</td>
		</tr>
		<c:forEach items="${mate_list}" var="dto">
			<tr>
				<td>${dto.mate_num}</td>
				<td><a href="adminmatecontentview?mate_num=${dto.mate_num}">${dto.mate_title}&nbsp; (${dto.mate_replynum})</a></td>
				<td>${dto.mem_id }</td>
				<td>${dto.mate_date}</td>
				<td>${dto.mate_readcount}</td>
				<td colspan="5">
					<form action="adminmatedelete" method="post" onsubmit="return deleteCheck();">
						<input type="hidden" name="mate_num" value="${dto.mate_num }">
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
			<a href="adminmatelist?pageNum=${ startPage-5  }">[이전] </a>
		</c:if>

		<c:forEach var="i" begin="${startPage }" end="${ endPage }">
			<a href="adminmatelist?pageNum=${i}">[${ i }] </a>
		</c:forEach>

		<c:if test="${ endPage < pageCount }">
			<a href="adminmatelist?pageNum=${ startPage+5 }">[다음] </a>
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
            <form action="adminmatesearchlist" name="search" onSubmit="return openSearch()">
            <input  id="hrid1" type="text" name="mem_id" placeholder="작성자를 검색 하세요">
            <input  id="hrid2" type="text" name="mate_title" placeholder="제목을 검색 하세요">
            <input  id="hrid3" type="text" name="mate_content" placeholder="내용을 검색 하세요">
            <input class="button" type="submit" value="검색">
			</form>
		</td>
      </tr>     
	</table>
	<script type="text/javascript">
	$(function () {
		$("input[name='mate_title']").attr("type" , "hidden");
		$("input[name='mate_content']").attr("type" , "hidden");
	});
	 $('.searchSelect').change(function () {
		if ($('select option:selected').val() == "writer") {
			$("input[name='mem_id']").attr("type" , "text");
			$("input[name='mate_title']").attr("type" , "hidden");
			$("input[name='mate_content']").attr("type" , "hidden");
		}
		if ($('select option:selected').val() == "title") {
			$("input[name='mem_id']").attr("type" , "hidden");
			$("input[name='mate_title']").attr("type" , "text");
			$("input[name='mate_content']").attr("type" , "hidden");
		}
		if ($('select option:selected').val() == "contents") {
			$("input[name='mem_id']").attr("type" , "hidden");
			$("input[name='mate_title']").attr("type" , "hidden");
			$("input[name='mate_content']").attr("type" , "text");
		}
		
	}); 
</script>
</body>
</html>