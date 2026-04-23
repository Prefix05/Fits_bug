package dto;

public class Review {
	private int reviewNum;
	private int gymId;
	private int clientId;
	private String clientName;
	private int star;
	private double rating;
	private String comment;
	private String createdAt;
	private String file;
	
	public Review() {
		super();
	}

	public Review(int reviewNum, int gymId, int clientId, String clientName, int star, double rating, String comment, String createdAt,
			String file) {
		super();
		this.reviewNum = reviewNum;
		this.gymId = gymId;
		this.clientId = clientId;
		this.clientName = clientName;
		this.star = star;
		this.rating = rating;
		this.comment = comment;
		this.createdAt = createdAt;
		this.file = file;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public int getGymId() {
		return gymId;
	}

	public void setGymId(int gymId) {
		this.gymId = gymId;
	}

	public int getClientId() {
		return clientId;
	}

	public void setClientId(int clientId) {
		this.clientId = clientId;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
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

	@Override
	public String toString() {
		return "Review [reviewNum=" + reviewNum + ", gymId=" + gymId + ", clientId=" + clientId + ", clientName="
				+ clientName + ", star=" + star + ", rating=" + rating + ", comment=" + comment + ", createdAt="
				+ createdAt + ", file=" + file + "]";
	}


	
	
}
