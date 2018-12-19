<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="resources/joinform/js/jquery.uniform.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="resources/joinform/css/style.css" />
<link href='http://fonts.googleapis.com/css?family=Engagement' rel='stylesheet' type='text/css'>

<script language="JavaScript">

function checkIt() {
	
   var userinput = eval("document.userinput");
   var phone = /^[0-9]{3,4}$/;
	
	
   if (phone.test(document.getElementById("telnumber").value) != true) {
		alertify.alert('휴대폰 번호가 잘못되었습니다');
		return false;
	}
	if (phone.test(document.getElementById("telnumber2").value) != true) {
		alertify.alert('휴대폰 번호가 잘못되었습니다');
		return false;
	}
   if (!userinput.mem_pwd.value) {
      alertify.alert("비밀번호를 입력하세요");
      return false;
   }
   if (userinput.mem_pwd.value != userinput.mem_pwd2.value) {
      alertify.alert("비밀번호를 동일하게 입력하세요");
      return false;
   }

   if (!userinput.mem_name.value) {
      alertify.alert("사용자 이름을 입력하세요");
      return false;
   }
   if (!userinput.mem_phone.value || !userinput.mem_phone2.value || !userinput.mem_phone3.value){
	   alertify.alert("휴대폰 번호를 입력하세요")
	   return false;
   }
   
   if (!userinput.mem_address.value){
	   alertify.alert("주소를 입력하세요")
	   return false;
   }
   
}
</script>

<script>

        $(document).ready(function(){
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
                    reader.onload = function (e) {
                    //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                        $('#blah').attr('src', e.target.result);
                        //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
                        //(아래 코드에서 읽어들인 dataURL형식)
                    }                   
                    reader.readAsDataURL(input.files[0]);
                    //File내용을 읽어 dataURL형식의 문자열로 저장
                }
            }//readURL()--
   
            //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
            $("#imgInp").change(function(){
                //alertify.alert(this.value); //선택한 이미지 경로 표시
                readURL(this);
            });
         });
  
  </script>


</head>
<body>
<article>
<h3 align="center">정보수정</h3>
<form class="form" action="modifyOk" method="post" name="userinput" enctype="multipart/form-data"	onsubmit="return checkIt()">
		<ul>
		<li class="li">
			<label>ID</label>
			<input type="text" name="mem_id"  value="${dto.mem_id }" readonly="readonly"/>
			
		</li>
		<li class="li">
			<label>비밀번호</label>
			<input type="password" name="mem_pwd" value="${dto.mem_pwd }">
		</li>
		<li class="li">
			<label>비밀번호 확인</label>
			<input type="password" name="mem_pwd2"  value="${dto.mem_pwd }">
		</li>
		<li class="li">
			<label>이름</label>
			<input type="text" name="mem_name" value="${dto.mem_name }">
		</li>
		<li class="li">
			<label>사진</label>
			<div><img src="resources/memberPic/${dto.mem_pic}" id="blah" width="150"/>
			
			<input type="file"  name="file" value="${dto.mem_pic }" id="imgInp">
				<c:if test="${file == null}">
    			    <input type="hidden" name="file" value="${dto.mem_pic}">
    			    
     		</c:if>
     		</div>
		</li>
		
		<li class="li">
			<label>연락처</label>
			<td colspan="1">
			<select name="mem_phone" >
				<option value="010">010</option>
				<option value="011">011</option>
			</select>
			-<input type="text" name="mem_phone2" id="telnumber" value="${dto.mem_phone2 }">-<input type="text" name="mem_phone3" id="telnumber2" value="${dto.mem_phone3 }">
			
			
		</li>
		<li class="li">
			<label>주소</label>
			
			<select  name="mem_area" value="${dto.mem_area }">
				<option value="경기">경기도</option>
				<option value="강원">강원도</option>
				<option value="충청">충청도</option>
				<option value="대전">대전</option>
				<option value="경북">경상북도</option>
				<option value="경남">경상남도</option>
				<option value="대구">대구</option>
				<option value="전북">전라북도</option>
				<option value="전남">전라남도</option>
				<option value="광주">광주</option>
				<option value="부산">부산</option>
				<option value="울산">울산</option>
			</select>
			<input type="text" name="mem_address" value="${dto.mem_address }">
			
		</li>
		<li class="li">
			<label>성별</label>
			
			<select name="mem_sex" value="${ dto.mem_sex }">
				<option value="남">남</option>
				<option value="여">여</option>
			</select>
			
		</li>
		<li class="li">
			<label>E-mail</label>
			<input type="email" name="mem_email" value="${dto.mem_email }">
		</li>
		<center>
			<input type="submit" value="save">
			<input type="reset" value="reset">
			<a href="loginform"><input type="button" value="cancel"></a>
		</center>
	</ul>
</form>
  </article>
</body>
</html>