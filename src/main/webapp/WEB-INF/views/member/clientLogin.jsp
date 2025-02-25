<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>CookCook - 로그인</title>
<!-- JQuery-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap - CSS only -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
   crossorigin="anonymous">
<!-- Bootstrap - JavaScript Bundle with Popper -->
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
   crossorigin="anonymous"></script>
<!-- Bootstrap - icon -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
   rel="stylesheet">
<!-- Font 기본 : {font-family: 'NanumSquareNeoBold'}-->
<link
   href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
   rel="stylesheet">
<!--Popper Development version -->
<script src="https://unpkg.com/@popperjs/core@2"></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>

<!-- 카카오 스크립트 -->
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
   integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx"
   crossorigin="anonymous"></script>
<script>
            Kakao.init('ec820c4eea48288ba6533946b92c5965'); //발급받은 키 중 javascript키를 사용해준다.
         </script>
<!-- gnb css -->
<link href="${path}/resources/css/gnb.css" rel="stylesheet"
   type="text/css">
<!-- css -->
<link rel="stylesheet"
   href="${path}/resources/css/member/clientLogin.css">
<script>
// 일반인 로그인 실패 시 alert창 출력
if(${status=="false"}) {
   alert("아이디와 비밀번호를 확인해주세요.");
}
// 사업자 로그인 실패 시 alert창 출력
else if(${status=="false2"}){
   alert("아이디와 비밀번호를 확인해주세요.");
   register(); // 사업자 로그인 폼으로 바로 이동
}
</script>
</head>

