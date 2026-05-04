package dto.gym;

import java.sql.Date;

public class MembershipRegistration {
	private Integer mrNum;
	private Integer memberNum;
    private Integer membershipNum;
    private Date registerDate;
    private Date startDate;
    private Date endDate;
    private String status;
	public MembershipRegistration(Integer mrNum, Integer memberNum, Integer membershipNum, Date registerDate,
			Date startDate, Date endDate, String status) {
		super();
		this.mrNum = mrNum;
		this.memberNum = memberNum;
		this.membershipNum = membershipNum;
		this.registerDate = registerDate;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
	}
	public MembershipRegistration() {
		super();
	}
	public Integer getMrNum() {
		return mrNum;
	}
	public void setMrNum(Integer mrNum) {
		this.mrNum = mrNum;
	}
	public Integer getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(Integer memberNum) {
		this.memberNum = memberNum;
	}
	public Integer getMembershipNum() {
		return membershipNum;
	}
	public void setMembershipNum(Integer membershipNum) {
		this.membershipNum = membershipNum;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "MembershipRegistration [mrNum=" + mrNum + ", memberNum=" + memberNum + ", membershipNum="
				+ membershipNum + ", registerDate=" + registerDate + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", status=" + status + "]";
	}
	
}
