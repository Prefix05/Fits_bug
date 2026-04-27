package dto.gym;

public class TrainerAssign {
	private String trainerName;
    private String memberName;
    private String assignedAt;
    private String membershipName;
    private String remainingInfo;
    private String status;
	
    public TrainerAssign() {
		super();
	}

	public TrainerAssign(String trainerName, String memberName, String assignedAt, String membershipName,
			String remainingInfo, String status) {
		super();
		this.trainerName = trainerName;
		this.memberName = memberName;
		this.assignedAt = assignedAt;
		this.membershipName = membershipName;
		this.remainingInfo = remainingInfo;
		this.status = status;
	}

	public String getTrainerName() {
		return trainerName;
	}

	public void setTrainerName(String trainerName) {
		this.trainerName = trainerName;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getAssignedAt() {
		return assignedAt;
	}

	public void setAssignedAt(String assignedAt) {
		this.assignedAt = assignedAt;
	}

	public String getMembershipName() {
		return membershipName;
	}

	public void setMembershipName(String membershipName) {
		this.membershipName = membershipName;
	}

	public String getRemainingInfo() {
		return remainingInfo;
	}

	public void setRemainingInfo(String remainingInfo) {
		this.remainingInfo = remainingInfo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "TrainerAssign [trainerName=" + trainerName + ", memberName=" + memberName + ", assignedAt=" + assignedAt
				+ ", membershipName=" + membershipName + ", remainingInfo=" + remainingInfo + ", status=" + status
				+ "]";
	}
    
    
}
