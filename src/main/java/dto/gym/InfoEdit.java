package dto.gym;

public class InfoEdit {
	private int userId;
	private String emailId;
	private String userName;
	private String tel;
	private String profileImg;
	public InfoEdit() {
		super();
	}
	public InfoEdit(int userId, String emailId, String userName, String tel, String profileImg) {
		super();
		this.userId = userId;
		this.emailId = emailId;
		this.userName = userName;
		this.tel = tel;
		this.profileImg = profileImg;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	@Override
	public String toString() {
		return "InfoEdit [userId=" + userId + ", emailId=" + emailId + ", userName=" + userName + ", tel=" + tel
				+ ", profileImg=" + profileImg + "]";
	}
	
}
