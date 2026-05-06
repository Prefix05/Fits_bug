package dto.member;

/**
 * ↔ MEMBERSHIP_REGISTRATION 테이블 (신규)
 * id, member_id, membership_id, register_date, start_date, end_date,
 * status(active/expired)
 */
public class MembershipRegistrationDTO {

    private int    id;
    private int    memberId;       // member_id (FK → MEMBER.id)
    private int    membershipId;   // membership_id (FK → MEMBERSHIP.id)
    private String registerDate;   // register_date (DATE)
    private String startDate;      // start_date
    private String endDate;        // end_date
    private String status;         // ENUM('active','expired')

    // 화면용
    private String memberName;
    private String membershipLabel;

    public MembershipRegistrationDTO() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getMemberId() { return memberId; }
    public void setMemberId(int memberId) { this.memberId = memberId; }

    public int getMembershipId() { return membershipId; }
    public void setMembershipId(int membershipId) { this.membershipId = membershipId; }

    public String getRegisterDate() { return registerDate; }
    public void setRegisterDate(String registerDate) { this.registerDate = registerDate; }

    public String getStartDate() { return startDate; }
    public void setStartDate(String startDate) { this.startDate = startDate; }

    public String getEndDate() { return endDate; }
    public void setEndDate(String endDate) { this.endDate = endDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getMemberName() { return memberName; }
    public void setMemberName(String memberName) { this.memberName = memberName; }

    public String getMembershipLabel() { return membershipLabel; }
    public void setMembershipLabel(String membershipLabel) { this.membershipLabel = membershipLabel; }
}
