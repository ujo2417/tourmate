<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<link rel="stylesheet" href="/resources/css/table.css">
<script type="text/javascript">
function AjaxEx(){
var confirm_id = "confirm_id="+document.userinput.mem_id.value;

$.ajax({
	
	url : "/confirmId",
	type : "post",
	data : confirm_id,
	dataType : "json",
	success : function(data) {
		var encode = decodeURIComponent(data);
		document.getElementById("result").innerHTML = encode;
		
		},
		
	error : function(request) {
	
		alert("fail");
		
	}
});
}
</script>

<script language="JavaScript">
<!--
	function checkIt() {
	var userinput = eval("document.userinput");
	var phone = /^[0-9]{3,4}$/;
	
	if(!userinput.mem_id.value){

    	alertify.alert("아이디를 입력하세요");
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
	
	if (phone.test(document.getElementById("telnumber").value) != true) {
		alertify.alert('휴대폰 번호가 잘못되었습니다');
		return false;
	}
	if (phone.test(document.getElementById("telnumber2").value) != true) {
		alertify.alert('휴대폰 번호가 잘못되었습니다');
		return false;
	}
	

	if (!userinput.mem_phone.value || !userinput.mem_phone2.value
			|| !userinput.mem_phone3.value) {
		alertify.alert("휴대폰 번호를 입력하세요");
		return false;
	}

	if (!userinput.mem_address.value) {
		alertify.alert("주소를 입력하세요");
		return false;
	}
	if(!userinput.mem_birth.value){
		alertify.alert("생년월일을 입력하세요");
		return false;
	}
	if(!userinput.mem_email.value){
		alertify.alert("이메일을 입력하세요");
		return false;
	}

}


-->
</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script type="text/javascript">
var InputImage = 
	(function loadImageFile() {
    if (window.FileReader) {
        var ImagePre; 
        var ImgReader = new window.FileReader();
        var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i; 

        ImgReader.onload = function (Event) {
            if (!ImagePre) {
                var newPreview = document.getElementById("imagePreview");
                ImagePre = new Image();
                ImagePre.style.width = "200px";
                ImagePre.style.height = "140px";
                newPreview.appendChild(ImagePre);
            }
            ImagePre.src = Event.target.result;
            
        };

        return function () {
        	
            var img = document.getElementById("image").files;
           
            if (!fileType.test(img[0].type)) { 
            	alertify.alert("이미지 파일을 업로드 하세요"); 
            	return; 
            }
            
            ImgReader.readAsDataURL(img[0]);
        }

    }
   			
            document.getElementById("imagePreview").src = document.getElementById("image").value;

      
})();

function moveCursor(textbox){
	
	if(textbox.value.length == 4){
		document.getElementById("telnumber2").focus();
	}
}
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
	<br>
	<center>
		<img src="/resources/corlate/images/logo/joinlogo.png" alt="회원가입" width="200px" height="180px"><br><br>
		<form action="joinOk" method="post" name="userinput" enctype="multipart/form-data"	onsubmit="return checkIt()">
			
			<table class="type06_joinform" border="0">
			
				<tr >
					<th>ID</th>
					
			<td>
			<input type="text" name="mem_id" id="mem_id" placeholder="ID를 입력하세요" oninput="AjaxEx()" />
			<div id="result"></div>
		</td>

				</tr>
				
				<tr>
					<th class="tdname">비밀번호</th>
					
					<td colspan="2"><input type="password" name="mem_pwd"
						placeholder="비밀번호를 입력하세요"></td>
				</tr>
		
				<tr>
					<th class="tdname">비밀번호 확인</th>
					
					<td colspan="2"><input type="password" name="mem_pwd2"
						placeholder="비밀번호확인을 입력하세요"></td>
				</tr>
			
				<tr>
					<th class="tdname">이름</th>
				
					<td colspan="2"><input type="text" name="mem_name"></td>
				</tr>
				
				<tr>
					<th class="tdname">사진</th>
					
					<td colspan="2"><div id="imagePreview" name="mem_pic" style="background-color: white; width:72px;"></div>
					<input type="file" name="file" id="image" onchange="InputImage();" class="bt_select"/></td>
				</tr>
			
				<tr>
					<th class="tdname">연락처</th>
				
					<td colspan="2" ><select value="010" name="mem_phone" >
							<option value="010">010</option>
							<option value="011">011</option>
					</select> -<input type="text" name="mem_phone2" id="telnumber" class="textsize" maxlength="4" onkeyup="moveCursor(this)">-<input
						type="text" name="mem_phone3" id="telnumber2" class="textsize" maxlength="4"></td>
				</tr>
				
				<tr>
					<th class="tdname">주소</th>
					
					<td><input type="text" id="post1" class="textsize" name="mem_post1" readonly>-<input type="text" id="post2" class="textsize" name="mem_post2" readonly>
					<input type="button" onclick="openDaumPostcode()" value="우편번호 찾기" />
					<br><br><input type="text" id="addr" name="mem_area" style="width: 400px">
					<input type="text" id="addr2" name="mem_address" style="width: 200px"></td>
				</tr>
				
				<tr>
					<th class="tdname">성별</th>
					
					<td colspan="3"><select value="남" name="mem_sex">
							<option value="남">남</option>
							<option value="여">여</option>
					</select></td>
				</tr>
				
				<tr>
					<th class="tdname">생년월일</th>
					
					<td colspan="2"><input type="date" name="mem_birth"></td>
				</tr>
				
				<tr>
					<th class="tdname">E-mail</th>
				
					<td colspan="2"><input type="email" name="mem_email"></td>
				</tr>
			
				
			<table border="0">
				<tr align="center">
					<td colspan="2">
						<input type="submit" value="join" class="bt_join" >
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="reset" class="bt_rewrite" >
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="loginform" ><input type="button" value="cancel" class="bt_cencle" ></a>
					</td>
				</tr>
			</table>
			
			</table>
		</form>
	</center>
	
</body>
</html>
