package dto.member;

public class MemberDTO {

    // ── MEMBER 테이블 컬럼 ──────────────────────────────────────
    private int     id;
    private Integer userId;         // user_id (FK)
    private Integer trainerId;      // trainer_id
    private Integer gymId;          // gym_id

    private String  purpose;
    private String  experience;

    private int     height;
    private int     weight;

    private String  diet;
    private String  exerciseCountGoal; // DB 컬럼: exerciseCount_goal

    private String  address;
    private double  latitude;
    private double  longitude;

    private String  name;
    private String  goals;
    private String  nextSession;    // next_session

    private int     lessonCount;    // lesson_count
    private int     totalLessons;   // total_lessons

    private String  lastSession;    // last_session
    private String  status;

    private int     age;

    // ── JOIN용 transient 필드 (USER 테이블에서 가져옴) ──────────
    private String  email;          // USER.email (세션 키로도 사용)
    private String  nickname;       // USER.nickname
    private String  profileImg;     // USER.profileImg
    private String  role;           // USER.role
    private boolean emailVerified;  // USER.email_verified
    private String  socialType;     // USER.provider (카카오 등)

    // ─── 기본 생성자 ────────────────────────────────────────────
    public MemberDTO() {}

    // ─── getter / setter ────────────────────────────────────────

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

    // ── JOIN용 필드 getter/setter ────────────────────────────────

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
		return "MemberDTO [id=" + id + ", userId=" + userId + ", trainerId=" + trainerId + ", gymId=" + gymId
				+ ", purpose=" + purpose + ", experience=" + experience + ", height=" + height + ", weight=" + weight
				+ ", diet=" + diet + ", exerciseCountGoal=" + exerciseCountGoal + ", address=" + address + ", latitude="
				+ latitude + ", longitude=" + longitude + ", name=" + name + ", goals=" + goals + ", nextSession="
				+ nextSession + ", lessonCount=" + lessonCount + ", totalLessons=" + totalLessons + ", lastSession="
				+ lastSession + ", status=" + status + ", age=" + age + ", email=" + email + ", nickname=" + nickname
				+ ", profileImg=" + profileImg + ", role=" + role + ", emailVerified=" + emailVerified + ", socialType="
				+ socialType + "]";
	}
    
    

}
