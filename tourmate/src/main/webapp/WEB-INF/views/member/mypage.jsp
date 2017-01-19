<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>마이 페이지</title>
<style type="text/css">
.mypagestyle a{
   font-weight: bold;
   font-size: 15px;
}

.mypagestyle{
   border-collapse:collapse;
   border-color:gray;
}
.tdtdtd{
	 height:140px;
	 width:30px;
}
.maintd{
 	width:300px;	
   height:140px;
   background-color:#f5f5f5 ;
 
}
</style>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
	$(document).ready(function() {
		$('#delete').click(function() {
		var con = confirm("정말로 탈퇴하시겠습니까?");

			if (con == true) {
				return true;
				
			} else {
				return false;
			}
		});
	});
</script>
</head>
<body>
<br><br>
<center>
<img alt="마이페이지" src="/resources/corlate/images/logo/mypagelogo.png" align="middle">

<br><br><br><br><br>

<table border="0" class="mypagestyle" align="center">
   <tr>
      <td align="center" class="maintd">
      	 <a href="modifyForm"><img alt="정보수정" src="/resources/corlate/images/mypage_3.png" width="120px" height="100" />
         Update</a>
      </td>
      
      <td class="tdtdtd" bgcolor="#ffffff">&nbsp;&nbsp;&nbsp;</td>
      
      <td align="center" class="maintd">
      	  <a href="memberview"><img alt="내가쓴글" src="/resources/corlate/images/mypage_1.png" width="120px" height="100" />
        My&nbsp;Contents</a>
      </td>
      
      <td class="tdtdtd">&nbsp;&nbsp;&nbsp;</td>
      
      <td align="center" class="maintd">
           <a href="mateJoinList"><img alt="나의투어메이트" src="/resources/corlate/images/mypage_2.png" width="120px" height="100" />
         My&nbsp;Tour&nbsp;Mate</a>
      </td>
      <td class="tdtdtd" bgcolor="#ffffff">&nbsp;&nbsp;&nbsp;</td>
 
    <td align="center" class="maintd">
            <a href="memberDelete" id="delete">
            <img alt="나의투어메이트" src="/resources/corlate/images/mypage_4.png" width="120px" height="100" />
            <!-- <input type="button" value="회원탈퇴" id="delete"
            > -->
            <font style="vertical-align:middle;">Member&nbsp;Leave</font></a>
      </td>
   </tr>
</table>
<br><br><br><br><br>
</center>
</body>
</html>