package dto.member;

public class GymDTO {
    private int gymId;
    private String name;
    private String address;
    private String image;
    private String specialty;

    private double rating;
    private double distance;
    private double score;

    private int price;

    private double latitude;
    private double longitude;
    
	public GymDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GymDTO(int gymId, String name, String address, String image, String specialty, double rating,
			double distance, double score, int price, double latitude, double longitude) {
		super();
		this.gymId = gymId;
		this.name = name;
		this.address = address;
		this.image = image;
		this.specialty = specialty;
		this.rating = rating;
		this.distance = distance;
		this.score = score;
		this.price = price;
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public int getGymId() {
		return gymId;
	}

	public void setGymId(int gymId) {
		this.gymId = gymId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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

	public double getDistance() {
		return distance;
	}

	public void setDistance(double distance) {
		this.distance = distance;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
    
}