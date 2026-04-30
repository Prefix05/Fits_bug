package dto.member;

public class TrainerDTO {
    private int trainerId;
    private String name;
    private String profileImg;
    private String specialty;
    private double rating;
    private double similarity;

    private int price10;
    private int price1;

    private String career;

	public TrainerDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TrainerDTO(int trainerId, String name, String profileImg, String specialty, double rating, double similarity,
			int price10, int price1, String career) {
		super();
		this.trainerId = trainerId;
		this.name = name;
		this.profileImg = profileImg;
		this.specialty = specialty;
		this.rating = rating;
		this.similarity = similarity;
		this.price10 = price10;
		this.price1 = price1;
		this.career = career;
	}

	public int getTrainerId() {
		return trainerId;
	}

	public void setTrainerId(int trainerId) {
		this.trainerId = trainerId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public String getSpecialty() {
		return specialty;
	}

	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public double getSimilarity() {
		return similarity;
	}

	public void setSimilarity(double similarity) {
		this.similarity = similarity;
	}

	public int getPrice10() {
		return price10;
	}

	public void setPrice10(int price10) {
		this.price10 = price10;
	}

	public int getPrice1() {
		return price1;
	}

	public void setPrice1(int price1) {
		this.price1 = price1;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}
    
}