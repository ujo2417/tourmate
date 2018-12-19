<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="resources/css/table.css">
   <script language="javascript">
     <!--
       function begin(){
         document.boardform.notice_title.focus();
       }
       function checkIt(){
         if(!document.boardform.notice_title.value){
           alertify.alert("제목을 입력하지 않으셨습니다.");
           document.boardform.notice_title.focus();
           return false;
         }
         if(!document.boardform.notice_content.value){
           //alertify.alert("내용을 입력하지 않으셨습니다.");
           document.boardform.notice_content.focus();
           return false;
         }
       }
     -->
   </script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>write_view</title>

<!-- 스마트 에디터 시작 -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js" ></script>
<script type="text/javascript" src="resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
    //전역변수
    var obj = [];               
    //스마트에디터 프레임생성
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: obj,
        elPlaceHolder: "notice_content",      /* 스마트 에디터 적용할 textarea id 값 */
        sSkinURI: "resources/editor/SmartEditor2Skin.html", 
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
        obj.getById["notice_content"].exec("UPDATE_CONTENTS_FIELD", []);
        //폼 submit
        $("#frm").submit();
    })
})
</script>
<!-- 스마트 에디터 끝 -->


</head>
<body>
<center>


	 <br><br><br>
	  <div class="center wow fadeInDown">
	  	               <img src="resources/corlate/images/logo/writelogo.png" width="200px" height="180px" />
	  
                <h2>Commnunity</h2>
            </div>
	 
	 <table class="type04">

  
  <form name="boardform" action="noticewrite" method="post" id="frm" onSubmit="return checkIt()">
			<tr>
				<th scope="row"> 아이디 </th>
				<td><input type="text" name="mem_id" value="${sessionScope.mem_id}" readonly="readonly"></td>
			</tr>
			<tr>
				<th scope="row"> 제목 </th>
				<td> <input type="text" name="notice_title" size = "50"> </td>
			</tr>
			<tr>
				
				<td align="center" colspan="2"> <textarea name="notice_content" id="notice_content" rows="10" style="width:766px; height:412px;"></textarea> </td>
			</tr>
			<tr >
				<th colspan="2"> <input type="submit" id="savebutton" value="입력"> &nbsp;&nbsp; <a href="noticelist">목록보기</a></th>
			</tr>
		</form>
</table>
<center>
</body>

</html>