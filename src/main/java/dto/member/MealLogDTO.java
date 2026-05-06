package dto.member;

/**
 * ↔ MEAL_LOG 테이블
 * id, member_id, meal_date, meal, totcalorie
 *
 * 변경: 기존 email/foodName/gram 구조 → DB 컬럼 기준으로 수정
 *       meal_date(DATE), meal(LONGTEXT), totcalorie(INTEGER)
 */
public class MealLogDTO {

    private int    id;
    private int    memberId;    // member_id (FK → MEMBER.id)
    private String mealDate;   // meal_date (DATE)
    private String meal;       // 식단 내용 전체 텍스트 (LONGTEXT)
    private int    totCalorie; // totcalorie

    // ── 화면 표시용 (JOIN용, DB 컬럼 아님) ──────────────────────
    private String email;      // USER.email (JOIN용)
    private String foodName;   // 개별 식품명 (상세 입력 시 사용)
    private double gram;       // 섭취량 (g)
    private double calorie;    // 단일 식품 칼로리

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

    public int getTotCalorie() { return totCalorie; }
    public void setTotCalorie(int totCalorie) { this.totCalorie = totCalorie; }

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
