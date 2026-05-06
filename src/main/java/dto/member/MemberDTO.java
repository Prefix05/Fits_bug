package dto.member;

/**
 * ↔ MEMBER 테이블 (회원 기본 정보 + 운동 계획 통합)
 *
 * CREATE TABLE MEMBER (
 *   id               INTEGER AUTO_INCREMENT PRIMARY KEY,
 *   user_id          INTEGER,
 *   trainer_id       INTEGER,
 *   gym_id           INTEGER,
 *   purpose          ENUM('diet','balance','bulk-up'),
 *   experience       ENUM('first(0)','beginner(<1)','intermediate(1~3)','high(>3)'),
 *   height           INTEGER,
 *   weight           INTEGER,
 *   diet             ENUM('YES','Intermediate','NO'),
 *   exerciseCount_goal ENUM('<=2','3~4','>5'),
 *   address          VARCHAR(255),
 *   latitude         DECIMAL(10,7),
 *   longitude        DECIMAL(10,7),
 *   NAME             VARCHAR(50),
 *   goals            VARCHAR(50),
 *   next_session     VARCHAR(100),
 *   lesson_count     INTEGER DEFAULT 0,
 *   total_lessons    INTEGER DEFAULT 10,
 *   last_session     VARCHAR(50),
 *   STATUS           VARCHAR(50) DEFAULT 'all',
 *   age              INTEGER
 * );
 *
 * ✅ WorkoutPlanDTO 통합: height, weight, diet, exerciseCountGoal
 *    + goals, experience, purpose → MEMBER 테이블 직접 관리
 *
 * + JOIN용 필드 (USER 테이블): email, nickname, profileImg, role
 * + 화면용 추가 필드: level, frequency (WorkoutPlanDTO 호환)
 */
public class MemberDTO {

    // ── MEMBER 테이블 컬럼 ─────────────────────────────────────
    private int     id;
    private Integer userId;              // user_id  (FK → USER.id)
    private Integer trainerId;           // trainer_id
    private Integer gymId;              // gym_id

    private String  purpose;            // ENUM('diet','balance','bulk-up')
    private String  experience;         // ENUM('first(0)','beginner(<1)',...)

    // ✅ WorkoutPlanDTO에서 통합된 필드
    private int     height;             // height INTEGER
    private int     weight;             // weight INTEGER
    private String  diet;               // ENUM('YES','Intermediate','NO')
    private String  exerciseCountGoal;  // DB: exerciseCount_goal

    private String  address;
    private double  latitude;
    private double  longitude;

    private String  name;               // DB: NAME
    private String  goals;              // goals VARCHAR(50) ← 운동 목표
    private String  nextSession;        // DB: next_session
    private int     lessonCount;        // DB: lesson_count  DEFAULT 0
    private int     totalLessons;       // DB: total_lessons DEFAULT 10
    private String  lastSession;        // DB: last_session
    private String  status;             // DB: STATUS  DEFAULT 'all'
    private int     age;

    // ── 화면/세션용 추가 필드 (WorkoutPlanDTO 호환) ───────────
    private String  level;              // 운동 수준 (초급/중급/고급) - 화면 표시용
    private String  frequency;          // 운동 빈도 (주 3회 등) - 화면 표시용

    // ── JOIN용 필드 (USER 테이블, DB 컬럼 아님) ───────────────
    private String  email;
    private String  nickname;
    private String  profileImg;
    private String  role;
    private boolean emailVerified;
    private String  socialType;         // USER.provider

    public MemberDTO() {}

    // ── getter / setter ──────────────────────────────────────

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Integer getUserId() { return userId; }
    public void setUserId(Integer userId) { this.userId = userId; }

    public Integer getTrainerId() { return trainerId; }
    public void setTrainerId(Integer trainerId) { this.trainerId = trainerId; }

    public Integer getGymId() { return gymId; }
    public void setGymId(Integer gymId) { this.gymId = gymId; }

    public String getPurpose() { return purpose; }
    public void setPurpose(String purpose) { this.purpose = purpose; }

    public String getExperience() { return experience; }
    public void setExperience(String experience) { this.experience = experience; }

    public int getHeight() { return height; }
    public void setHeight(int height) { this.height = height; }

    public int getWeight() { return weight; }
    public void setWeight(int weight) { this.weight = weight; }

    public String getDiet() { return diet; }
    public void setDiet(String diet) { this.diet = diet; }

    public String getExerciseCountGoal() { return exerciseCountGoal; }
    public void setExerciseCountGoal(String exerciseCountGoal) {
        this.exerciseCountGoal = exerciseCountGoal;
    }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public double getLatitude() { return latitude; }
    public void setLatitude(double latitude) { this.latitude = latitude; }

    public double getLongitude() { return longitude; }
    public void setLongitude(double longitude) { this.longitude = longitude; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getGoals() { return goals; }
    public void setGoals(String goals) { this.goals = goals; }

    // WorkoutPlanDTO.getGoal() 호환
    public String getGoal() { return goals; }
    public void setGoal(String goal) { this.goals = goal; }

    public String getNextSession() { return nextSession; }
    public void setNextSession(String nextSession) { this.nextSession = nextSession; }

    public int getLessonCount() { return lessonCount; }
    public void setLessonCount(int lessonCount) { this.lessonCount = lessonCount; }

    public int getTotalLessons() { return totalLessons; }
    public void setTotalLessons(int totalLessons) { this.totalLessons = totalLessons; }

    public String getLastSession() { return lastSession; }
    public void setLastSession(String lastSession) { this.lastSession = lastSession; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }

    // 화면용 (WorkoutPlanDTO 호환)
    public String getLevel() { return level; }
    public void setLevel(String level) { this.level = level; }

    public String getFrequency() { return frequency; }
    public void setFrequency(String frequency) { this.frequency = frequency; }

    // JOIN용
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getNickname() { return nickname; }
    public void setNickname(String nickname) { this.nickname = nickname; }

    public String getProfileImg() { return profileImg; }
    public void setProfileImg(String profileImg) { this.profileImg = profileImg; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public boolean isEmailVerified() { return emailVerified; }
    public void setEmailVerified(boolean emailVerified) { this.emailVerified = emailVerified; }

    public String getSocialType() { return socialType; }
    public void setSocialType(String socialType) { this.socialType = socialType; }

    @Override
    public String toString() {
        return "MemberDTO{id=" + id + ", email='" + email
                + "', nickname='" + nickname + "', goals='" + goals + "'}";
    }
}
