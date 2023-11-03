﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="../common/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
<!-- Google web font "Open Sans" -->
<link rel="stylesheet" href="/css/font-awesome.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Bootstrap style -->
<link rel="stylesheet" type="text/css" href="css/datepicker.css" />
<link rel="stylesheet" type="text/css" href="slick/slick.css" />
<link rel="stylesheet" type="text/css" href="slick/slick-theme.css" />
<link rel="stylesheet" href="css/templatemo-style.css">
</head>

<body>
	<div class="tm-page-wrap mx-auto">
		<section class="tm-banner">
			<div class="tm-container-outer ">
				<div class="container">
					<!-- <div class="row tm-banner-row" id="tm-section-search"></div> -->
					<!-- row -->
				</div>
				<!-- .container -->
			</div>
			<!-- .tm-container-outer -->
		</section>


		<section class="tm-page-wrap-allwhite">
			<div align="center">
				<div class="col-xs-12 mx-auto tm-about-text-wrap text-center">
					<h2 class="text-uppercase mb-4">회원 정보 수정</h2>
					<h6>회원님의 개인정보를 입력해주시기 바랍니다.</h6>
					<br> <br>
				</div>
			</div>
		</section>
		<form action="UserServlet" name="frm" method="post">
			<!-- class="tm-contact-form" -->
			<input type="hidden" name="command" value="updateUser"> <input
				type="hidden" name="usernum" value="${loginUser.usernum}"> <input
				type="hidden" name="userid" value="${loginUser.userid}">
			<%-- <input type="hidden" name = "engName" value="${engName}">
				<input type="hidden" name = "korName" value="${korName}"> --%>
			<input type="hidden" name="gender" value="${loginUser.gender}">


			<table
				style="margin: auto; width: 800px; border-top: 0.1px solid rgb(220, 220, 220); border-bottom: 0.1px solid rgb(220, 220, 220);">
				<tbody>

					<tr>
						<th scope="row" style="padding: 16px 8px 8px 8px; width: 150px; margin-top: 16px"><label
							for="korName">한글명<span class="icon_require"
								style="color: red; font-size: x-small;"> *</span></label></th>
						<td><input type="text" name="korName"
							value="${loginUser.korName}" class="form-control"
							style="width: 200px; margin: 16px 0 6px 0">
							<p class="txt_error_Msg" id="error_koreanName"
								style="display: none;"></p></td>
					</tr>
					<tr>
						<th scope="row" style="padding: 16px 8px 8px 8px; width: 150px">영문명<span
							class="icon_require" style="color: red; font-size: x-small;">
								*</span></th>
						<td><input type="text" name="engName"
							value="${loginUser.engName}" class="form-control"
							style="width: 200px"></td>
					</tr>

					<tr>
						<th scope="row" style="padding: 16px 8px 8px 8px; width: 150px">성별<span
							class="icon_require" style="color: red; font-size: x-small;">
								*</span></th>
						<td><c:set var="gender" value="${loginUser.gender}" /> <c:if
								test="${gender%2 == 1}">M</c:if> <c:if test="${gender%2 == 0}">F</c:if></td>
					</tr>

					<tr>
						<th scope="row" style="padding: 16px 8px 8px 8px; width: 150px">생년월일<span
							class="icon_require"></span></th>
						<c:set var="TextValue" value="010-abcd-1234" />
						<td>19${fn:substring(loginUser.usernum,0,2)}년&nbsp;&nbsp;${fn:substring(loginUser.usernum,2,4)}월&nbsp;&nbsp;${fn:substring(loginUser.usernum,4,6)}일</td>
					</tr>

					<tr>
						<th scope="row" style="padding: 16px 8px 8px 8px; width: 150px"><label
							for="input_pw">비밀번호<span class="icon_require"
								style="color: red; font-size: x-small;"> *</span></label></th>
						<td><input type="password" id="pwd" autocomplete="off"
							name="pwd" placeholder="영문+숫자+특수문자 6~10자리" maxlength="10"
							title="영문+숫자+특수문자 6~10자리" style="width: 200px;"
							onkeydown="inputPwdChk()" class="form-control">
							<p class="txt_error_Msg" id="error_pw" style="display: none;"></p>
						</td>
					</tr>
					<tr>
						<th scope="row" style="padding: 16px 8px 8px 8px; width: 150px"><label
							for="pwd_Check">비밀번호 확인<span class="icon_require"
								style="color: red; font-size: x-small;"> *</span></label></th>
						<td><input type="password" id="pwd_Check" autocomplete="off"
							placeholder="영문+숫자+특수문자 6~10자리" title="영문+숫자+특수문자 6~10자리"
							maxlength="10" style="width: 200px; display: inline;"
							onkeydown="inputPwdChk()" class="form-control">

							&nbsp;&nbsp;<button onclick="joinInformPwdCheck()" id="btn_pwdCheck"
								type="button" class="btn btn-primary" style="display: inline">확인</button>
							<input type="hidden" name="pwdDuplication" value="pwdUncheck" /></td>
					</tr>
					<tr>
						<th scope="row" style="padding: 16px 8px 8px 8px; width: 150px"><label>휴대전화<span
								class="icon_require"
								style="color: red; font-size: x-small; display: inline;">
									*</span></label></th>
						<td id="korea_phone"><select id="phone_first"
							name="phone_first" style="width: 150px; display: inline"
							title="휴대전화 번호 앞자리" class="form-control">

								<option value="">선택</option>
								<option value="010"
									<c:if test="${fn:substring(loginUser.phone,0,3)==010}">selected="selected"</c:if>>010</option>
								<option value="011"
									<c:if test="${fn:substring(loginUser.phone,0,3)==011}">selected="selected"</c:if>>011</option>
								<option value="016"
									<c:if test="${fn:substring(loginUser.phone,0,3)==016}">selected="selected"</c:if>>016</option>
								<option value="017"
									<c:if test="${fn:substring(loginUser.phone,0,3)==017}">selected="selected"</c:if>>017</option>
								<option value="018"
									<c:if test="${fn:substring(loginUser.phone,0,3)==018}">selected="selected"</c:if>>018</option>
								<option value="019"
									<c:if test="${fn:substring(loginUser.phone,0,3)==019}">selected="selected"</c:if>>019</option>
						</select> <input type="text" id="phone_middle" name="phone_middle"
							placeholder="중간번호" title="휴대전화 번호 가운데 자리" maxlength="4"
							style="width: 150px; display: inline;" class="form-control"
							value="${fn:substring(loginUser.phone,4,8)}"
							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1')">
							<input type="text" id="phone_last" name="phone_last"
							placeholder="끝 번호" title="휴대전화번호 끝자리" maxlength="4"
							style="width: 150px; display: inline;" class="form-control"
							value="${fn:substring(loginUser.phone,9,13)}"
							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1')">
							<p class="txt_error_Msg" id="error_koreaPhone"
								style="display: none;"></p></td>
					</tr>


					<tr>
						<th scope="row" style="padding: 16px 8px 8px 8px; width: 150px"><label
							for="input_emailID">이메일<span class="icon_require"
								style="color: red; font-size: x-small"> *</span></label></th>
						<td><input type="text" id="input_emailID" name="email"
							placeholder="이메일 입력" title="이메일 아이디 입력"
							style="width: 130px; display: inline;" class="form-control"
							value="${fn:split(loginUser.mail,'@')[0]}"> @ &nbsp; <select
							id="select_emailDomain" title="이메일 도메인 선택" name="mail_Domain"
							style="width: 148px; display: inline;" onchange="display()"
							class="form-control">

								<option value="naver.com" onclick="return display()"
									<c:if test="${fn:split(loginUser.mail,'@')[1]=='naver.com'}">selected="selected"</c:if>>naver.com</option>

								<option value="yahoo.co.kr" onclick="return display()"
									<c:if test="${fn:split(loginUser.mail,'@')[1]=='yahoo.co.kr'}">selected="selected"</c:if>>yahoo.co.kr</option>

								<option value="hotmail.com" onclick="return display()"
									<c:if test="${fn:split(loginUser.mail,'@')[1]=='hotmail.com<'}">selected="selected"</c:if>>hotmail.com</option>

								<option value="hanmail.net" onclick="return display()"
									<c:if test="${fn:split(loginUser.mail,'@')[1]=='hanmail.net'}">selected="selected"</c:if>>hanmail.net</option>

								<option value="nate.com" onclick="return display()"
									<c:if test="${fn:split(loginUser.mail,'@')[1]=='nate.com'}">selected="selected"</c:if>>nate.com</option>

								<option value="yahoo.com" onclick="return display()"
									<c:if test="${fn:split(loginUser.mail,'@')[1]=='yahoo.com'}">selected="selected"</c:if>>yahoo.com</option>

								<option value="gmail.com" onclick="return display()"
									<c:if test="${fn:split(loginUser.mail,'@')[1]=='gmail.com'}">selected="selected"</c:if>>gmail.com</option>

								<option value="hotmail.co.kr" onclick="return display()"
									<c:if test="${fn:split(loginUser.mail,'@')[1]=='hotmail.co.kr'}">selected="selected"</c:if>>hotmail.co.kr</option>

								<option value="" id="option_directInput"
									onclick="return display()">직접입력</option>
						</select> <input type="text" id="input_emailDomain" placeholder="직접입력"
							title="직접입력" style="width: 150px; display: inline;"
							class="form-control" value="${fn:split(loginUser.mail,'@')[1]}"
							disabled="disabled"></td>
					</tr>

					<tr>
						<th scope="row" style="padding: 16px 8px 8px 8px; width: 150px"><label
							for="input_address">주소<span class="icon_require"
								style="color: red; font-size: x-small;"> *</span>
						</label></th>
						<td id="korea_address"><input type="text"
							id="sample6_postcode" name="postcode" placeholder="우편번호"
							class="form-control" style="width: 200px; display: inline;">
							&nbsp;&nbsp;<input type="button" onclick="sample6_execDaumPostcode()"
							id="input_address" value="우편번호 찾기" class="btn btn-primary"
							style="display: inline; margin: 16px 0 16px 0"><br> <input
							type="text" name="addressDefault" id="sample6_address"
							placeholder="주소" class="form-control" style="width: 250px; margin-bottom: 10px">
							<input type="text" id="sample6_detailAddress" placeholder="상세주소"
							class="form-control" name="addressDetail"
							style="display: inline; width: 250px; display: inline; margin-bottom: 16px">
							<input type="text" id="sample6_extraAddress" placeholder="참고항목"
							style="width: 250px; display: inline;" class="form-control">


							<p style="color: gray; margin-top: 10px; font-size: 0.8em;">제공해주신
								주소는 이벤트 또는 우수회원 승급 서비스 제공을 위해 이용됩니다.</p>

							<p class="txt_error_Msg" id="error_koreaAddress"
								style="display: none;"></p></td>
						<td id="usa_address" style="display: none;">
							<p>
								<input type="text" id="input_usDefaultAddress"
									placeholder="기본 주소" title="기본 주소" style="width: 400px;">
								<input type="text" id="input_usDetailAddress"
									placeholder="상세 주소" title="상세 주소" style="width: 400px;">
							</p>
							<p class="mar_to15">
								<input type="text" id="input_usCity" placeholder="도시(City)"
									title="도시(City)" style="width: 257px;"> <input
									type="text" id="input_usState" placeholder="주(State)"
									title="주(State)" style="width: 257px;"> <input
									type="text" id="input_usZipCode" placeholder="우편번호(Zip Code)"
									title="우편번호(Zip Code)" style="width: 257px;">
							</p>
							<ul class="list_type3 fsz_14 mar_to10">
								<li>제공해주신 주소는 이벤트 또는 우수회원 승급 서비스 제공을 위해 이용됩니다.</li>

							</ul>
							<p class="txt_error_Msg" id="error_usAddress"
								style="display: none;"></p>
						</td>

					</tr>
					<!-- <tr>
							<td colspan="2"><button type="submit" class="btn btn-primary float-right">수정2</button><td>
						</tr> -->
					<tr>
						<td colspan="2" align="center"></td>
					</tr>
				</tbody>
			</table>
			<br> <br>
			<div align="center">
				<button type="submit" class="btn btn-primary"
					onclick="return formCheck(); location.href='UserServlet?command=updateUser'">수정</button>
				<!-- <input type="submit" class="btn btn-primary float-right" value="수정">  -->
			</div>
