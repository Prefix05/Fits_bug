package dto;

public class SupportDTO {

    private int id;
    private String email;
    private String type;
    private String title;
    private String content;
    private String filePath;
    private String status;
    private String createdAt;

    public SupportDTO() {}

	public SupportDTO(int id, String email, String type, String title, String content, String filePath, String status,
			String createdAt) {
		super();
		this.id = id;
		this.email = email;
		this.type = type;
		this.title = title;
		this.content = content;
		this.filePath = filePath;
		this.status = status;
		this.createdAt = createdAt;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

    
}