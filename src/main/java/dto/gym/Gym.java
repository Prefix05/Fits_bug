package dto.gym;

public class Gym {
    private int id;
    private String name;
    private String phoneNum;
    private String description;
    private String address;
    private String file;
    private double rating;      // 평균 평점
    private int reviewCount;
    private String backgroundImg;
    private String brFile;
    private String addressDetail;
    private String postcode;
    private Double latitude;
    private Double longitude;
    private String facility;
    private int userId;
    private String emailId;
    private String userName;
    private String tel;
    private String profileImg;
    
	public Gym() {
		super();
	}
	public Gym(int id, String name, String phoneNum, String description, String address, String file, double rating,
			int reviewCount, String backgroundImg, String brFile, String addressDetail, String postcode,
			Double latitude, Double longitude, String facility, int userId, String emailId, String userName,
			String tel, String profileImg) {
		super();
		this.id = id;
		this.name = name;
		this.phoneNum = phoneNum;
		this.description = description;
		this.address = address;
		this.file = file;
		this.rating = rating;
		this.reviewCount = reviewCount;
		this.backgroundImg = backgroundImg;
		this.brFile = brFile;
		this.addressDetail = addressDetail;
		this.postcode = postcode;
		this.latitude = latitude;
		this.longitude = longitude;
		this.facility = facility;
		this.userId = userId;
		this.emailId = emailId;
		this.userName = userName;
		this.tel = tel;
		this.profileImg = profileImg;
	}
	

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
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

	
	public String getBackgroundImg() {
		return backgroundImg;
	}



	public void setBackgroundImg(String backgroundImg) {
		this.backgroundImg = backgroundImg;
	}



	public String getBrFile() {
		return brFile;
	}



	public void setBrFile(String brFile) {
		this.brFile = brFile;
	}



	public String getAddressDetail() {
		return addressDetail;
	}



	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}



	public String getPostcode() {
		return postcode;
	}



	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}



	public Double getLatitude() {
		return latitude;
	}



	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}



	public Double getLongitude() {
		return longitude;
	}



	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}



	public String getFacility() {
		return facility;
	}



	public void setFacility(String facility) {
		this.facility = facility;
	}
	
	public String getProfileImg() {
		return profileImg;
	}
	
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
}
