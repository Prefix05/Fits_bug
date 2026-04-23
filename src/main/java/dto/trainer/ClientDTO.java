package dto.trainer;

public class ClientDTO {
    private int clientId;
    private String name;
    private String goals;          // 쉼표 구분 "체중 감량,근력 증강"
    private String nextSession;    // 다음 세션 텍스트 "오늘 오후 6:00"
    private int lessonCount;       // 남은 세션 횟수
    private String lastSession;    // 전 세션 날짜 "4/28"
    private String status;         // "all" | "review" | "today" | "done"

    // ──────────────────────────────
    // Getters & Setters
    // ──────────────────────────────
    public int getClientId() { return clientId; }
    public void setClientId(int clientId) { this.clientId = clientId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getGoals() { return goals; }
    public void setGoals(String goals) { this.goals = goals; }

    public String getNextSession() { return nextSession; }
    public void setNextSession(String nextSession) { this.nextSession = nextSession; }

    public int getLessonCount() { return lessonCount; }
    public void setLessonCount(int lessonCount) { this.lessonCount = lessonCount; }

    public String getLastSession() { return lastSession; }
    public void setLastSession(String lastSession) { this.lastSession = lastSession; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}