<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="resources/css/table.css">

<script language="javascript">
     <!--
       function begin(){
         document.boardmodifyform.mate_title.focus();
       }
       function checkIt(){
         if(!document.boardmodifyform.mate_title.value){
          // alertify.alert("제목을 입력하지 않으셨습니다.");
           document.boardmodifyform.mate_title.focus();
           return false;
         }
         if(!document.boardmodifyform.mate_content.value){
         //  alertify.alert("내용을 입력하지 않으셨습니다.");
           document.boardmodifyform.mate_content.focus();
           return false;
         }
         if(document.boardmodifyform.mate_date1.value > document.boardmodifyform.mate_date2.value) {
 			alertify.alert("여행기간을 다시 입력해 주세요.");
 			document.boardmodifyform.mate_date1.focus();
 			return false;
 		}
       }
     -->
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
        elPlaceHolder: "mate_content",      /* 스마트 에디터 적용할 textarea id 값 */
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
	               <img src="resources/corlate/images/logo/updatelogo.png" width="200px" height="180px" />
	  
            </div>
            
            <table class="type04">
		<form name="boardmodifyform" action="matemodify" method="post" id="frm" onSubmit="return checkIt()">
			<input type="hidden" name="mate_num" value="${content_view.mate_num}">
			<tr>
				<th> 번호 </th>
				<th> ${content_view.mate_num} </th>
			</tr>
			<tr>
				<th > 히트 </th>
				<th> ${content_view.mate_readcount} </th>
			</tr>
			<tr>
				<th > 이름 </th>
				<th>${content_view.mem_id}</th>
			</tr>
			<tr>
				<th > 제목 </th>
				<td colspan="5"><input type="text" name="mate_title" size = "50" value="${content_view.mate_title}"> </td>
			</tr>
			<tr>
				<th > 여행기간 </th>
				<th><input type="date" name="mate_date1" value="${content_view.mate_date1}" min="${str }">
				&nbsp;~&nbsp;
				<input type="date" name="mate_date2" value="${content_view.mate_date2}" min="${str }">
				 </th>
			</tr>
			<tr>
				<td colspan="6" height = "200">  <textarea name="mate_content" id="mate_content" rows="10" style="width:766px; height:412px;">${content_view.mate_content}</textarea> </td>
			</tr>
			<tr >
				<th colspan="6"> <input type="submit" id="savebutton" value="수정"> &nbsp;&nbsp; <a href="matelist"><input type="button" value="목록"></a> &nbsp;&nbsp; 
				<a href="matedelete?mate_num=${content_view.mate_num}"><input type="button" value="삭제"></a> &nbsp;&nbsp; </th>

			</tr>
		</form>
	</table>
	</center>
</body>
</html>