package dto.member;

public class FeedbackDTO {
	private String trainerName;
	private String summary;
    private String content;
    private String date;
    
	public FeedbackDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FeedbackDTO(String trainerName, String summary, String content, String date) {
		super();
		this.trainerName = trainerName;
		this.summary = summary;
		this.content = content;
		this.date = date;
	}

	public String getTrainerName() {
		return trainerName;
	}

	public void setTrainerName(String trainerName) {
		this.trainerName = trainerName;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
    
    
}