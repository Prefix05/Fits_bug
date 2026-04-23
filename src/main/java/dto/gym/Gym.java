package dto;

public class Gym {
    private int id;
    private String name;
    private String phoneNum;
    private String description;
    private String address;
    private String file;
    private double rating;      // 평균 평점
    private int reviewCount;
    
	public Gym() {
		super();
	}

	public Gym(int id, String name, String phoneNum, String description, String address, String file, double rating,
			int reviewCount) {
		super();
		this.id = id;
		this.name = name;
		this.phoneNum = phoneNum;
		this.description = description;
		this.address = address;
		this.file = file;
		this.rating = rating;
		this.reviewCount = reviewCount;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	@Override
	public String toString() {
		return "Gym [id=" + id + ", name=" + name + ", phoneNum=" + phoneNum + ", description=" + description
				+ ", address=" + address + ", file=" + file + ", rating=" + rating + ", reviewCount=" + reviewCount
				+ "]";
	}
}
