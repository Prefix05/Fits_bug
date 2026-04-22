package dto;

public class WorkoutPlanDTO {
	private String email; // FK

    private String goal;
    private String level;
    private int height;
    private int weight;
    private String diet;
    private String frequency;
    
	public WorkoutPlanDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public WorkoutPlanDTO(String email, String goal, String level, int height, int weight, String diet,
			String frequency) {
		super();
		this.email = email;
		this.goal = goal;
		this.level = level;
		this.height = height;
		this.weight = weight;
		this.diet = diet;
		this.frequency = frequency;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGoal() {
		return goal;
	}

	public void setGoal(String goal) {
		this.goal = goal;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getDiet() {
		return diet;
	}

	public void setDiet(String diet) {
		this.diet = diet;
	}

	public String getFrequency() {
		return frequency;
	}

	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}
    
	
}