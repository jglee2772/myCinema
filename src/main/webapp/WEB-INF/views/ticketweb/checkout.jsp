<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <link rel="icon" href="data:,">
    <script src="https://js.tosspayments.com/v2/standard"></script>
    <style>
      #successSave {
        display: none;
      }
    </style>
  </head>
  <body>
    <!-- 결제 UI -->
    <div id="payment-method"></div>
    <!-- 이용약관 UI -->
    <div id="agreement"></div>
    <!-- 결제하기 버튼 -->
    <button class="button" id="payment-button" style="margin-top: 30px">결제하기</button>
	<div id="successSave">
		<p>${orderId}</p>
		<p>${uid}</p>
		<p>${moviename}</p>
		<p>${roomname}</p>
		<p>${resultprice}</p>
		<p>${runningtime}</p>
		<p>${resultseat}</p>
		<p>${people}</p>
		<p>${begintime}</p>
		<p>${endtime}</p>
		<p>${datetime}</p>
	</div>
    <script>
      main();

      async function main() {
    	  console.log("결제 페이지 초기화 시작");
    	  const button = document.getElementById("payment-button");
    	  const clientKey = "test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm";
    	  const tossPayments = TossPayments(clientKey);
    	  console.log("TossPayments 객체 생성됨");

    	  const customerKey = "cAg8BbUMvP2EHWtXUraIo";
    	  const widgets = tossPayments.widgets({
    	    customerKey,
    	  });

    	  console.log("결제 금액 설정:", ${resultprice});
    	  await widgets.setAmount({
    	    currency: "KRW",
    	    value: ${resultprice},
    	  });
    	  console.log("결제 금액 설정 완료");

    	  console.log("위젯 렌더링 시작");
    	  await Promise.all([
    	    widgets.renderPaymentMethods({
    	      selector: "#payment-method",
    	      variantKey: "DEFAULT",
    	    }),
    	    widgets.renderAgreement({ selector: "#agreement", variantKey: "AGREEMENT" }),
    	  ]);
    	  console.log("위젯 렌더링 완료");

    	  button.addEventListener("click", async function () {
    	    console.log("결제하기 버튼 클릭됨");
    	    console.log("주문 ID:", "${orderId}");
    	    console.log("영화명:", "${moviename}");
    	    console.log("금액:", ${resultprice});
    	    try {
    	    // 전화번호에서 특수문자 제거 (숫자만 남김)
    	    const mobilePhone = "${mobile}".replace(/[^0-9]/g, '');
    	    console.log("원본 전화번호:", "${mobile}");
    	    console.log("정리된 전화번호:", mobilePhone);
    	    
    	    await widgets.requestPayment({
    	      orderId: "${orderId}",
    	      orderName: "${moviename} ${Aticket} ${Yticket}",
    	      successUrl: window.location.origin + "/success?orderId=" + encodeURIComponent("${orderId}") +
    	      			  "&cid=" + encodeURIComponent("${cid}") +
    	                  "&uid=" + encodeURIComponent("${uid}") +
    	                  "&moviename=" + encodeURIComponent("${moviename}") +
    	                  "&roomname=" + encodeURIComponent("${roomname}") +
    	                  "&resultprice=" + encodeURIComponent("${resultprice}") +
    	                  "&runningtime=" + encodeURIComponent("${runningtime}") +
    	                  "&resultseat=" + encodeURIComponent("${resultseat}") +
    	                  "&people=" + encodeURIComponent("${people}") +
    	                  "&begintime=" + encodeURIComponent("${begintime}") +
    	                  "&endtime=" + encodeURIComponent("${endtime}") +
    	                  "&datetime=" + encodeURIComponent("${datetime}"),
    	      failUrl: window.location.origin + "/fail",
    	      customerEmail: "${email}",
    	      customerName: "${realname}",
    	      customerMobilePhone: mobilePhone,
    	    });
    	    console.log("결제 요청 완료");
    	    } catch (error) {
    	        console.error("결제 요청 에러:", error);
    	        alert("결제 요청 중 오류가 발생했습니다: " + error.message);
    	    }
    	  });
    	}


    </script>
  </body>
</html>
