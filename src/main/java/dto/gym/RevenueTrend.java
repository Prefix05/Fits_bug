package dto.gym;

public class RevenueTrend {
	private String month;
    private int totalPercent;
    private int membershipPercent;
	public RevenueTrend() {
		super();
	}
	public RevenueTrend(String month, int totalPercent, int membershipPercent) {
		super();
		this.month = month;
		this.totalPercent = totalPercent;
		this.membershipPercent = membershipPercent;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getTotalPercent() {
		return totalPercent;
	}
	public void setTotalPercent(int totalPercent) {
		this.totalPercent = totalPercent;
	}
	public int getMembershipPercent() {
		return membershipPercent;
	}
	public void setMembershipPercent(int membershipPercent) {
		this.membershipPercent = membershipPercent;
	}
    
}
