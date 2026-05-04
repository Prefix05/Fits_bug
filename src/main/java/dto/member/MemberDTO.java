package dto.member;

public class MemberDTO {

    private String email;
    private String password;
    private String nickname;
    private String phone;
    private String profileImage;
    private boolean emailVerified;
    private String socialType;
    
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String email, String password, String nickname, String phone, String profileImage,
			boolean emailVerified, String socialType) {
		super();
		this.email = email;
		this.password = password;
		this.nickname = nickname;
		this.phone = phone;
		this.profileImage = profileImage;
		this.emailVerified = emailVerified;
		this.socialType = socialType;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public boolean isEmailVerified() {
		return emailVerified;
	}

	public void setEmailVerified(boolean emailVerified) {
		this.emailVerified = emailVerified;
	}

	public String getSocialType() {
		return socialType;
	}

	public void setSocialType(String socialType) {
		this.socialType = socialType;
	}

	@Override
	public String toString() {
		return "MemberDTO [email=" + email + ", password=" + password + ", nickname=" + nickname + ", phone=" + phone
				+ ", profileImage=" + profileImage + ", emailVerified=" + emailVerified + ", socialType=" + socialType
				+ "]";
	}
}