<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String name = (String) request.getAttribute("name");
	String email = (String) request.getAttribute("email");
	String phone = (String) request.getAttribute("phone");
	String address = (String) request.getAttribute("address");
	//int totalPrice = (int) request.getAttribute("totalPrice");
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<body>
	<script type="text/javascript">
		$(function () {
 			var IMP = window.IMP;	
			IMP.init('imp60246449');
			var msg;

		IMP.request_pay({
		     pg : 'kakaopay',
	            pay_method : 'card',
	            merchant_uid : 'merchant_' + new Date().getTime(),
	            name : '공부하랑 스터디룸 예약 결제',
	           <%--  amount : <%=totalPrice%>, --%>
	            buyer_email : '<%=email%>',
	            buyer_name : '<%=name%>',
	            buyer_tel : '<%=phone%>',
	            buyer_addr : '<%=address%>',
	            buyer_postcode : '123-456',

			}, function(rsp) {
			if(rsp.success) {
				//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
				 jQuery.ajax({
					url:"/payments/complete", //cross-domain error가 발생하지않도록 주의
					type:'POST',
					dataType:'json',
					data: {
						imp_uid:rsp.imp_uid
						//기타 필요한 데이터가 있으면 추가 전달
					}
				 }).done(function(data)) {
					//[2] 서버에서 REST API로 결제정보 확인 및 서비스 루틴이 정상적인경우
					if(everythings_fine) {
						msg = '결제가 완료되었습니다.';
						msg += '\n고유ID :' +rsp.imp_uid;
						msg += '\n상점거래ID :' + rsp.merchant_uid;
						msg += '\결제 금액 :' +rsp.paid_amount;
						msg += '카드 승인번호 :' + rsp.apply_num;
						
						alert(msg);
					}else {
						//[3] 아직 제대로 결제가 되지 않았습니다
						//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동 취소 처리 하였습니다.
						
					}
				});
		//성공시 이동할 페이지
		location.href ="success.jsp";
					
				} else {
					msg= '결제에 실패하였습니다.';
					msg+= '에러내용 :' +rsp.error_msg;
					//실패시 이동할 페이지
					location.href = "fail.jsp";
					alert(msg);
					
				}
						
						
						
				 });
				
			});

		});
	</script>
</body>
</html>