package dto.gym;

public class GymNotice {
	private int id;
	private int gymId;
	private String title;
	private String createdAt;
	
	public GymNotice() {
		super();
	}

	public GymNotice(int id, int gymId, String title, String createdAt) {
		super();
		this.id = id;
		this.gymId = gymId;
		this.title = title;
		this.createdAt = createdAt;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getGymId() {
		return gymId;
	}

	public void setGymId(int gymId) {
		this.gymId = gymId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	@Override
	public String toString() {
		return "Notice [id=" + id + ", gymId=" + gymId + ", title=" + title + ", createdAt=" + createdAt + "]";
	}
	
	
}
