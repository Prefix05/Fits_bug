package dto.member;

public class PaymentDTO {
	 private String orderId;
	    private String email;
	    private int amount;
	    private String productName;
	    private String status; // READY, DONE
	    
		public PaymentDTO() {
			super();
			// TODO Auto-generated constructor stub
		}

		public PaymentDTO(String orderId, String email, int amount, String productName, String status) {
			super();
			this.orderId = orderId;
			this.email = email;
			this.amount = amount;
			this.productName = productName;
			this.status = status;
		}

		public String getOrderId() {
			return orderId;
		}

		public void setOrderId(String orderId) {
			this.orderId = orderId;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public int getAmount() {
			return amount;
		}

		public void setAmount(int amount) {
			this.amount = amount;
		}

		public String getProductName() {
			return productName;
		}

		public void setProductName(String productName) {
			this.productName = productName;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}
	    
}