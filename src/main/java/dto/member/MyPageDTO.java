package dto.member;

/**
 * 마이페이지 통합 DTO
 *
 * ✅ WorkoutPlanDTO plan 필드 제거
 *    → MemberDTO 에 height/weight/diet/goals/level/frequency 모두 포함됨
 *    → member 하나로 모든 정보 관리
 */
public class MyPageDTO {

    private MemberDTO member;

    public MyPageDTO() {}

    public MyPageDTO(MemberDTO member) {
        this.member = member;
    }

    public MemberDTO getMember() { return member; }
    public void setMember(MemberDTO member) { this.member = member; }

    // ── WorkoutPlanDTO 호환 alias ─────────────────────────────
    // 이전 코드에서 dto.getPlan().getGoal() 형태로 쓰던 것 호환
    /** @deprecated member.getGoals() 사용 권장 */
    public MemberDTO getPlan() { return member; }
    /** @deprecated member 사용 권장 */
    public void setPlan(MemberDTO m) { this.member = m; }

    // MyPageServiceImpl 에서 dto.setUser() 호출하던 코드 호환
    /** @deprecated setMember() 사용 권장 */
    public void setUser(MemberDTO m) { this.member = m; }
    /** @deprecated getMember() 사용 권장 */
    public MemberDTO getUser() { return member; }
}
