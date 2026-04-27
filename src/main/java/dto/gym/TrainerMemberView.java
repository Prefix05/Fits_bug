package dto.gym;

public class TrainerMemberView {
	private String memberName;
    private String membershipName;
    private int remainingSession;
    private String startDate;
	public TrainerMemberView() {
		super();
	}
	public TrainerMemberView(String memberName, String membershipName, int remainingSession, String startDate) {
		super();
		this.memberName = memberName;
		this.membershipName = membershipName;
		this.remainingSession = remainingSession;
		this.startDate = startDate;
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
	public int getRemainingSession() {
		return remainingSession;
	}
	public void setRemainingSession(int remainingSession) {
		this.remainingSession = remainingSession;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	@Override
	public String toString() {
		return "TrainerMemberView [memberName=" + memberName + ", membershipName=" + membershipName
				+ ", remainingSession=" + remainingSession + ", startDate=" + startDate + "]";
	}
    
    
}
