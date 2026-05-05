package dto.admin;

public class MemberDTO {
	//공통
	private String regDate;
	
	//헬스장
	private String gymName;
	private String gymTel;
	private Integer gymClientCount;
	private Double gymCal;
	
	//트레이너
	private String trainerName;
	private String trainerTel;
	private Integer trainerClientCount;
	private Double trainerCal;
	
	//회원
	private String clientName;
	private String clientTel;
	private String ptTrainer;
	private Double payment;
	
	private String profileImage;
	
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}






	public MemberDTO(String regDate, String gymName, String gymTel, Integer gymClientCount, Double gymCal,
			String trainerName, String trainerTel, Integer trainerClientCount, Double trainerCal, String clientName,
			String clientTel, String ptTrainer, Double payment, String profileImage) {
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
		this.profileImage = profileImage;
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

	public Integer getGymClientCount() {
		return gymClientCount;
	}

	public void setGymClientCount(Integer gymClientCount) {
		this.gymClientCount = gymClientCount;
	}

	public Double getGymCal() {
		return gymCal;
	}

	public void setGymCal(Double gymCal) {
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

	public Integer getTrainerClientCount() {
		return trainerClientCount;
	}

	public void setTrainerClientCount(Integer trainerClientCount) {
		this.trainerClientCount = trainerClientCount;
	}

	public Double getTrainerCal() {
		return trainerCal;
	}

	public void setTrainerCal(Double trainerCal) {
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

	public Double getPayment() {
		return payment;
	}

	public void setPayment(Double payment) {
		this.payment = payment;
	}

	
	public String getProfileImage() {
		return profileImage;
	}


	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}






	@Override
	public String toString() {
		return "MemberDTO [regDate=" + regDate + ", gymName=" + gymName + ", gymTel=" + gymTel + ", gymClientCount="
				+ gymClientCount + ", gymCal=" + gymCal + ", trainerName=" + trainerName + ", trainerTel=" + trainerTel
				+ ", trainerClientCount=" + trainerClientCount + ", trainerCal=" + trainerCal + ", clientName="
				+ clientName + ", clientTel=" + clientTel + ", ptTrainer=" + ptTrainer + ", payment=" + payment
				+ ", profileImage=" + profileImage + "]";
	}




}