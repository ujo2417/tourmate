<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/table.css">


<title>searchlist</title>


</head>
<body>
	<center>
		<br>
		<br>
		<br>

		<section id="recent-works">
		<div class="container">
			<div class="center wow fadeInDown">
			<img src="/resources/corlate/images/logo/communitylogo.png" width="200px" height="180px" />
				<p class="lead">자유롭게, 즐겁게, 대화를 나주세요.</p>
			</div>
		</div>
		</section>
			<div>

				<table class="type09">
					<thead>
						<tr height="60px">
							<th scope="cols" align="center" width="150">번호</th>
							<th scope="cols" align="center" width="150">이름</th>
							<th scope="cols" align="center" width="400">제목</th>
							<th scope="cols" align="center" width="150">날짜</th>
							<th scope="cols" align="center" width="150">히트</th>
						</tr>
					</thead>
					<c:forEach items="${notice_list}" var="dto">
						<tbody>
							<tr>
								<td align="center">${dto.notice_num}</td>
								<td align="center"><c:if test="${dto.mem_grade <= 100}">
						<img src="/resources/grade/grade1.jpg" >
					</c:if>
					<c:if test="${dto.mem_grade>100 && dto.mem_grade<=300 }">
						<img src="/resources/grade/grade2.jpg" >
					</c:if>
					<c:if test="${dto.mem_grade>300 && dto.mem_grade<1000 }">
						<img src="/resources/grade/grade3.jpg" >
					</c:if>
					<c:if test="${dto.mem_grade>1000 && dto.mem_grade<2500 }">
						<img src="/resources/grade/grade4.jpg" >
					</c:if>
					<c:if test="${dto.mem_grade>2500}">
						<img src="/resources/grade/grade5.jpg" >
					</c:if>${dto.mem_id }</td>
								<td align="center"><a
									href="noticecontentview?notice_num=${dto.notice_num}">${dto.notice_title}&nbsp;
										(${dto.notice_replynum})</a></td>
								<td align="center">${dto.notice_date}</td>
								<td align="center">${dto.notice_readcount}</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
				<br>
				<c:if test="${mem_id != null }">
					<a href="noticewriteview">글작성</a>


				</c:if>
				<br>


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
						<a href="noticesearchlist?pageNum=${ startPage-5  }&notice_title=${notice_title}&notice_content=${notice_content}&mem_id=${mem_id}">[이전] </a>
					</c:if>

					<c:forEach var="i" begin="${startPage }" end="${ endPage }">
						<a href="noticesearchlist?pageNum=${i}&notice_title=${notice_title}&notice_content=${notice_content}&mem_id=${mem_id}">[${ i }] </a>
					</c:forEach>

					<c:if test="${ endPage < pageCount }">
						<a href="noticesearchlist?pageNum=${ startPage+5 }&notice_title=${notice_title}&notice_content=${notice_content}&mem_id=${mem_id}">[다음] </a>
					</c:if>
				</c:if>

			</div>



	
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
            <form action="noticesearchlist" name="search" onSubmit="return openSearch()">
            <input  id="hrid1" type="text" name="mem_id" placeholder="작성자를 검색 하세요">
            <input  id="hrid2" type="text" name="notice_title" placeholder="제목을 검색 하세요">
            <input  id="hrid3" type="text" name="notice_content" placeholder="내용을 검색 하세요">
            <input class="button" type="submit" value="검색">
			</form>
		</td>
      </tr>     
	</table>
	<script type="text/javascript">
	$(function () {
		$("input[name='notice_title']").attr("type" , "hidden");
		$("input[name='notice_content']").attr("type" , "hidden");
	});
	 $('.searchSelect').change(function () {
		if ($('select option:selected').val() == "writer") {
			$("input[name='mem_id']").attr("type" , "text");
			$("input[name='notice_title']").attr("type" , "hidden");
			$("input[name='notice_content']").attr("type" , "hidden");
		}
		if ($('select option:selected').val() == "title") {
			$("input[name='mem_id']").attr("type" , "hidden");
			$("input[name='notice_title']").attr("type" , "text");
			$("input[name='notice_content']").attr("type" , "hidden");
		}
		if ($('select option:selected').val() == "contents") {
			$("input[name='mem_id']").attr("type" , "hidden");
			$("input[name='notice_title']").attr("type" , "hidden");
			$("input[name='notice_content']").attr("type" , "text");
		}
		
	}); 
</script>
	</center>
</body>
</html>


