package dto.gym;

public class Schedule {
	private int gsNum;
	private int gymNum;
	private String availableWeekdayStart;
	private String availableWeekdayEnd;
	private String availableWeekendStart;
	private String availableWeekendEnd;
	
	public Schedule() {
		super();
	}

	public Schedule(int gsNum, int gymNum, String availableWeekdayStart, String availableWeekdayEnd,
			String availableWeekendStart, String availableWeekendEnd) {
		super();
		this.gsNum = gsNum;
		this.gymNum = gymNum;
		this.availableWeekdayStart = availableWeekdayStart;
		this.availableWeekdayEnd = availableWeekdayEnd;
		this.availableWeekendStart = availableWeekendStart;
		this.availableWeekendEnd = availableWeekendEnd;
	}

	public int getGsNum() {
		return gsNum;
	}

	public void setGsNum(int gsNum) {
		this.gsNum = gsNum;
	}

	public int getGymNum() {
		return gymNum;
	}

	public void setGymNum(int gymNum) {
		this.gymNum = gymNum;
	}

	public String getAvailableWeekdayStart() {
		return availableWeekdayStart;
	}

	public void setAvailableWeekdayStart(String availableWeekdayStart) {
		this.availableWeekdayStart = availableWeekdayStart;
	}

	public String getAvailableWeekdayEnd() {
		return availableWeekdayEnd;
	}

	public void setAvailableWeekdayEnd(String availableWeekdayEnd) {
		this.availableWeekdayEnd = availableWeekdayEnd;
	}

	public String getAvailableWeekendStart() {
		return availableWeekendStart;
	}

	public void setAvailableWeekendStart(String availableWeekendStart) {
		this.availableWeekendStart = availableWeekendStart;
	}

	public String getAvailableWeekendEnd() {
		return availableWeekendEnd;
	}

	public void setAvailableWeekendEnd(String availableWeekendEnd) {
		this.availableWeekendEnd = availableWeekendEnd;
	}

	@Override
	public String toString() {
		return "Schedule [gsNum=" + gsNum + ", gymNum=" + gymNum + ", availableWeekdayStart=" + availableWeekdayStart
				+ ", availableWeekdayEnd=" + availableWeekdayEnd + ", availableWeekendStart=" + availableWeekendStart
				+ ", availableWeekendEnd=" + availableWeekendEnd + "]";
	}
	
	
	
	
}
