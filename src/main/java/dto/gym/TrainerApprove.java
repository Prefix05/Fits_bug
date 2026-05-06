package dto.gym;

public class TrainerApprove {
	private int trainerId;
    private String name;
    private String phoneNum;
    private String profileImg;
    private String approvalStatus;
	public TrainerApprove() {
		super();
	}
	public TrainerApprove(int trainerId, String name, String phoneNum, String profileImg, String approvalStatus) {
		super();
		this.trainerId = trainerId;
		this.name = name;
		this.phoneNum = phoneNum;
		this.profileImg = profileImg;
		this.approvalStatus = approvalStatus;
	}
	public int getTrainerId() {
		return trainerId;
	}
	public void setTrainerId(int trainerId) {
		this.trainerId = trainerId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getApprovalStatus() {
		return approvalStatus;
	}
	public void setApprovalStatus(String approvalStatus) {
		this.approvalStatus = approvalStatus;
	}
	@Override
	public String toString() {
		return "TrainerApprove [trainerId=" + trainerId + ", name=" + name + ", phoneNum=" + phoneNum + ", profileImg="
				+ profileImg + ", approvalStatus=" + approvalStatus + "]";
	}
	
    
}
