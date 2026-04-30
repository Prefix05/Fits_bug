package dto.member;

public class MyPageDTO {

    private LoginDTO member;
    private WorkoutPlanDTO plan;

    public MyPageDTO() {}

    public MyPageDTO(LoginDTO member, WorkoutPlanDTO plan) {
        this.member = member;
        this.plan = plan;
    }

    public LoginDTO getMember() {
        return member;
    }

    public void setMember(LoginDTO member) {
        this.member = member;
    }

    public WorkoutPlanDTO getPlan() {
        return plan;
    }

    public void setPlan(WorkoutPlanDTO plan) {
        this.plan = plan;
    }
}