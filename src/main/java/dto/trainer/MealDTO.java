package dto.trainer;

import java.time.LocalTime;

public class MealDTO {

    private String day;          // "MON", "TUE" (DB-friendly)
    private String name;
    private int kcal;
    private int protein;
    private int carbs;
    private int fat;

    private LocalTime time;      // better than String
    private String mealType;     // BREAKFAST, LUNCH, DINNER

    public MealDTO() {}

    public MealDTO(String day, String name, int kcal, int protein, int carbs, int fat,
                   LocalTime time, String mealType) {
        this.day = day;
        this.name = name;
        this.kcal = kcal;
        this.protein = protein;
        this.carbs = carbs;
        this.fat = fat;
        this.time = time;
        this.mealType = mealType;
    }

    // getters / setters

    public String getDay() { return day; }
    public void setDay(String day) { this.day = day; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public int getKcal() { return kcal; }
    public void setKcal(int kcal) { this.kcal = kcal; }

    public int getProtein() { return protein; }
    public void setProtein(int protein) { this.protein = protein; }

    public int getCarbs() { return carbs; }
    public void setCarbs(int carbs) { this.carbs = carbs; }

    public int getFat() { return fat; }
    public void setFat(int fat) { this.fat = fat; }

    public LocalTime getTime() { return time; }
    public void setTime(LocalTime time) { this.time = time; }

    public String getMealType() { return mealType; }
    public void setMealType(String mealType) { this.mealType = mealType; }
}