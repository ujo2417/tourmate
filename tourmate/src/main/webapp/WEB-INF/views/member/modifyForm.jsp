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
  <script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
<script>
	function openDaumPostcode(){
		new daum.Postcode({
			oncomplete: function(data){
				document.getElementById('post1').value = data.postcode1;
				document.getElementById('post2').value = data.postcode2;
				document.getElementById('addr').value = data.address;
				document.getElementById('addr2').focus();
			}
		}).open();		
	}
</script>

</head>
<body>
<article>
<br><br>
<center>
<img alt="정보수정" src="resources/corlate/images/logo/memberupdate.png" align="middle" width="200px" height="180px">
</center>
<br>
<form class="form" action="modifyOk" method="post" name="userinput" enctype="multipart/form-data"	onsubmit="return checkIt()">
		<ul>
		<li class="li">
			<label>ID</label>
			<input type="text" name="mem_id"  value="${dto.mem_id }" readonly="readonly"/>
			
		</li>
		<li class="li">
			<label>비밀번호</label>
			<input type="password" name="mem_pwd">
		</li>
		<li class="li">
			<label>비밀번호 확인</label>
			<input type="password" name="mem_pwd2">
		</li>
		<li class="li">
			<label>이름</label>
			<input type="text" name="mem_name" value="${dto.mem_name }" readonly="readonly">
		</li>
		<li class="li">
			<label>사진</label>
			<div><img src="resources/memberPic/${dto.mem_pic}" name="mem_pic" id="blah" width="150"/>
			
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
			-<input type="text" name="mem_phone2" id="telnumber" value="${dto.mem_phone2 }" style="width: 70px;text-align: center;">-<input type="text" name="mem_phone3" id="telnumber2" value="${dto.mem_phone3 }" style="width: 70px;text-align: center;">
			
			
		</li>
		<li class="li">
			<label>주소</label>
			<td><input type="text" id="post1" name="mem_post1" value="${dto.mem_post1}" class="modisize" style="width: 70px;text-align: center;">-<input type="text" id="post2" name="mem_post2" value="${dto.mem_post2}" class="modisize" style="width: 70px;text-align: center;">
				<input type="button" onclick="openDaumPostcode()" value="우편번호 찾기" />
			</td>
			<td><br><br><input type="text" id="addr" name="mem_area" value="${dto.mem_area}" style="margin-left:180px" style="width: 400px">
				<input type="text" id="addr2" name="mem_address" value="${dto.mem_address}" style="width: 200px">
			</td>
		</li>
		<li class="li">
			<label>성별</label>
			<td><input type="text" name="mem_sex" value="${dto.mem_sex}" readonly="readonly"></td>
		</li>
		<li class="li">
				<label>생년월일</label>
				<td colspan="2"><input type="date" name="mem_birth"></td>
		</li>
		<li class="li">
			<label>E-mail</label>
			<input type="email" name="mem_email" value="${dto.mem_email }">
		</li>
		<center>
			<input type="submit" value="save" />&nbsp;&nbsp;&nbsp;
			<input type="reset" value="reset" />&nbsp;&nbsp;&nbsp;
			<a href="loginform"><input type="button" value="cancel" /></a>
		</center>
	</ul>
</form>
  </article>
</body>
</html>