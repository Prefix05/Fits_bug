package dto.member;

public class PostDTO {

    private int id;
    private String userId;
    private String title;
    private String body;
    private String image;
    private String hashtags;
    private String createdAt;
    private int likeCount;
    private int goodCount;
    private int muscleCount;
    
	public PostDTO(int id, String userId, String title, String body, String image, String hashtags, String createdAt,
			int likeCount, int goodCount, int muscleCount) {
		super();
		this.id = id;
		this.userId = userId;
		this.title = title;
		this.body = body;
		this.image = image;
		this.hashtags = hashtags;
		this.createdAt = createdAt;
		this.likeCount = likeCount;
		this.goodCount = goodCount;
		this.muscleCount = muscleCount;
	}

	public PostDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getHashtags() {
		return hashtags;
	}

	public void setHashtags(String hashtags) {
		this.hashtags = hashtags;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getGoodCount() {
		return goodCount;
	}

	public void setGoodCount(int goodCount) {
		this.goodCount = goodCount;
	}

	public int getMuscleCount() {
		return muscleCount;
	}

	public void setMuscleCount(int muscleCount) {
		this.muscleCount = muscleCount;
	}

	@Override
	public String toString() {
		return "PostDTO [id=" + id + ", userId=" + userId + ", title=" + title + ", body=" + body + ", image=" + image
				+ ", hashtags=" + hashtags + ", createdAt=" + createdAt + ", likeCount=" + likeCount + ", goodCount="
				+ goodCount + ", muscleCount=" + muscleCount + "]";
	}
	
	
}