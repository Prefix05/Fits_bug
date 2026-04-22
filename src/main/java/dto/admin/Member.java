package dto.admin;

public class Member {
	//공통
	private String regDate;
	
	//헬스장
	private String gymName;
	private String gymTel;
	private int gymClientCount;
	private long gymCal;
	
	//트레이너
	private String trainerName;
	private String trainerTel;
	private int trainerClientCount;
	private long trainerCal;
	
	//회원
	private String clientName;
	private String clientTel;
	private String ptTrainer;
	private long payment;
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(String regDate, String gymName, String gymTel, int gymClientCount, long gymCal, String trainerName,
			String trainerTel, int trainerClientCount, long trainerCal, String clientName, String clientTel,
			String ptTrainer, long payment) {
		super();
		this.regDate = regDate;
		this.gymName = gymName;
		this.gymTel = gymTel;
		this.gymClientCount = gymClientCount;
		this.gymCal = gymCal;
		this.trainerName = trainerName;
		this.trainerTel = trainerTel;
		this.trainerClientCount = trainerClientCount;
		this.trainerCal = trainerCal;
		this.clientName = clientName;
		this.clientTel = clientTel;
		this.ptTrainer = ptTrainer;
		this.payment = payment;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getGymName() {
		return gymName;
	}

	public void setGymName(String gymName) {
		this.gymName = gymName;
	}

	public String getGymTel() {
		return gymTel;
	}

	public void setGymTel(String gymTel) {
		this.gymTel = gymTel;
	}

	public int getGymClientCount() {
		return gymClientCount;
	}

	public void setGymClientCount(int gymClientCount) {
		this.gymClientCount = gymClientCount;
	}

	public long getGymCal() {
		return gymCal;
	}

	public void setGymCal(long gymCal) {
		this.gymCal = gymCal;
	}

	public String getTrainerName() {
		return trainerName;
	}

	public void setTrainerName(String trainerName) {
		this.trainerName = trainerName;
	}

	public String getTrainerTel() {
		return trainerTel;
	}

	public void setTrainerTel(String trainerTel) {
		this.trainerTel = trainerTel;
	}

	public int getTrainerClientCount() {
		return trainerClientCount;
	}

	public void setTrainerClientCount(int trainerClientCount) {
		this.trainerClientCount = trainerClientCount;
	}

	public long getTrainerCal() {
		return trainerCal;
	}

	public void setTrainerCal(long trainerCal) {
		this.trainerCal = trainerCal;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getClientTel() {
		return clientTel;
	}

	public void setClientTel(String clientTel) {
		this.clientTel = clientTel;
	}

	public String getPtTrainer() {
		return ptTrainer;
	}

	public void setPtTrainer(String ptTrainer) {
		this.ptTrainer = ptTrainer;
	}

	public long getPayment() {
		return payment;
	}

	public void setPayment(long payment) {
		this.payment = payment;
	}

	@Override
	public String toString() {
		return "MemberDTO [regDate=" + regDate + ", gymName=" + gymName + ", gymTel=" + gymTel + ", gymClientCount="
				+ gymClientCount + ", gymCal=" + gymCal + ", trainerName=" + trainerName + ", trainerTel=" + trainerTel
				+ ", trainerClientCount=" + trainerClientCount + ", trainerCal=" + trainerCal + ", clientName="
				+ clientName + ", clientTel=" + clientTel + ", ptTrainer=" + ptTrainer + ", payment=" + payment + "]";
	}
}