<body>

   <div class="container login_container align-self-center">

      <div class="row button-wrap">
         <div id="btn"></div>
         <div class="col-6">
            <button class="togglebtn" onclick="login()">일반 로그인</button>
         </div>
         <div class="col-6">
            <button class="togglebtn" onclick="register()">판매자 로그인</button>
         </div>
      </div>



      <div class="wrapper mx-auto position-relative" id="full1">
         <div class="position-absolute top-10 end-0 me-5">
            <button type="button" class="btn-close visually-hidden"
               id="btn_close" aria-label="Close" onclick="location.reload();"></button>
         </div>
         <div class="wrapper_login" id="login_view_fadeOut">
            <div class="row d-flex justify-content-center mx-auto p-0 loginForm">
               <div class=" col-md-6 login-form-1">
                  <!-- 로그인 창1 미디어 사이즈 xs이하되면 예만 남음-->
                  <div class="KickKick_logo text-center d-md-block d-none">
                     <a href="/" class="nav_a">
                        <h1 style="font-family: 'NanumSquareNeoHeavy';">🍽CookCook</h1>
                     </a>
                     <h3>일반 로그인에 돌아오신걸 환영해요!</h3>
                  </div>
                  <div class="d-md-none d-block d-flex justify-content-end">
                     <button type="button" class="btn-close" id="btn_to_back"
                        aria-label="Close" onclick="location.href='/';"></button>
                  </div>
                  <form action="/clientMember/login" method="post" id="form_login">
                     <div class="form-group mb-4">
                        <label class="control-label font-weight-bold font-size-7pt">아이디</label>
                        <span>*</span>
                        <div class="form-check float-end">
                           <input class="form-check-input" type="checkbox" value="save_id"
                              id="save_id"> <label class="form-check-label"
                              for="save_id" style="font-size: x-small;">아이디 저장</label>
                        </div>
                        <input type="text" class="form-control" id="id" name="id"
                           required />
                     </div>
                     <div class="form-group">
                        <label class="control-label font-weight-bold font-size-7pt">비밀번호</label>
                        <span>*</span> <input type="password" class="form-control m-0"
                           id="pw" name="pw" required />
                     </div>
                     <div class="form-group mb-4">
                        <a class="btn_forget_pwd" id="btn_forget_pwd">아이디 / 비밀번호를
                           잊으셨나요?</a>
                     </div>
                     <div class="form-group mb-4">
                        <input type="submit" class="site_login form-control"
                           value="Login" />
                     </div>
                  </form>

                  <div class="form-group join_form">
                     아직 계정이 없으신가요? <a href="/clientMember/sign_form" class="btnJoin">가입하기</a>
                  </div>
               </div>
               <!-- 로그인창 2 미디어 사이즈 xs이하면 사라짐 -->
               <div
                  class="d-none d-md-block col-md-6 login-form-2 align-self-center"
                  id="hidden">

                  <!-- 11111111 -->
                  <div class="form-group text-center mb-4">
                     <!--                      <div id="tooltip" role="tooltip" class="mb-3">
                        메인으로!
                        <div id="arrow" class="data-popper-arrow"></div>
                     </div> -->
                     <img src="/resources/img/foodWithPlate.png"
                        class="mx-auto d-block" id="to_main_ball_img" alt="메인으로"
                        onclick="location.href = '/'" style="height: 80%; width: 80%;">
                  </div>

               </div>
            </div>
         </div>
         <!-- id/pw 찾기 누르면 fadeIn -->
         <div class="wrapper_find_member" id="find_member_fadeIn"
            style="display: none">
            <div class="row d-flex justify-content-center mx-auto p-0 loginForm">
               <div class="col-md-6 login-form-1 align-center">
                  <div class="KickKick_logo text-center d-md-block mb-4">
                     <h3 class="mb-5">계정 찾기</h3>
                     <p class="body_font mb-5">휴대폰 인증을 통해 아이디를 확인합니다.</p>
                  </div>
                  <div class="text-center">
                     <input type="checkbox" class="btn-check" id="btn-check-outlined"
                        autocomplete="off"> <label
                        class="btn btn-outline-success" for="btn-check-outlined">휴대폰
                        인증하기</label>
                  </div>
                  <hr>
                  <div>
                     <p class="footer_font">가입했던 계정이 기억나지 않으신가요?</p>
                     <p class="footer_font">걱정마세요!</p>
                     <p class="footer_font">customer@CookCook.co.kr로 문의하시길 바랍니다.</p>
                  </div>
               </div>
            </div>
         </div>
         <!-- 휴대폰 인증하기 누르면 fadeIn -->
         <div class="wrapper_phone_Certification justify-content-center"
            id="to_phone_authentication_fadeIn" style="display: none">
            <div class="KickKick_logo text-center d-md-block mb-5">
               <h1 class="mb-4">🍽CookCook</h1>
               <h3>이제 얼마 안남았습니다!</h3>
            </div>
            <div class="row g-3">
               <div class="col-12 col-md-4 text-end">
                  <label for="phone" class="col-form-label">전화번호</label>
               </div>
               <div class="col-12 col-md-4">
                  <input type="text" id="phone" name="phone" class="form-control"
                     placeholder="(-) 제외">
               </div>
               <div class="col-12 col-md-4">
                  <button type="submit" class="btn btn-outline-success"
                     id="phone_auth">인증번호 받기</button>
               </div>

            </div>
            <br>
            <div class="row g-3">
               <div class="col-12 col-md-4 text-end">
                  <label class="col-form-label">인증번호</label>
               </div>
               <div class="col-12 col-md-4">
                  <input type="text" id="phone_auth_code" class="form-control">
               </div>
               <div class="col-12 col-md-4">
                  <button type="button" class="btn btn-outline-success"
                     id="phone_auth_ok">인증</button>
               </div>
               <div class="row g-3 m-0 p-0  justify-content-center">
                  <div class="col-12 col-md-4">
                     <div class="timer">
                        <div id="timeLimit"></div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- 인증하기 누르면 fadeIn -->
         <div class="wrapper_change_pw justify-content-center"
            id="to_change_pw_fadeIn" style="display: none">
            <div class="KickKick_logo text-center d-md-block mb-5">
               <h1 class="mb-4">🍽CookCook</h1>
               <h3 id="search_id"></h3>
               <h3>이제 진짜 진짜 얼마 안남았어요!</h3>
            </div>
            <div class="text-center">
               <p id="search_id2"></p>
            </div>
            <div class="row d-flex justify-content-center">
               <div class="col-12 col-md-6 mb-1">
                  <div class="input-group d-flex">
                     <input type="password" class="form-control rounded mt-1"
                        placeholder="새 비밀번호" aria-label="password"
                        aria-describedby="password" id="password" class="password" />
                     <div class="valid-feedback" style="font-size: x-small;">Good</div>
                     <div class="invalid-feedback" style="font-size: x-small;">Wrong</div>
                  </div>
               </div>
            </div>
            <div class="row d-flex justify-content-center">
               <div class="col-12 col-md-6 mt-1">
                  <div class="input-group d-flex">
                     <input type="password" class="form-control rounded mt-1"
                        placeholder="새 비밀번호" aria-label="password"
                        aria-describedby="password_check" id="password_check"
                        class="password_check" />
                     <div class="valid-feedback" style="font-size: x-small;">Good</div>
                     <div class="invalid-feedback" style="font-size: x-small;">Wrong</div>
                  </div>
               </div>
               <br>
               <div class="row d-flex justify-content-center">
                  <div class="col-6 mt-4 mt-xxl-0 w-auto h-auto">
                     <div class="alert px-4 py-3 mb-0 alert-warning d-none"
                        role="alert" data-mdb-color="warning" id="password-alert">
                        <ul class="list-unstyled mb-0">
                           <li class="requirements leng"><i
                              class="bi bi-check text-success me-2"></i> <i
                              class="bi bi-x text-danger me-3"></i> 암호는 8자 이상이어야 합니다</li>
                           <li class="requirements big-letter"><i
                              class="bi bi-check text-success me-2"></i> <i
                              class="bi bi-x text-danger me-3"></i> 암호에 하나 이상의 알파벳 대문자를 포함해야
                              합니다.</li>
                           <li class="requirements num"><i
                              class="bi bi-check text-success me-2"></i> <i
                              class="bi bi-x text-danger me-3"></i> 암호에 숫자가 하나 이상 포함되어야 합니다.
                           </li>
                           <li class="requirements special-char"><i
                              class="bi bi-check text-success me-2"></i> <i
                              class="bi bi-x text-danger me-3"></i> 암호에 특수문자가 하나 이상 포함되어야
                              합니다.</li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
            <br>
            <div class="row d-flex justify-content-center">
               <div class="col-12 col-md-6 d-flex justify-content-center">
                  <button type="button" class="btn btn-outline-success"
                     id="btn_change_pw">비밀번호 변경하기</button>
               </div>
            </div>
         </div>
      </div>


      <div class="wrapper mx-auto position-relative" id="full2">
         <div class="position-absolute top-10 end-0 me-5">
            <button type="button" class="btn-close visually-hidden"
               id="btn_close2" aria-label="Close" onclick="location.reload();"></button>
         </div>
         <div class="wrapper_login" id="login_view_fadeOut2">
            <div class="row d-flex justify-content-center mx-auto p-0 loginForm">
               <div class=" col-md-6 login-form-1">
                  <!-- 로그인 창1 미디어 사이즈 xs이하되면 예만 남음-->
                  <div class="KickKick_logo text-center d-md-block d-none">
                     <a href="/" class="nav_a">
                        <h1 style="font-family: 'NanumSquareNeoHeavy';">🍽CookCook</h1>
                     </a>
                     <h3>판매자 로그인에 돌아오신걸 환영해요!</h3>
                  </div>
                  <div class="d-md-none d-block d-flex justify-content-end">
                     <button type="button" class="btn-close" id="btn_to_back"
                        aria-label="Close" onclick="location.href='/';"></button>
                  </div>
                  <form action="/businessMember/login" method="post" id="form_login">
                     <div class="form-group mb-4">
                        <label class="control-label font-weight-bold font-size-7pt">사업자
                           등록 번호</label> <span>*</span>
                        <div class="form-check float-end">
                           <input class="form-check-input" type="checkbox" value="save_id"
                              id="save_id"> <label class="form-check-label"
                              for="save_id" style="font-size: x-small;">사업자 등록 번호 저장</label>
                        </div>
                        <input type="text" class="form-control" id="id"
                           name="businessId" maxlength="10"
                           placeholder="사업자등록번호 10자리(숫자)를 입력하세요."
                           oninput="validateInput(event)" required />

                     </div>
                     <div class="form-group">
                        <label class="control-label font-weight-bold font-size-7pt">비밀번호</label>
                        <span>*</span> <input type="password" class="form-control m-0"
                           id="pw" name="pw" required />
                     </div>
                     <div class="form-group mb-4">
                        <a class="btn_forget_pwd" id="btn_forget_pwd2">아이디 / 비밀번호를
                           잊으셨나요?</a>
                     </div>
                     <div class="form-group mb-4">
                        <input type="submit" class="site_login form-control"
                           value="Login" />
                     </div>
                  </form>

                  <div class="form-group join_form">
                     아직 계정이 없으신가요? <a href="/businessMember/sign_form" class="btnJoin">가입하기</a>
                  </div>
               </div>
               <!-- 로그인창 2 미디어 사이즈 xs이하면 사라짐 -->
               <div
                  class="d-none d-md-block col-md-6 login-form-2 align-self-center"
                  id="hidden">

                  <!-- 11111111 -->
                  <div class="form-group text-center mb-4">
                     <!--                      <div id="tooltip" role="tooltip" class="mb-3">
                        메인으로!
                        <div id="arrow" class="data-popper-arrow"></div>
                     </div> -->
                     <img src="/resources/img/foodWithPlate.png"
                        class="mx-auto d-block" id="to_main_ball_img" alt="메인으로"
                        onclick="location.href = '/'" style="height: 80%; width: 80%;">
                  </div>

               </div>
            </div>
         </div>
         <!-- id/pw 찾기 누르면 fadeIn -->
         <div class="wrapper_find_member" id="find_member_fadeIn2"
            style="display: none">
            <div class="row d-flex justify-content-center mx-auto p-0 loginForm">
               <div class="col-md-6 login-form-1 align-center">
                  <div class="KickKick_logo text-center d-md-block mb-4">
                     <h3 class="mb-5">계정 찾기</h3>
                     <p class="body_font mb-5">휴대폰 인증을 통해 아이디를 확인합니다.</p>
                  </div>
                  <div class="text-center">
                     <input type="checkbox" class="btn-check" id="btn-check-outlined2"
                        autocomplete="off"> <label
                        class="btn btn-outline-success" for="btn-check-outlined2">휴대폰
                        인증하기</label>
                  </div>
                  <hr>
                  <div>
                     <p class="footer_font">가입했던 계정이 기억나지 않으신가요?</p>
                     <p class="footer_font">걱정마세요!</p>
                     <p class="footer_font">customer@KickKick.co.kr로 문의하시길 바랍니다.</p>
                  </div>
               </div>
            </div>
         </div>
         <!-- 휴대폰 인증하기 누르면 fadeIn -->
         <div class="wrapper_phone_Certification justify-content-center"
            id="to_phone_authentication_fadeIn2" style="display: none">
            <div class="KickKick_logo text-center d-md-block mb-5">
               <h1 class="mb-4">🍽CookCook</h1>
               <h3>이제 얼마 안남았습니다!</h3>
            </div>
            <div class="row g-3">
               <div class="col-12 col-md-4 text-end">
                  <label for="phone" class="col-form-label">전화번호</label>
               </div>
               <div class="col-12 col-md-4">
                  <input type="text" id="businessPhone" name="businessPhone"
                     class="form-control" placeholder="(-) 제외">
               </div>
               <div class="col-12 col-md-4">
                  <button type="submit" class="btn btn-outline-success"
                     id="businessPhoneOk2">인증번호 받기</button>
               </div>
            </div>

            <br>

            <div class="row g-3">
               <div class="col-12 col-md-4 text-end">
                  <label class="col-form-label">인증번호</label>
               </div>
               <div class="col-12 col-md-4">
                  <input type="text" id="businessPhoneCode" class="form-control">
               </div>
               <div class="col-12 col-md-4">
                  <button type="button" class="btn btn-outline-success"
                     id="businessPhoneOk">인증</button>
               </div>
               <div class="row g-3 m-0 p-0  justify-content-center">
                  <div class="col-12 col-md-4">
                     <div class="timer">
                        <div id="timeLimit2"></div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- 인증하기 누르면 fadeIn -->
         <div class="wrapper_change_pw justify-content-center"
            id="to_change_pw_fadeIn2" style="display: none">
            <div class="KickKick_logo text-center d-md-block mb-5">
               <h1 class="mb-4">🍽CookCook</h1>
               <h3 id="businessScId"></h3>
               <h3>이제 진짜 진짜 얼마 안남았어요!</h3>
            </div>
            <div class="text-center">
               <p id="bSearch_id2"></p>
            </div>
            <div class="row d-flex justify-content-center">
               <div class="col-12 col-md-6 mb-1">
                  <div class="input-group d-flex">
                     <input type="password" class="form-control rounded mt-1"
                        placeholder="새 비밀번호" aria-label="password"
                        aria-describedby="password" id="businessPw" class="password" />
                     <div class="valid-feedback" style="font-size: x-small;">Good</div>
                     <div class="invalid-feedback" style="font-size: x-small;">Wrong</div>
                  </div>
               </div>
            </div>
            <div class="row d-flex justify-content-center">
               <div class="col-12 col-md-6 mt-1">
                  <div class="input-group d-flex">
                     <input type="password" class="form-control rounded mt-1"
                        placeholder="새 비밀번호" aria-label="password"
                        aria-describedby="password_check" id="businessPw_check"
                        class="password_check" />
                     <div class="valid-feedback" style="font-size: x-small;">Good</div>
                     <div class="invalid-feedback" style="font-size: x-small;">Wrong</div>
                  </div>
               </div>
               <br>
               <div class="row d-flex justify-content-center">
                  <div class="col-6 mt-4 mt-xxl-0 w-auto h-auto">
                     <div class="alert px-4 py-3 mb-0 alert-warning d-none"
                        role="alert" data-mdb-color="warning" id="businessPw-alert">
                        <ul class="list-unstyled mb-0">
                           <li class="requirements leng"><i
                              class="bi bi-check text-success me-2"></i> <i
                              class="bi bi-x text-danger me-3"></i> 암호는 8자 이상이어야 합니다</li>
                           <li class="requirements big-letter"><i
                              class="bi bi-check text-success me-2"></i> <i
                              class="bi bi-x text-danger me-3"></i> 암호에 하나 이상의 알파벳 대문자를 포함해야
                              합니다.</li>
                           <li class="requirements num"><i
                              class="bi bi-check text-success me-2"></i> <i
                              class="bi bi-x text-danger me-3"></i> 암호에 숫자가 하나 이상 포함되어야 합니다.
                           </li>
                           <li class="requirements special-char"><i
                              class="bi bi-check text-success me-2"></i> <i
                              class="bi bi-x text-danger me-3"></i> 암호에 특수문자가 하나 이상 포함되어야
                              합니다.</li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
            <br>
            <div class="row d-flex justify-content-center">
               <div class="col-12 col-md-6 d-flex justify-content-center">
                  <button type="button" class="btn btn-outline-success"
                     id="businessBtnChangePw">비밀번호 변경하기</button>
               </div>
            </div>
         </div>
      </div>

      <script>

