package dto.member;

/**
 * ↔ PAYMENT 테이블 (DB SQL 기준으로 수정)
 * DB 실제 컬럼:
 *   id, user_id, user_name, membership_id, mp_id(FK→MEMBERSHIP_PT),
 *   gym_id, trainer_id, payment_date, payment_price, payment_fee,
 *   method, status(결제완료/취소완료/환불요청/환불완료),
 *   payment_type(MEMBERSHIP/PT), canceled_at, reason
 *
 * 수정: mr_id → mp_id (MEMBERSHIP_PT 참조)
 */
public class PaymentDTO {

    private int    id;
    private Integer userId;        // user_id (FK → USER.id)
    private String userName;       // user_name
    private Integer membershipId;  // membership_id (FK → MEMBERSHIP.id)
    private Integer mpId;          // mp_id (FK → MEMBERSHIP_PT.id) ← 기존 mrId에서 수정
    private Integer gymId;
    private Integer trainerId;
    private String paymentDate;    // payment_date (DATETIME)
    private double paymentPrice;   // payment_price
    private double paymentFee;     // payment_fee
    private String method;
    private String status;         // 결제완료/취소완료/환불요청/환불완료
    private String paymentType;    // MEMBERSHIP / PT
    private String canceledAt;     // canceled_at
    private String reason;

    // ── 이전 코드 호환용 필드 ──────────────────────────────────
    private String orderId;        // 토스 주문 ID (TOSS 테이블 연동용)
    private String email;          // USER.email (JOIN용)
    private int    amount;         // payment_price의 정수형 별칭
    private String productName;    // 상품명 (화면 표시용)
    private boolean used;

    public PaymentDTO() {}

    // ── getter / setter ─────────────────────────────────────────

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Integer getUserId() { return userId; }
    public void setUserId(Integer userId) { this.userId = userId; }

    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    public Integer getMembershipId() { return membershipId; }
    public void setMembershipId(Integer membershipId) { this.membershipId = membershipId; }

    /** DB 컬럼: mp_id (FK → MEMBERSHIP_PT.id) */
    public Integer getMpId() { return mpId; }
    public void setMpId(Integer mpId) { this.mpId = mpId; }

    /** 이전 코드 호환 (mrId → mpId) */
    public Integer getMrId() { return mpId; }
    public void setMrId(Integer mrId) { this.mpId = mrId; }

    public Integer getGymId() { return gymId; }
    public void setGymId(Integer gymId) { this.gymId = gymId; }

    public Integer getTrainerId() { return trainerId; }
    public void setTrainerId(Integer trainerId) { this.trainerId = trainerId; }

    public String getPaymentDate() { return paymentDate; }
    public void setPaymentDate(String paymentDate) { this.paymentDate = paymentDate; }

    public double getPaymentPrice() { return paymentPrice; }
    public void setPaymentPrice(double paymentPrice) {
        this.paymentPrice = paymentPrice;
        this.amount = (int) paymentPrice;
    }

    public double getPaymentFee() { return paymentFee; }
    public void setPaymentFee(double paymentFee) { this.paymentFee = paymentFee; }

    public String getMethod() { return method; }
    public void setMethod(String method) { this.method = method; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getPaymentType() { return paymentType; }
    public void setPaymentType(String paymentType) { this.paymentType = paymentType; }

    public String getCanceledAt() { return canceledAt; }
    public void setCanceledAt(String canceledAt) { this.canceledAt = canceledAt; }

    public String getReason() { return reason; }
    public void setReason(String reason) { this.reason = reason; }

    // 호환용
    public String getOrderId() { return orderId; }
    public void setOrderId(String orderId) { this.orderId = orderId; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public int getAmount() { return (int) paymentPrice; }
    public void setAmount(int amount) { this.amount = amount; this.paymentPrice = amount; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public boolean isUsed() { return used; }
    public void setUsed(boolean used) { this.used = used; }
}
