package dto;

public class MemberDTO {
    private String userId;
    private String password;
    private String userName; // 로그인 성공 시 세션에 저장할 이름 등
    
    
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public MemberDTO(String userId, String password, String userName) {
		super();
		this.userId = userId;
		this.password = password;
		this.userName = userName;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}

}