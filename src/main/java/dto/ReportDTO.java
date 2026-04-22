package dto;

public class ReportDTO {

    private int postId;
    private String reason;
    private String detail;
    private String userId;
    
	public ReportDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReportDTO(int postId, String reason, String detail, String userId) {
		super();
		this.postId = postId;
		this.reason = reason;
		this.detail = detail;
		this.userId = userId;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
    
}