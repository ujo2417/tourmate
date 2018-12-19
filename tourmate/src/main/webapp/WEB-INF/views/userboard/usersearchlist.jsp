<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
</head>
<%--  <script type="text/javascript">
      function openCofirmid(userinput) {
         if(userinput.id.value==""){
            alertify.alert("로그인 후 이용 가능합니다.");
            return;
         }
         location.href="userwriteview";
      }
      
      function openSearch() {
         if(search.subject.value==""){
            alertify.alert("검색어를 입력하세요.");
            return;
         }
      }
      
   </script>
   
<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td width="150">제목</td>
			<td>날짜</td>
			<td>히트</td>
		</tr>
		<c:forEach items="${user_list}" var="dto">
			<tr>
				<td>${dto.user_num}</td>
				<td>${dto.mem_id }</td>
				<td><a href="usercontentview?user_num=${dto.user_num}">${dto.user_title}&nbsp; (${dto.user_replynum})</a></td>
				<td>${dto.user_date}</td>
				<td>${dto.user_readcount}</td>
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
			<a href="usersearchlist?pageNum=${ startPage-5  }&user_title=${user_title}&user_content=${user_content}&mem_id=${mem_id}">[이전] </a>
		</c:if>

		<c:forEach var="i" begin="${startPage }" end="${ endPage }">
			<a href="usersearchlist?pageNum=${i}&user_title=${user_title}&user_content=${user_content}&mem_id=${mem_id}">[${ i }] </a>
		</c:forEach>

		<c:if test="${ endPage < pageCount }">
			<a href="usersearchlist?pageNum=${ startPage+5 }&user_title=${user_title}&user_content=${user_content}&mem_id=${mem_id}">[다음] </a>
		</c:if>
	</c:if>

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
            <form action="usersearchlist" name="search" onSubmit="return openSearch()">
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
</script> --%>
<script type="text/javascript">
      function openCofirmid(userinput) {
         if(userinput.id.value==""){
            alertify.alert("로그인 후 이용 가능합니다.");
            return;
         }
         location.href="userwriteview";
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
<center>
<br><br><br>
			<section id="recent-works">
       		 <div class="container">
            <div class="center wow fadeInDown">
            <img src="resources/corlate/images/logo/epiloguelogo.png" width="200px" height="180px" />
            
                <p class="lead">감동의 순간을 우리 모두 함께 해요</p>
            </div>

            <div class="row">
              <c:forEach items="${user_list}" var="dto">
                <div class="col-xs-12 col-sm-4 col-md-3">
              <a href="usercontentview?user_num=${dto.user_num}">
                    <div class="recent-work-wrap">
                        <img class="img-responsive" src="${dto.mem_pic }" height="200px" alt="">
                        
                        
                        <div class="overlay">
                        
                            <div style="text-align: left;" class="recent-work-inner">
                            
                             <h2 style="color: black">${dto.user_title}&nbsp; (${dto.user_replynum})</h2>
                            	번호 : ${dto.user_num}<br>
                            	작성자 : ${dto.mem_id }<br>
                                	작성일 : ${dto.user_date}<br>
                                	조회수 : ${dto.user_readcount}<br>
                               <!--  resources/corlate/images/portfolio/full/item1.png -->
                             
                            </div> 
                        </div>
                      
                        
                    </div>
                  </a> 
                </div>   
  				</c:forEach>
            </div><!--/.row-->
            
            
        </div><!--/.container-->
    </section><!--/#recent-works-->


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
			<a href="userlist?pageNum=${ startPage-5  }">[이전] </a>
		</c:if>

		<c:forEach var="i" begin="${startPage }" end="${ endPage }">
			<a href="userlist?pageNum=${i}">[${ i }] </a>
		</c:forEach>

		<c:if test="${ endPage < pageCount }">
			<a href="userlist?pageNum=${ startPage+5 }">[다음] </a>
		</c:if>
	</c:if>
	<br>
	<a href="userwriteview">글작성</a>
	
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
            <form action="usersearchlist" name="search" onSubmit="return openSearch()">
            <input  id="hrid1" type="text" name="mem_id" placeholder="작성자를 검색 하세요">
            <input  id="hrid2" type="text" name="user_title" placeholder="제목을 검색 하세요">
            <input  id="hrid3" type="text" name="user_content" placeholder="내용을 검색 하세요">
            <input class="button" type="button" value="검색" >
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
</center>
</body>
</html>