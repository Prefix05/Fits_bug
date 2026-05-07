package dto.member;

/**
 * ↔ MEAL_LOG 테이블 (DB SQL 기준으로 수정)
 * DB 실제 컬럼:
 *   id, member_id, meal_date, meal, derscription(typo),
 *   totcalorie, meal_time, calories, protein, carbs, fat, image_url
 */
public class MealLogDTO {

    private int    id;
    private int    memberId;       // member_id (FK → MEMBER.id)
    private String mealDate;       // meal_date (DATE)
    private String meal;           // 식단 내용 전체 텍스트 (LONGTEXT)
    private String description;    // DB: derscription (LONGTEXT) — DB 오타 그대로 유지
    private int    totCalorie;     // totcalorie (INTEGER)
    private String mealTime;       // meal_time (TIME)
    private int    calories;       // calories (INTEGER)
    private int    protein;        // protein (INTEGER)
    private int    carbs;          // carbs (INTEGER)
    private int    fat;            // fat (INTEGER)
    private String imageUrl;       // image_url (VARCHAR(255))

    // ── 화면 표시용 (JOIN용, DB 컬럼 아님) ──────────────────────
    private String email;          // USER.email (JOIN용)
    private String foodName;       // 개별 식품명 (상세 입력 시 사용)
    private double gram;           // 섭취량 (g)
    private double calorie;        // 단일 식품 칼로리

    public MealLogDTO() {}

    public MealLogDTO(int id, int memberId, String mealDate, String meal, int totCalorie) {
        this.id         = id;
        this.memberId   = memberId;
        this.mealDate   = mealDate;
        this.meal       = meal;
        this.totCalorie = totCalorie;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getMemberId() { return memberId; }
    public void setMemberId(int memberId) { this.memberId = memberId; }

    public String getMealDate() { return mealDate; }
    public void setMealDate(String mealDate) { this.mealDate = mealDate; }

    public String getMeal() { return meal; }
    public void setMeal(String meal) { this.meal = meal; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public int getTotCalorie() { return totCalorie; }
    public void setTotCalorie(int totCalorie) { this.totCalorie = totCalorie; }

    public String getMealTime() { return mealTime; }
    public void setMealTime(String mealTime) { this.mealTime = mealTime; }

    public int getCalories() { return calories; }
    public void setCalories(int calories) { this.calories = calories; }

    public int getProtein() { return protein; }
    public void setProtein(int protein) { this.protein = protein; }

    public int getCarbs() { return carbs; }
    public void setCarbs(int carbs) { this.carbs = carbs; }

    public int getFat() { return fat; }
    public void setFat(int fat) { this.fat = fat; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    // 화면용
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getFoodName() { return foodName; }
    public void setFoodName(String foodName) { this.foodName = foodName; }

    public double getGram() { return gram; }
    public void setGram(double gram) { this.gram = gram; }

    public double getCalorie() { return calorie; }
    public void setCalorie(double calorie) { this.calorie = calorie; }
}
