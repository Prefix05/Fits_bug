package dto.gym;

import java.util.Date;

public class Sales {
	 private String memberName;
	    private String membershipType; // day, month, pt
	    private int typeRep;           // 개월 / 횟수 / 일수
	    private String trainerName;
	    private Date paymentDate;
	    private int paymentPrice;
	    private int paymentFee;
	    private int netPrice; // 계산값
	    private String status;
	    private Date canceledAt;
	    private String reason;

		public Sales() {
			super();
		}

		

		public Sales(String memberName, String membershipType, int typeRep, String trainerName, Date paymentDate,
				int paymentPrice, int paymentFee, int netPrice, String status, Date canceledAt, String reason) {
			super();
			this.memberName = memberName;
			this.membershipType = membershipType;
			this.typeRep = typeRep;
			this.trainerName = trainerName;
			this.paymentDate = paymentDate;
			this.paymentPrice = paymentPrice;
			this.paymentFee = paymentFee;
			this.netPrice = netPrice;
			this.status = status;
			this.canceledAt = canceledAt;
			this.reason = reason;
		}



		public String getMemberName() {
			return memberName;
		}

		public void setMemberName(String memberName) {
			this.memberName = memberName;
		}

		public String getMembershipType() {
			return membershipType;
		}

		public void setMembershipType(String membershipType) {
			this.membershipType = membershipType;
		}

		public int getTypeRep() {
			return typeRep;
		}

		public void setTypeRep(int typeRep) {
			this.typeRep = typeRep;
		}

		public String getTrainerName() {
			return trainerName;
		}

		public void setTrainerName(String trainerName) {
			this.trainerName = trainerName;
		}

		public Date getPaymentDate() {
			return paymentDate;
		}

		public void setPaymentDate(Date paymentDate) {
			this.paymentDate = paymentDate;
		}

		public int getPaymentPrice() {
			return paymentPrice;
		}

		public void setPaymentPrice(int paymentPrice) {
			this.paymentPrice = paymentPrice;
		}

		public int getPaymentFee() {
			return paymentFee;
		}

		public void setPaymentFee(int paymentFee) {
			this.paymentFee = paymentFee;
		}

		public int getNetPrice() {
			return netPrice;
		}

		public void setNetPrice(int netPrice) {
			this.netPrice = netPrice;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}



		public Date getCanceledAt() {
			return canceledAt;
		}



		public void setCanceledAt(Date canceledAt) {
			this.canceledAt = canceledAt;
		}



		public String getReason() {
			return reason;
		}



		public void setReason(String reason) {
			this.reason = reason;
		}
	    
}
