package dto.member;

public class MyPageDTO {

    private UserDTO user;
    private WorkoutPlanDTO plan;

    public MyPageDTO() {}

    public MyPageDTO(UserDTO user, WorkoutPlanDTO plan) {
        this.user = user;
        this.plan = plan;
    }

    public UserDTO getUser() {
        return user;
    }

    public void setUser(UserDTO loginUser) {
        this.user = loginUser;
    }

    public WorkoutPlanDTO getPlan() {
        return plan;
    }

    public void setPlan(WorkoutPlanDTO plan) {
        this.plan = plan;
    }
}