package dto.member;
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
    private int     lessonCount;        // DB: lesson_count — 남은 수업 횟수
    private String  lastSession;        // DB: last_session
    private String  status;             // DB: STATUS  DEFAULT 'all'
    private int     age;

    // ── 화면/세션용 추가 필드 (WorkoutPlanDTO 호환) ───────────
    private String  level;              // 운동 수준 (초급/중급/고급) - 화면 표시용
    private String  frequency;          // 운동 빈도 (주 3회 등) - 화면 표시용

    // ── JOIN용 필드 (USER 테이블, DB 컬럼 아님) ───────────────
    private String  email;
    private String  nickname;
    private String  profile_image;
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

    public String getProfile_image() { return profile_image; }
    public void setProfile_image(String profile_image) { this.profile_image = profile_image; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public boolean isEmailVerified() { return emailVerified; }
    public void setEmailVerified(boolean emailVerified) { this.emailVerified = emailVerified; }

    public String getSocialType() { return socialType; }
    public void setSocialType(String socialType) { this.socialType = socialType; }

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", userId=" + userId + ", trainerId=" + trainerId + ", gymId=" + gymId
				+ ", purpose=" + purpose + ", experience=" + experience + ", height=" + height + ", weight=" + weight
				+ ", diet=" + diet + ", exerciseCountGoal=" + exerciseCountGoal + ", address=" + address + ", latitude="
				+ latitude + ", longitude=" + longitude + ", name=" + name + ", goals=" + goals + ", nextSession="
				+ nextSession + ", lessonCount=" + lessonCount + ", lastSession=" + lastSession + ", status=" + status
				+ ", age=" + age + ", level=" + level + ", frequency=" + frequency + ", email=" + email + ", nickname="
				+ nickname + ", profile_image=" + profile_image + ", role=" + role + ", emailVerified=" + emailVerified
				+ ", socialType=" + socialType + "]";
	}


    
    

}
