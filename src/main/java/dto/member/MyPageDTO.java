package dto.member;

public class MyPageDTO {

    private MemberDTO member;
    private WorkoutPlanDTO plan;

    public MyPageDTO() {}

    public MyPageDTO(MemberDTO member, WorkoutPlanDTO plan) {
        this.member = member;
        this.plan = plan;
    }

    public MemberDTO getMember() {
        return member;
    }

    public void setMember(MemberDTO member) {
        this.member = member;
    }

    public WorkoutPlanDTO getPlan() {
        return plan;
    }

    public void setPlan(WorkoutPlanDTO plan) {
        this.plan = plan;
    }
}