//사업자 아이디 입력칸 숫자만 입력되게 해주는 정규식이벤트입니다.
function validateInput(event) {
     var input = event.target;
     var regex = /[^0-9]/g;
     input.value = input.value.replace(regex, '');
 }

     // 쿠키 저장 함수
     function setCookie(cookieName, value, exdays) {
        let exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        let cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
     }
     // 쿠키 삭제 함수
     function deleteCookie(cookieName) {
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
     }
     // 쿠키 가져오기
     function getCookie(cookieName) {
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if (start != -1) { // 쿠키가 존재하면
           start += cookieName.length;
           var end = cookieData.indexOf(';', start);
           if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
              end = cookieData.length;
           cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
     }
     // 아이디 저장
     $(document).ready(function name() {
        // 쿠키에 저장된 id 값 가져와서 세팅
        let save_id = getCookie("save_id");
        $("#id").val(save_id);
        // 체크 박스 값 세팅
        if ($("#id").val() != "") {
           $("#save_id").attr("checked", true);
        }
        // 체크박스 변화 유무에 따른 쿠키 저장 - 7일 저장
        $("#save_id").change(function () {
           if ($("#save_id").is(":checked")) {
              setCookie("save_id", $("#id").val(), 7);
           } else {
              deleteCookie("save_id");
           }
        });
        // 체크 상태에서 ID 입력한 경우 - 7일 저장
        $("#id").keyup(function () {
           if ($("#save_id").is(":checked")) {
              setCookie("save_id", $("#id").val(), 7);
           }
        });
     });
     // 아이디/비밀번호 찾기 버튼
     $("#btn_forget_pwd").on("click", function () {
        $("#login_view_fadeOut").hide();
        $("#find_member_fadeIn").fadeIn();
        $("#btn_close").removeClass("visually-hidden");
     });
     $("#btn_forget_pwd2").on("click", function () {
        $("#login_view_fadeOut2").hide();
        $("#find_member_fadeIn2").fadeIn();
        $("#btn_close2").removeClass("visually-hidden");
     });
     // 휴대폰 인증하기 버튼
     $("#btn-check-outlined").on("click", function () {
        $("#login_view_fadeOut").hide();
        $("#find_member_fadeIn").hide();
        $("#to_phone_authentication_fadeIn").fadeIn();
        $("#btn_close").removeClass("visually-hidden");
     });
     $("#btn-check-outlined2").on("click", function () {
        $("#login_view_fadeOut2").hide();
        $("#find_member_fadeIn2").hide();
        $("#to_phone_authentication_fadeIn2").fadeIn();
        $("#btn_close2").removeClass("visually-hidden");
     });
     // 타이머 구현
     function $ComTimer() { }
     $ComTimer.prototype = {
        comSecond: "",
        fnCallback: function () { },
        timer: "",
        domId: "",
        fnTimer: function () {
           // 남은 시간 계산
           var m = Math.floor(this.comSecond / 60) + "분 " + (this.comSecond % 60) + "초";
           // 1초씩 감소
           this.comSecond--;
           this.domId.innerText = m;
           // 시간이 종료 되었으면..
           if (this.comSecond < 0) {
              // 타이머 해제
              clearInterval(this.timer);
              alert("인증시간이 초과하였습니다. 다시 인증해주시기 바랍니다.");
           $.ajax({
          url : "/clientMember/removeSession"
          })
              $("#phone_auth").attr("disabled", false);
              $("#timeLimit").text("");
              $("#timeLimit2").text("");
           }
        },
        fnStop: function () { clearInterval(this.timer); }
     }
     
     
     // 인증번호 받기 버튼 이벤트
     $("#phone_auth").on("click", function (evt) {
        // 전화번호 check 및 인증번호 발송
        $.ajax({
           url: "/clientMember/sendSmsLogin",
           type: "post",
           dataType: "json",
           data: { phone: $("#phone").val() }
        }).done(function (resp) {
           // 전화번호 check
           if (!resp) {
              $("#phone").val("");
              alert("전화번호를 확인해주세요.");
              return false;
           }
           else {
           // 인증번호 받기 버튼 비활성화
           $("#phone_auth").attr("disabled", true);
           alert("인증번호가 발송되었습니다.");
           
           AuthTimer = new $ComTimer();
           // 제한 시간
           AuthTimer.comSecond = 180;
           // 제한 시간 만료 메세지
           AuthTimer.fnCallback = function () { alert("다시인증을 시도해주세요.") };
           AuthTimer.timer = setInterval(function () { AuthTimer.fnTimer() }, 1000);
           AuthTimer.domId = document.getElementById("timeLimit");
           }

        });
     });
  // 사업자 인증번호 받기 버튼 이벤트
     $("#businessPhoneOk2").on("click", function (evt) {
        // 전화번호 check 및 인증번호 발송
        $.ajax({
           url: "/businessMember/sendSmsLogin",
           type: "post",
           dataType: "json",
           data: { phone: $("#businessPhone").val() }
        }).done(function (resp) {
           // 전화번호 check
           if (!resp) {
              $("#businessPhone").val("");
              alert("전화번호를 확인해주세요.");
              return false;
           }
           else {
           // 인증번호 받기 버튼 비활성화
           $("#businessPhoneOk2").attr("disabled", true);
           alert("인증번호가 발송되었습니다.");
           
           AuthTimer = new $ComTimer();
           // 제한 시간
           AuthTimer.comSecond = 180;
           // 제한 시간 만료 메세지
           AuthTimer.fnCallback = function () { alert("다시인증을 시도해주세요.") };
           AuthTimer.timer = setInterval(function () { AuthTimer.fnTimer() }, 1000);
           AuthTimer.domId = document.getElementById("timeLimit2");
           }

        });
     });
     // 인증 버튼 이벤트
     $("#phone_auth_ok").on("click", function () {
        //입력 안했을 경우
        if (!$("#phone_auth_code").val()) {
           alert("인증번호를 입력해주세요");
           return false;
        }
        // 인증 체크
        $.ajax({
           url: "/clientMember/certificationLogin",
           type: "post",
           dataType: "json",
           data: { code: $("#phone_auth_code").val() }
        }).done(function name(resp) {
           if (resp.success) {
               AuthTimer.fnStop();  
              $("#login_view_fadeOut").hide();
              $("#find_member_fadeIn").hide();
              $("#to_phone_authentication_fadeIn").hide();
              $("#to_change_pw_fadeIn").fadeIn();
              $("#search_id").text(resp.searchId + " 님!");
              $("#search_id2").text("아이디는 "+resp.searchId + " 입니다");
           } else {
              alert("인증번호를 다시 입력해주세요");
              $("#phone_auth_code").val("");
           }
        });
     }); 
     
     // 사업자 인증 버튼 이벤트
     $("#businessPhoneOk").on("click", function () {
         //입력 안했을 경우
         if (!$("#businessPhoneCode").val()) {
            alert("인증번호를 입력해주세요");
            return false;
         }
         // 인증 체크
         $.ajax({
            url: "/businessMember/certificationLogin",
            type: "post",
            dataType: "json",
            data: { code: $("#businessPhoneCode").val() }
         }).done(function name(resp) {
            
            if (resp.success) {
             AuthTimer.fnStop(); 
               $("#login_view_fadeOut2").hide();
               $("#find_member_fadeIn2").hide();
               $("#to_phone_authentication_fadeIn2").hide();
               $("#to_change_pw_fadeIn2").fadeIn();
               $("#businessScId").text(resp.businessId + " 님!");
               $("#businessScId2").text("아이디는 "+resp.businessId + " 입니다");
            } else {
               alert("인증번호를 다시 입력해주세요");
               $("#businessPhoneCode").val("");
            }
         });
      });
     //pw 유효성 검사
     addEventListener("DOMContentLoaded", (event) => {
        const password = document.getElementById("password");
        const passwordAlert = document.getElementById("password-alert");
        const requirements = document.querySelectorAll(".requirements");
        let lengBoolean, bigLetterBoolean, numBoolean, specialCharBoolean;
        let leng = document.querySelector(".leng");
        let bigLetter = document.querySelector(".big-letter");
        let num = document.querySelector(".num");
        let specialChar = document.querySelector(".special-char");
        const specialChars = "!@#$%^&*()-_=+[{]}\\|;:'\",<.>/?`~";
        const numbers = "0123456789";

        requirements.forEach((element) => element.classList.add("wrong"));

        password.addEventListener("focus", () => {
           passwordAlert.classList.remove("d-none");
           if (!password.classList.contains("is-valid")) {
              password.classList.add("is-invalid");
           }
        });

        password.addEventListener("input", () => {
           let value = password.value;
           if (value.length < 8) {
              lengBoolean = false;
           } else if (value.length > 7) {
              lengBoolean = true;
           }

           if (value.toLowerCase() == value) {
              bigLetterBoolean = false;
           } else {
              bigLetterBoolean = true;
           }

           numBoolean = false;
           for (let i = 0; i < value.length; i++) {
              for (let j = 0; j < numbers.length; j++) {
                 if (value[i] == numbers[j]) {
                    numBoolean = true;
                 }
              }
           }

           specialCharBoolean = false;
           for (let i = 0; i < value.length; i++) {
              for (let j = 0; j < specialChars.length; j++) {
                 if (value[i] == specialChars[j]) {
                    specialCharBoolean = true;
                 }
              }
           }

           if (lengBoolean == true && bigLetterBoolean == true && numBoolean == true && specialCharBoolean == true) {
              password.classList.remove("is-invalid");
              password.classList.add("is-valid");

              requirements.forEach((element) => {
                 element.classList.remove("wrong");
                 element.classList.add("good");
              });
              passwordAlert.classList.remove("alert-warning");
              passwordAlert.classList.add("alert-success");
           } else {
              password.classList.remove("is-valid");
              password.classList.add("is-invalid");

              passwordAlert.classList.add("alert-warning");
              passwordAlert.classList.remove("alert-success");

              if (lengBoolean == false) {
                 leng.classList.add("wrong");
                 leng.classList.remove("good");
              } else {
                 leng.classList.add("good");
                 leng.classList.remove("wrong");
              }

              if (bigLetterBoolean == false) {
                 bigLetter.classList.add("wrong");
                 bigLetter.classList.remove("good");
              } else {
                 bigLetter.classList.add("good");
                 bigLetter.classList.remove("wrong");
              }

              if (numBoolean == false) {
                 num.classList.add("wrong");
                 num.classList.remove("good");
              } else {
                 num.classList.add("good");
                 num.classList.remove("wrong");
              }

              if (specialCharBoolean == false) {
                 specialChar.classList.add("wrong");
                 specialChar.classList.remove("good");
              } else {
                 specialChar.classList.add("good");
                 specialChar.classList.remove("wrong");
              }
           }
        });

        password.addEventListener("blur", () => {
           passwordAlert.classList.add("d-none");
           if (password.value == "") {
              password.classList.remove("is-invalid");
           }
        });
     });
     //pw 일치 검사
     addEventListener("DOMContentLoaded", (event) => {
        const password = document.getElementById("password_check");
        const passwordAlert = document.getElementById("password-alert");
        const requirements = document.querySelectorAll(".requirements");

        password.addEventListener("focus", () => {
           if (!password.classList.contains("is-valid")) {
              password.classList.add("is-invalid");
           }
        });
        requirements.forEach((element) => element.classList.add("wrong"));

        password.addEventListener("input", () => {
           let value = password.value;
           if (value == document.getElementById("password").value) {
              password.classList.remove("is-invalid");
              password.classList.add("is-valid");

              requirements.forEach((element) => {
                 element.classList.remove("wrong");
                 element.classList.add("good");
              });
              passwordAlert.classList.remove("alert-warning");
              passwordAlert.classList.add("alert-success");
           }
        });

        password.addEventListener("blur", () => {
           if (password.value == "") {
              password.classList.remove("is-invalid");
           }
        });
     });
     
     
     //사업자
   //pw 유효성 검사
     addEventListener("DOMContentLoaded", (event) => {
        const password = document.getElementById("businessPw");
        const passwordAlert = document.getElementById("businessPw-alert");
        const requirements = document.querySelectorAll(".requirements");
        let lengBoolean, bigLetterBoolean, numBoolean, specialCharBoolean;
        let leng = document.querySelector(".leng");
        let bigLetter = document.querySelector(".big-letter");
        let num = document.querySelector(".num");
        let specialChar = document.querySelector(".special-char");
        const specialChars = "!@#$%^&*()-_=+[{]}\\|;:'\",<.>/?`~";
        const numbers = "0123456789";

        requirements.forEach((element) => element.classList.add("wrong"));

        password.addEventListener("focus", () => {
           passwordAlert.classList.remove("d-none");
           if (!password.classList.contains("is-valid")) {
              password.classList.add("is-invalid");
           }
        });

        password.addEventListener("input", () => {
           let value = password.value;
           if (value.length < 8) {
              lengBoolean = false;
           } else if (value.length > 7) {
              lengBoolean = true;
           }

           if (value.toLowerCase() == value) {
              bigLetterBoolean = false;
           } else {
              bigLetterBoolean = true;
           }

           numBoolean = false;
           for (let i = 0; i < value.length; i++) {
              for (let j = 0; j < numbers.length; j++) {
                 if (value[i] == numbers[j]) {
                    numBoolean = true;
                 }
              }
           }

           specialCharBoolean = false;
           for (let i = 0; i < value.length; i++) {
              for (let j = 0; j < specialChars.length; j++) {
                 if (value[i] == specialChars[j]) {
                    specialCharBoolean = true;
                 }
              }
           }

           if (lengBoolean == true && bigLetterBoolean == true && numBoolean == true && specialCharBoolean == true) {
              password.classList.remove("is-invalid");
              password.classList.add("is-valid");

              requirements.forEach((element) => {
                 element.classList.remove("wrong");
                 element.classList.add("good");
              });
              passwordAlert.classList.remove("alert-warning");
              passwordAlert.classList.add("alert-success");
           } else {
              password.classList.remove("is-valid");
              password.classList.add("is-invalid");

              passwordAlert.classList.add("alert-warning");
              passwordAlert.classList.remove("alert-success");

              if (lengBoolean == false) {
                 leng.classList.add("wrong");
                 leng.classList.remove("good");
              } else {
                 leng.classList.add("good");
                 leng.classList.remove("wrong");
              }

              if (bigLetterBoolean == false) {
                 bigLetter.classList.add("wrong");
                 bigLetter.classList.remove("good");
              } else {
                 bigLetter.classList.add("good");
                 bigLetter.classList.remove("wrong");
              }

              if (numBoolean == false) {
                 num.classList.add("wrong");
                 num.classList.remove("good");
              } else {
                 num.classList.add("good");
                 num.classList.remove("wrong");
              }

              if (specialCharBoolean == false) {
                 specialChar.classList.add("wrong");
                 specialChar.classList.remove("good");
              } else {
                 specialChar.classList.add("good");
                 specialChar.classList.remove("wrong");
              }
           }
        });

        password.addEventListener("blur", () => {
           passwordAlert.classList.add("d-none");
           if (password.value == "") {
              password.classList.remove("is-invalid");
           }
        });
     });
     //pw 일치 검사
     addEventListener("DOMContentLoaded", (event) => {
        const password = document.getElementById("businessPw_check");
        const passwordAlert = document.getElementById("businessPw-alert");
        const requirements = document.querySelectorAll(".requirements");

        password.addEventListener("focus", () => {
           if (!password.classList.contains("is-valid")) {
              password.classList.add("is-invalid");
           }
        });
        requirements.forEach((element) => element.classList.add("wrong"));

        password.addEventListener("input", () => {
           let value = password.value;
           if (value == document.getElementById("businessPw").value) {
              password.classList.remove("is-invalid");
              password.classList.add("is-valid");

              requirements.forEach((element) => {
                 element.classList.remove("wrong");
                 element.classList.add("good");
              });
              passwordAlert.classList.remove("alert-warning");
              passwordAlert.classList.add("alert-success");
           }
        });

        password.addEventListener("blur", () => {
           if (password.value == "") {
              password.classList.remove("is-invalid");
           }
        });
     });
     //사업자
     
     
     //pw 변경
     $("#btn_change_pw").on("click", function () {
        let password = $("#password").val();
        let password_check = $("#password_check").val();
        if (password == password_check && password != "") {
           $.ajax({
              url: "/clientMember/changePw",
              type: "post",
              data: { id: $("#search_id").text().split(" ")[0], pw: $("#password").val() }
           }).done(function () {
              alert("비밀번호가 변경되었습니다.")
              location.reload();
           });
        } else {
           $("#password").val("");
           $("#password_check").val("");
           alert("다시 입력해주세요");
        }
     });
     
     //사업자 pw 변경
     $("#businessBtnChangePw").on("click", function () {
         let password = $("#businessPw").val();
         let password_check = $("#businessPw_check").val();
         if (password == password_check && password != "") {
            $.ajax({
               url: "/businessMember/changePw",
               type: "post",
               data: { businessId: $("#businessScId").text().split(" ")[0], pw: $("#businessPw").val() }
            }).done(function () {
               alert("비밀번호가 변경되었습니다.")
               location.reload();
            });
         } else {
            $("#businessPw").val("");
            $("#businessPw_check").val("");
            alert("다시 입력해주세요");
         }
      });
     const image = document.querySelector("#to_main_ball_img");
     const tooltip = document.querySelector("#tooltip");

     const { createPopper } = Popper;
     createPopper(image, tooltip, {
        placement: 'top',
        modifiers: [{
           name: 'offset',
           options: { offset: [0, 8] }
        }],
     });

     
     //카카오 로그인
     $(".kakao_login").on("click", function loginWithKakao() {
        alert("아직 구현되지 않았습니다");
     });

     //naver_login
     $(".naver_login").on("click", function () {
        alert("아직 구현되지 않았습니다");
     });

     //apple_login
     $(".apple_login").on("click", function () {
        alert("아직 구현되지 않았습니다");
     });

     var full1 = document.getElementById("full1");
     var full2 = document.getElementById("full2");
     var z = document.getElementById("btn");
     function login(){
         z.style.left = "0";
         full1.style.display="block";
         full2.style.display="none";
     }
     function register(){
         z.style.left = "110px";
         full1.style.display="none";
         full2.style.display="block";
     }
</script>
</body>

</html>