<br>

		</form>

		<div class="tm-container-outer tm-position-relative" id="tm-section-4">


			<%@ include file="../common/footer.jsp"%>
		</div>
	</div>
	<!-- .main-content -->

	<!-- load JS files -->
	<script src="js/jquery-1.11.3.min.js"></script>
	<!-- jQuery (https://jquery.com/download/) -->
	<script src="js/popper.min.js"></script>
	<!-- https://popper.js.org/ -->
	<script src="js/bootstrap.min.js"></script>
	<!-- https://getbootstrap.com/ -->
	<script src="js/datepicker.min.js"></script>
	<!-- https://github.com/qodesmith/datepicker -->
	<script src="js/jquery.singlePageNav.min.js"></script>
	<!-- Single Page Nav (https://github.com/ChrisWojcik/single-page-nav) -->
	<script src="slick/slick.min.js"></script>
	<!-- http://kenwheeler.github.io/slick/ -->
	<script src="js/jquery.scrollTo.min.js"></script>
	<!-- https://github.com/flesler/jquery.scrollTo -->
	<script>
		/* DOM is ready
		------------------------------------------------*/
		$(function() {

			// Change top navbar on scroll
			$(window).on("scroll", function() {
				if ($(window).scrollTop() > 100) {
					$(".tm-top-bar").addClass("active");
				} else {
					$(".tm-top-bar").removeClass("active");
				}
			});

			// Smooth scroll to search form
			$('.tm-down-arrow-link').click(function() {
				$.scrollTo('#tm-section-search', 300, {
					easing : 'linear'
				});
			});

			// Date Picker in Search form
			var pickerCheckIn = datepicker('#inputCheckIn');
			var pickerCheckOut = datepicker('#inputCheckOut');

			// Update nav links on scroll
			$('#tm-top-bar').singlePageNav({
				currentClass : 'active',
				offset : 60
			});

			// Close navbar after clicked
			$('.nav-link').click(function() {
				$('#mainNav').removeClass('show');
			});

			// Slick Carousel
			$('.tm-slideshow').slick({
				infinite : true,
				arrows : true,
				slidesToShow : 1,
				slidesToScroll : 1
			});


	</script>
	<script type="text/javascript">		
		function joinInformUseridCheck(){ //값이 비었는지 확인 ->필수입력항목 비엇는지 확인으로 설정해야함
			var regId = /^[a-zA-Z0-9]{6,10}$/;

			if(document.frm.userid.value.length == 0){
		        alert("아이디를 입력해주세요.");
		        return false;
		    }
			
	        //아이디 영어 대소문자 확인
	        else if(!regId.test(document.frm.userid.value)){
	            alert("6~10자 영문 대소문자, 숫자만 입력하세요.")
	            userid.focus();
	            return false;
	        }
			
			var url = "UserServlet?command=user_register_idCheck&userid=" + document.frm.userid.value
			open(url, "confirm",
			"toolbar=no, location=no,menubar=no,scrollbars=no,resizable=no,width=600,height=200") ;	
		}
		function inputIdChk(){//텍스트가 입력된다면 중복체크 다시 하는 함수
			var dbCheckId = document.frm.btn_idCheck;
			document.frm.idDuplication.value="idUncheck";
			dbCheckId.disabled=false;
			dbCheckId.style.opacity=1;
			dbCheckId.style.cursor="pointer";
			
		}
		
		function joinInformPwdCheck(){
			var regIdPw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,10}$/;

	        //비밀번호 확인
	        if(document.frm.pwd.value.length == 0){
	            alert("비밀번호를 입력하세요.")
	            pwd.focus();
	            return false;
	        }
	        //비밀번호 영어 대소문자 확인
	        else if(!regIdPw.test(document.frm.pwd.value)){
	            alert("6~10자 영문 대소문자, 숫자, 특수문자를 입력해주세요.")
	            pwd.focus();
	            return false;
	        }
	        //비밀번호와 아이디 비교
	        else if(document.frm.pwd.value == document.frm.userid.value){
	            alert("아이디와 동일한 비밀번호를 사용할 수 없습니다.")
	            pwd.focus();
	            return false;
	        }
	        else if(document.frm.pwd.value !== document.frm.pwd_check.value){
	            alert("비밀번호를 다시 확인해주세요.")
	            pwd_check.focus();
	            return false;
	        }
	            //document.frm.pwdCheckBtn.disabled = true;
	        document.frm.pwdDuplication.value="idCheck";
	        document.frm.btn_pwdCheck.disabled=true;
	        document.frm.btn_pwdCheck.style.cursor="default";
		}
		function inputPwdChk(){//텍스트가 입력된다면 중복체크 다시 하는 함수
			var dbCheckPwd = document.frm.btn_pwdCheck;
			document.frm.pwdDuplication.value="Uncheck";
			dbCheckPwd.disabled=false;
			dbCheckPwd.style.opacity=1;
			dbCheckPwd.style.cursor="pointer";
			
		}
		
		function formCheck() {
	        //  if (document.frm.idDuplication.value == "idUncheck" ) {
	        //     alert("아이디 중복확인을 해주세요.");
	        //     document.frm.userid.focus;
	        //     return false;
	        //  }
	        //  else 
			if (document.frm.pwdDuplication.value == "pwdUncheck" ) {
	            alert("비밀번호 확인을 해주세요.");
	            document.frm.pwd.focus;
	            return false;
	         } 
	         else if(document.frm.phone_first.value.length == 0){
	            alert("휴대전화번호를 다시 확인해주세요.")
	            document.frm.phone_first.focus;
	            return false;
	         } 
	         else if(document.frm.pwd.value.length < 6){
		            alert("비밀번호를 6글자 이상 입력해주세요.")
		            document.frm.phone_first.focus;
		            return false;
		       } 
	         else if(document.frm.phone_middle.value.length == 0){
	            alert("휴대전화번호를 다시 확인해주세요.")
	            document.frm.phone_middle.focus;
	            return false;
	         } 
	         else if(document.frm.phone_last.value.length == 0){
	            alert("휴대전화번호를 다시 확인해주세요.")
	            document.frm.phone_last.focus;
	            return false;
	         } 
	         else if(document.frm.email.value.length == 0){
	            alert("이메일을 다시 확인해주세요.")
	            document.frm.email.focus;
	            return false;
	         } 
	         else if(document.frm.postcode.value.length == 0){
	            alert("우편번호를 다시 확인해주세요.")
	            document.frm.postcode.focus;
	            return false;
	         } 
	         else if(document.frm.addressDefault.value.length == 0){
	            alert("주소를 다시 확인해주세요.")
	            document.frm.addressDefault.focus;
	            return false;
	         }
	      }
		
//직접입력란.. 직접입력 선택해야만 직접입력input보이게....
		function display(){
	          var select = document.getElementById("select_emailDomain");
	             var option_directInput = document.getElementById("option_directInput");
	             var input_emailDomain = document.getElementById("input_emailDomain");

	             if (select.value === "") {
	                 option_directInput.disabled = false;
	                 input_emailDomain.disabled = false;
	             } else {
	                 option_directInput.disabled = true;
	                 input_emailDomain.disabled = true;
	             }

		}

		</script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>