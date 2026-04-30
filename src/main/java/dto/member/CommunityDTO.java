package dto.member;

import java.sql.Timestamp;

public class CommunityDTO {
    private int id;
    private String userEmail;
    private String category;
    private String title;
    private String content;
    private String hashtags;
    private String image;

    private Timestamp createdAt;

    private int likeCount;
    private int goodCount;
    private int muscleCount;
    
	public CommunityDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CommunityDTO(int id, String userEmail, String category, String title, String content, String hashtags,
			String image, Timestamp createdAt, int likeCount, int goodCount, int muscleCount) {
		super();
		this.id = id;
		this.userEmail = userEmail;
		this.category = category;
		this.title = title;
		this.content = content;
		this.hashtags = hashtags;
		this.image = image;
		this.createdAt = createdAt;
		this.likeCount = likeCount;
		this.goodCount = goodCount;
		this.muscleCount = muscleCount;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getHashtags() {
		return hashtags;
	}

	public void setHashtags(String hashtags) {
		this.hashtags = hashtags;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
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
    
}