package dto.member;

import java.sql.Timestamp;

public class CommentDTO {
	private int id;
    private int postId;
    private String nickname;
    private String content;
    private Timestamp createdAt;
    
	public CommentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CommentDTO(int id, int postId, String nickname, String content, Timestamp createdAt) {
		super();
		this.id = id;
		this.postId = postId;
		this.nickname = nickname;
		this.content = content;
		this.createdAt = createdAt;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
    
}