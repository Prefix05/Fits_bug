package dto.member;

public class ExerciseGuideDTO {
    private int exerciseId;
    private String name;
    private String description;
    private String muscle;
    private String difficulty;

    private String thumbnail;   // 카드 썸네일
    private String gifUrl;      // 상세 GIF
    private String youtubeUrl;  // 영상
    
	public ExerciseGuideDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ExerciseGuideDTO(int exerciseId, String name, String description, String muscle, String difficulty,
			String thumbnail, String gifUrl, String youtubeUrl) {
		super();
		this.exerciseId = exerciseId;
		this.name = name;
		this.description = description;
		this.muscle = muscle;
		this.difficulty = difficulty;
		this.thumbnail = thumbnail;
		this.gifUrl = gifUrl;
		this.youtubeUrl = youtubeUrl;
	}

	public int getExerciseId() {
		return exerciseId;
	}

	public void setExerciseId(int exerciseId) {
		this.exerciseId = exerciseId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getMuscle() {
		return muscle;
	}

	public void setMuscle(String muscle) {
		this.muscle = muscle;
	}

	public String getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getGifUrl() {
		return gifUrl;
	}

	public void setGifUrl(String gifUrl) {
		this.gifUrl = gifUrl;
	}

	public String getYoutubeUrl() {
		return youtubeUrl;
	}

	public void setYoutubeUrl(String youtubeUrl) {
		this.youtubeUrl = youtubeUrl;
	}
    
}