package dto.member;

public class InbodyRecordDTO {
	private int id;
    private String email;
    private double weight;       // 체중
    private double muscle;       // 골격근량
    private double fat;          // 체지방량
    private String imagePath;    
    private String recordDate;
    
	public InbodyRecordDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public InbodyRecordDTO(int id, String email, double weight, double muscle, double fat, String imagePath,
			String recordDate) {
		super();
		this.id = id;
		this.email = email;
		this.weight = weight;
		this.muscle = muscle;
		this.fat = fat;
		this.imagePath = imagePath;
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

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public double getMuscle() {
		return muscle;
	}

	public void setMuscle(double muscle) {
		this.muscle = muscle;
	}

	public double getFat() {
		return fat;
	}

	public void setFat(double fat) {
		this.fat = fat;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getRecordDate() {
		return recordDate;
	}

	public void setRecordDate(String recordDate) {
		this.recordDate = recordDate;
	}
    
}