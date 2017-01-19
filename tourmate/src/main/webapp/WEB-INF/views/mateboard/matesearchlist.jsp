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
				<img src="/resources/corlate/images/logo/matelogo.png" width="200px"
					height="180px" />

				<p class="lead"></p>
			</div>
		</div>
		</section>

 <section id="services" class="service-item">
	   <div class="container">
            <div class="center wow fadeInDown"><br>
           <h2></h2>
                <p class="lead">　</p>
         

            <div class="row">
			<c:forEach items="${mate_list}" var="dto">
			<center>
                <div class="col-sm-6 col-md-4">
                    <div class="media services-wrap wow fadeInDown">
                        <div class="pull-left">
                            <img class="img-responsive" src="">
                        </div>
                     
                        <div class="media-body">
                            <h5 class="media-heading">
                            <a href="matecontentview?mate_num=${dto.mate_num}&mem_id=${dto.mem_id}">${dto.mate_title }
                            </h5><br>
                            <h4 class="media-heading">
                            작성자&nbsp;:&nbsp;${dto.mem_id }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;모집인원&nbsp;:&nbsp;${dto.mate_present }/${dto.mate_max }
                            </h4><br>
                            <h5 class="media-heading">
                            여행기간&nbsp;&nbsp;:&nbsp;&nbsp;${dto.mate_date1 }&nbsp;~&nbsp;${dto.mate_date2 }
                            </h5></a>
                            <p></p>
                       
                        </div>
                    </div>
                </div>
                </center>
                </c:forEach>
                                              
            </div><!--/.row-->
            </div>
        </div><!--/.container-->
    </section><!--/#services-->

	<c:if test="${!empty sessionScope.mem_id}"> <a href="matewriteview">글작성</a></c:if><br>
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
				<a href="matelist?pageNum=${ startPage-5  }">[이전] </a>
			</c:if>

			<c:forEach var="i" begin="${startPage }" end="${ endPage }">
				<a href="matelist?pageNum=${i}">[${ i }] </a>
			</c:forEach>

			<c:if test="${ endPage < pageCount }">
				<a href="matelist?pageNum=${ startPage+5 }">[다음] </a>
			</c:if>
		</c:if>

		<h6>
			<b>글 목록(전체 글 : ${ count })</b>
		</h6>
		<table>
			<tr>
				<td><select name="select" class="searchSelect">
						<option value="writer">작성자</option>
						<option value="title">글제목</option>
						<option value="contents">글내용</option>
				</select></td>
				<td colspan="5">
					<form action="matesearchlist" name="search"
						onSubmit="return openSearch()">
						<input id="hrid1" type="text" name="mem_id"
							placeholder="작성자를 검색 하세요"> <input id="hrid2" type="text"
							name="mate_title" placeholder="제목을 검색 하세요"> <input
							id="hrid3" type="text" name="mate_content"
							placeholder="내용을 검색 하세요"> <input class="button"
							type="submit" value="검색" >
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


