<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="/resources/css/table.css">
<script language="javascript">
	function begin() {
		document.boardform.mate_title.focus();
	}
	function checkIt() {
		var onlynum = /^[0-9]{1,2}$/;

		
		if (!document.boardform.mate_title.value) {
			alertify.alert("제목을 입력하지 않으셨습니다.");
			document.boardform.mate_title.focus();
			return false;
		}
		
		if (!document.boardform.mate_max.value) {
			alertify.alert("모집인원을 입력하지 않으셨습니다.");
			document.boardform.mate_max.focus();
			return false;
		}
		if (onlynum.test(document.getElementById("matemax").value) != true) {
			alertify.alert('모집인원이 잘못되었습니다');
			document.boardform.mate_max.focus();
			return false;
		}
		if (!document.boardform.mate_content.value) {
			alertify.alert("내용을 입력하지 않으셨습니다.");
			document.boardform.mate_content.focus();
			return false;
		}
		if (!document.boardform.mate_date1.value) {
			alertify.alert("출발날짜를 입력하지 않으셨습니다.");
			document.boardform.mate_date1.focus();
			return false;
		}
		if (!document.boardform.mate_date2.value) {
			alertify.alert("종료날짜를 입력하지 않으셨습니다.");
			document.boardform.mate_date2.focus();
			return false;
		}
		if(document.boardform.mate_date1.value > document.boardform.mate_date2.value) {
			alertify.alert("여행기간을 다시 입력해 주세요.");
			document.boardform.mate_date1.focus();
			return false;
		}
		
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>write_view</title>

<!-- 스마트 에디터 시작 -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js" ></script>
<script type="text/javascript" src="/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
    //전역변수
    var obj = [];               
    //스마트에디터 프레임생성
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: obj,
        elPlaceHolder: "mate_content",      /* 스마트 에디터 적용할 textarea id 값 */
        sSkinURI: "/resources/editor/SmartEditor2Skin.html", 
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, 
        }
    });
    //전송버튼
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        obj.getById["mate_content"].exec("UPDATE_CONTENTS_FIELD", []);
        //폼 submit
        $("#frm").submit();
    })
})
</script>
<!-- 스마트 에디터 끝 -->

</head>

<body>
<center>

	 <br>
	  <div class="center wow fadeInDown">
	  	               <img src="/resources/corlate/images/logo/matelogo.png" width="200px" height="180px" />
	  
            </div>
 <table class="type04">
		<form name="boardform" action="matewrite" method="post" id="frm" onSubmit="return checkIt()">
			<tr>
				<th scope="row">아이디</th>
				<td><input type="text" name="mem_id"
					value="${sessionScope.mem_id}" readonly="readonly"></td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td><input type="text" name="mate_title" size="50"></td>
			</tr>
			<tr>
				<th scope="row">여행기간</th>
				<td><input type="date" name="mate_date1" min="${str }">
					<input type="date" name="mate_date2" min="${str }"></td>
			</tr>
			<tr>
				<th scope="row">모집인원</th>
				<td><input type="text" name="mate_max" id="matemax" size="10" placeholder="최대 99명까지"></td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="mate_content" id="mate_content" rows="10" style="width:766px; height:412px;"></textarea> </td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" id="savebutton" value="입력" >
					&nbsp;&nbsp; <a href="matelist"><input type="button" value="목록"></a></td>
			</tr>
		</form>
	</table>
</center>
</body>
</html>