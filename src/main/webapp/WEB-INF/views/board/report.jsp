<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
   <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">


<style>
div {
	padding: 10px;
	font-family: 'NanumSquareNeo';
	box-sizing: border-box;
}

.container {
	padding: 0;
	overflow-x: hidden;
}

#content_box {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
<div class="container">
		<div class="row header" style="border-bottom: 1px solid #d2d4d6">
			<div class="col-12 text-center" id="title">
				<h2 style="font-family: 'NanumSquareNeoExtraBold';">신고하기</h2>
			</div>
		</div>
		<div class="row body" style="border-bottom: 1px solid #d2d4d6">

			<div class="col-12 target_box">
				<h4>신고</h4>
				<div class="row contents_box p-0 m-1"
					style="border: 1px solid #d2d4d6">
					<input type="hidden" value="${b_c}" id="b_c"> <input
						type="hidden" value="${target.code}" id="target_code"> <input
						type="hidden" value="${type}" id="type">



					<div class="col-12">신고자 : ${nickname}${companyname}</div>
					<div class="col-12">신고 대상 : ${reporteeName}</div>
					
				</div>
			</div>
			<div class="col-12 reason_box">
				<h4>신고 사유</h4>
				<ul class="list-group">
					<li class="list-group-item"><input
						class="form-check-input me-1 report_kind" type="radio"
						name="report_kind" value="1001" id="firstRadio" checked> <label
						class="form-check-label" for="firstRadio">스팸홍보/도배글입니다.</label></li>
					<li class="list-group-item"><input
						class="form-check-input me-1 report_kind" type="radio"
						name="report_kind" value="1002" id="secondRadio"> <label
						class="form-check-label" for="secondRadio">불법정보를 포함하고
							있습니다.</label></li>
					<li class="list-group-item"><input
						class="form-check-input me-1 report_kind" type="radio"
						name="report_kind" value="1003" id="thirdRadio"> <label
						class="form-check-label" for="thirdRadio">음란물입니다.</label></li>
					<li class="list-group-item"><input
						class="form-check-input me-1 report_kind" type="radio"
						name="report_kind" value="1004" id="fourthRadio"> <label
						class="form-check-label" for="fourthRadio">불쾌한 표현이 있습니다.</label></li>
					<li class="list-group-item"><input
						class="form-check-input me-1 report_kind" type="radio"
						name="report_kind" value="1005" id="thirdRadio"> <label
						class="form-check-label" for="fifthRadio">개인정보가 노출되었습니다.</label></li>
					<li class="list-group-item"><input
						class="form-check-input me-1 report_kind" type="radio"
						name="report_kind" value="1006" id="thirdRadio"> <label
						class="form-check-label" for="sixthRadio">기타</label>
						<div class="row">
							<textarea type="text" name="detail" placeholder="신고사유를 입력해주세요( 최대 500자 )"
								id="detail" style="height:300px" disabled></textarea>
						</div></li>
				</ul>
			</div>
		</div>
		<div class="row footer">
			<div class="col-6 d-grid">
				<button type="submit" class="btn btn-primary" id="report">신고</button>
			</div>
			<div class="col-6 d-grid">
				<button type="button" class="btn btn-secondary" id="cancel">취소</button>
			</div>
		</div>

	</div>
	<script>
	
	
	$("#detail").on("input", function () {
        var maxLength = 500;
        var detail = $(this).val();

        if (detail.length > maxLength) {
            alert("최대 500자까지 입력할 수 있습니다.");
            detail = detail.slice(0, maxLength - 1);
            $(this).val(detail);
        }
    }); // 기타 글자수 제한
    
    
			let reason_select = $("#firstRadio").val();
            $(".report_kind").on("click",function(){
               if($(this).val()==1006){
                  $("#detail").attr("disabled",false);
                  reason_select=$(this).val();
               }
               else{
                  $("#detail").attr("disabled",true);
                  reason_select=$(this).val();
               }
            });
            $("#report").on("click",function(){
               console.log(reason_select);
               if(confirm("신고하시겠습니까?")){
                  $.ajax({
                     url:"/board/reportFree",
                     type:"post",
                     dataType:"json",
                     data:{
                    	 
                    	postcode:${list.postcode},
                    	boardKindCode : ${list.boardKindCode},
                    	reportKindCode: reason_select,
                    	reporterCode: ${list.reporterCode},
                    	reporteeCode: ${list.reporteeCode},
                    	detail: $("#detail").val(),
                    	statusCode : 3001

                     },
                  }).done(function(resp){
                     if(resp==1){
                        alert("신고가 접수되었습니다.");
                        window.close();
                     }
                  });
               }
            });
            $("#cancel").on("click",function(){
               window.close();
            });
			</script>
</body>
</html>