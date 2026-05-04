package dto.member;

public class MealLogDTO {
	private int id;
    private String email;
    private String foodName;
    private double gram;
    private double calorie;
    private String recordDate;
    
	public MealLogDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MealLogDTO(int id, String email, String foodName, double gram, double calorie, String recordDate) {
		super();
		this.id = id;
		this.email = email;
		this.foodName = foodName;
		this.gram = gram;
		this.calorie = calorie;
		this.recordDate = recordDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public double getGram() {
		return gram;
	}

	public void setGram(double gram) {
		this.gram = gram;
	}

	public double getCalorie() {
		return calorie;
	}

	public void setCalorie(double calorie) {
		this.calorie = calorie;
	}

	public String getRecordDate() {
		return recordDate;
	}

	public void setRecordDate(String recordDate) {
		this.recordDate = recordDate;
	}
    
}