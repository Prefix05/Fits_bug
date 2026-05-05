package dto.trainer;

import java.time.LocalDateTime;

public class UserDTO {
    private int id;
    private String email;
    private String password;
    private String name;
    private String tel;
    private String nickname;
    private String profileImage;
    private UserRole role;
    private LocalDateTime createdAt;
    private boolean deleted;
    private String provider;
    private String providerId;

    public enum UserRole {
        MEMBER,
        TRAINER,
        GYM,
        ADMIN
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }



    public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public UserRole getRole() {
        return role;
    }

    public void setRole(UserRole role) {
        this.role = role;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    public String getProvider() {
        return provider;
    }

    public void setProvider(String provider) {
        this.provider = provider;
    }

    public String getProviderId() {
        return providerId;
    }

    public void setProviderId(String providerId) {
        this.providerId = providerId;
    }

	@Override
	public String toString() {
		return "UserDTO [id=" + id + ", email=" + email + ", password=" + password + ", name=" + name + ", tel=" + tel
				+ ", nickname=" + nickname + ", profileImage=" + profileImage + ", role=" + role + ", createdAt="
				+ createdAt + ", deleted=" + deleted + ", provider=" + provider + ", providerId=" + providerId + "]";
	}
    
    
}
