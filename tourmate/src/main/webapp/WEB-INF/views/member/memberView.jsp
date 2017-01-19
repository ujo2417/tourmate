<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</head>
<body>
<br><br>
<center>
<img alt="나의 게시물" src="/resources/corlate/images/logo/mycontentlogo.png" align="middle" width="190px" height="180px" >	
<br><br><br><br>
<table border="0" class="mypagestyle" align="center">
   <tr>
      <td align="center" class="maintd">
      	 <a href="memberView_free"><img alt="자유게시판내글" src="/resources/corlate/images/logo/communitylogo.png" width="120px" height="100" />
         </a>
      </td>
      
      <td class="tdtdtd" bgcolor="#ffffff">&nbsp;&nbsp;&nbsp;</td>
      
      <td align="center" class="maintd">
      	  <a href="memberView_user"><img alt="후기게시판내글" src="/resources/corlate/images/logo/epiloguelogo.png" width="120px" height="100" />
       </a>
      </td>
      
      <td class="tdtdtd">&nbsp;&nbsp;&nbsp;</td>
      
      <td align="center" class="maintd">
           <a href="memberView_mate"><img alt="투어메이트 내글" src="/resources/corlate/images/logo/mytourmateviewlogo.png" width="120px" height="100" />
        </a>
      </td>
  
 
    
   </tr>
</table>
<br><br><br><br><br>
</body>
</html>