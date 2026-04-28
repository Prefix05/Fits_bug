package dto.gym;

public class GymPeakTime {
	private int id;
	private int gymId;
	private String dayOfWeek;
	private String startTime;
	private String endTime;
	public GymPeakTime() {
		super();
	}
	public GymPeakTime(int id, int gymId, String dayOfWeek, String startTime, String endTime) {
		super();
		this.id = id;
		this.gymId = gymId;
		this.dayOfWeek = dayOfWeek;
		this.startTime = startTime;
		this.endTime = endTime;
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
	public String getDayOfWeek() {
		return dayOfWeek;
	}
	public void setDayOfWeek(String dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	@Override
	public String toString() {
		return "GymPeakTime [id=" + id + ", gymId=" + gymId + ", dayOfWeek=" + dayOfWeek + ", startTime=" + startTime
				+ ", endTime=" + endTime + "]";
	}
	
}
