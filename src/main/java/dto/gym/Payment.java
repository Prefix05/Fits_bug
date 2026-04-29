package dto.gym;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Payment {
	private Integer paymentNum;
    private String userEmail;
    private Integer membershipNum;
    private Integer mrNum;
    private Timestamp paymentDate;
    private BigDecimal paymentPrice;
    private BigDecimal paymentFee;
    private String method;
    private String status;
    private Timestamp createdAt;
    private String memberName;
    private String membershipName;
    private String reason;
    private Timestamp canceledAt;
	public Payment() {
		super();
	}
	
	public Payment(Integer paymentNum, String userEmail, Integer membershipNum, Integer mrNum, Timestamp paymentDate,
			BigDecimal paymentPrice, BigDecimal paymentFee, String method, String status, Timestamp createdAt,
			String memberName, String membershipName, String reason, Timestamp canceledAt) {
		super();
		this.paymentNum = paymentNum;
		this.userEmail = userEmail;
		this.membershipNum = membershipNum;
		this.mrNum = mrNum;
		this.paymentDate = paymentDate;
		this.paymentPrice = paymentPrice;
		this.paymentFee = paymentFee;
		this.method = method;
		this.status = status;
		this.createdAt = createdAt;
		this.memberName = memberName;
		this.membershipName = membershipName;
		this.reason = reason;
		this.canceledAt = canceledAt;
	}

	public Integer getPaymentNum() {
		return paymentNum;
	}
	public void setPaymentNum(Integer paymentNum) {
		this.paymentNum = paymentNum;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public Integer getMembershipNum() {
		return membershipNum;
	}
	public void setMembershipNum(Integer membershipNum) {
		this.membershipNum = membershipNum;
	}
	public Integer getMrNum() {
		return mrNum;
	}
	public void setMrNum(Integer mrNum) {
		this.mrNum = mrNum;
	}
	public Timestamp getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Timestamp paymentDate) {
		this.paymentDate = paymentDate;
	}
	public BigDecimal getPaymentPrice() {
		return paymentPrice;
	}
	public void setPaymentPrice(BigDecimal paymentPrice) {
		this.paymentPrice = paymentPrice;
	}
	public BigDecimal getPaymentFee() {
		return paymentFee;
	}
	public void setPaymentFee(BigDecimal paymentFee) {
		this.paymentFee = paymentFee;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	
	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMembershipName() {
		return membershipName;
	}

	public void setMembershipName(String membershipName) {
		this.membershipName = membershipName;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Timestamp getCanceledAt() {
		return canceledAt;
	}

	public void setCanceledAt(Timestamp canceledAt) {
		this.canceledAt = canceledAt;
	}

	
	
}
