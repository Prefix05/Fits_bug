<%@ page contentType="text/html;charset=UTF-8" %>
<script src="https://js.tosspayments.com/v1/payment"></script>

<select id="time">
    <option value="2026-04-30 10:00:00">10:00</option>
    <option value="2026-04-30 12:00:00">12:00</option>
</select>

<button onclick="pay()">결제하기</button>

<script>
function pay(){

	<%-- fetch("<%=request.getContextPath()%>/payment", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: "amount=50000&productName=PT"
    })
    .then(res => res.json())
    .then(data => {

    	console.log("server response:", data);
    	
    	if(!data.orderId){
            alert("서버 응답 오류");
            return;
        } --%>
        const data = {
                orderId: "ORDER_" + new Date().getTime(),
                amount: 50000,
                productName: "PT 더미상품"
            };

            console.log("더미 데이터:", data);

        const tossPayments = TossPayments("test_ck_5OWRapdA8dJO4LMYoZWYVo1zEqZK");

        tossPayments.requestPayment("카드", {
            amount: data.amount,
            orderId: data.orderId,
            orderName: data.productName,

            successUrl: window.location.origin + "<%=request.getContextPath()%>/paymentSuccess.jsp",
            failUrl: window.location.origin + "<%=request.getContextPath()%>/fail.jsp"
        });
    
    /* .catch(err => {
        console.error("결제 실패:", err);
    }); */
}
</script>