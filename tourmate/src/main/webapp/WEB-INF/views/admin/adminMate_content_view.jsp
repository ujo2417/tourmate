<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script language="javascript">
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table width="500" cellpadding="0" cellspacing="0" border="1">
			<input type="hidden" name="mate_num" value="${content_view.mate_num}">
			<tr>
				<td width="70">번호</td>
				<td>${content_view.mate_num}</td>
			</tr>
			<tr>
				<td>히트</td>
				<td>${content_view.mate_readcount}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${content_view.mem_id}</td>
			</tr>
			<tr>
				<td>모집인원</td>
				<td>${content_view.mate_present}/${content_view.mate_max}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${content_view.mate_title}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td height="200">${content_view.mate_content}</td>
			</tr>
			<tr>
				<td colspan="2">
					<a href="adminmatelist">목록보기</a> &nbsp;&nbsp; 
					<a href="adminmatedelete?mate_num=${content_view.mate_num}">삭제</a> &nbsp;&nbsp; 
				</td>
			</tr>
	</table>
	<!-- 댓글쓰기 -->
	<c:if test="${sessionScope.mem_id != null }">
	<form name="replymodifyform" action="adminmatereplywrite" method="post"
		onSubmit="return checkIt()">
		<input type="hidden" name="re_matenum"
			value="${content_view.mate_num}"> <input type="hidden"
			name="mem_id" value="${sessionScope.mem_id }"> <input
			type="text" name="re_content" size="55"> <input type="submit"
			value="댓글등록">
	</form>
	</c:if>
	<!-- 댓글출력 -->
	<table width="500" cellpadding="0" cellspacing="0" border="1">

		<c:forEach items="${reply_view}" var="re_dto">
			<form action="adminmatereplydelete" method="post">
				<tr>
					<td width="80">${re_dto.mem_id }</td>
					<td>${re_dto.re_content}</td>
					<td width="90">${re_dto.re_writedate}</td>

					<form action="mate_reply_delete" method="post">
						<input type="hidden" name="mate_num"
							value="${content_view.mate_num}"> <input type="hidden"
							name="re_num" value="${re_dto.re_num}">
						<td width="10"><c:if
								test="${sessionScope.mem_id == re_dto.mem_id}">
								<input type="submit" value="삭제">
							</c:if></td>
					</form>
				</tr>
			</form>
		</c:forEach>
	</table> <!-- 댓글 테이블 end -->


</body>
</html>