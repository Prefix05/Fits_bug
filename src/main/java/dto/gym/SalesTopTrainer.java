package dto.gym;

public class SalesTopTrainer {
	private int trainerId;
    private String trainerName;
    private String profileImg;
    private int totalSales;
    private int sessionCount;
	public SalesTopTrainer() {
		super();
	}
	public SalesTopTrainer(int trainerId, String trainerName, String profileImg, int totalSales, int sessionCount) {
		super();
		this.trainerId = trainerId;
		this.trainerName = trainerName;
		this.profileImg = profileImg;
		this.totalSales = totalSales;
		this.sessionCount = sessionCount;
	}
	public int getTrainerId() {
		return trainerId;
	}
	public void setTrainerId(int trainerId) {
		this.trainerId = trainerId;
	}
	public String getTrainerName() {
		return trainerName;
	}
	public void setTrainerName(String trainerName) {
		this.trainerName = trainerName;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public int getTotalSales() {
		return totalSales;
	}
	public void setTotalSales(int totalSales) {
		this.totalSales = totalSales;
	}
	public int getSessionCount() {
		return sessionCount;
	}
	public void setSessionCount(int sessionCount) {
		this.sessionCount = sessionCount;
	}
    
}
