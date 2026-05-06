package dto.member;

import java.time.LocalDateTime;

/**
 * ↔ USER 테이블
 * id, email, password, name, phone, email_verified,
 * nickname, profileImg, role(ENUM), created_at, is_deleted, provider, provider_id
 *
 * 변경: tel → phone (DB 컬럼명 일치)
 *       UserRole enum 제거 → String (MyBatis 매핑 단순화)
 *       emailVerified 필드 추가
 */
public class UserDTO {

    private int           id;
    private String        email;
    private String        password;
    private String        name;
    private String        phone;          // DB: phone (이전 tel → 수정)
    private boolean       emailVerified;  // DB: email_verified
    private String        nickname;
    private String        profileImg;     // DB: profileImg
    private String        role;           // ENUM('MEMBER','TRAINER','GYM','ADMIN') → String
    private LocalDateTime createdAt;      // DB: created_at
    private boolean       deleted;        // DB: is_deleted
    private String        provider;       // ENUM('kakao','naver')
    private String        providerId;     // DB: provider_id

    public UserDTO() {}

    public UserDTO(String email, String password, String name, String phone,
                   boolean emailVerified, String nickname, String role) {
        this.email         = email;
        this.password      = password;
        this.name          = name;
        this.phone         = phone;
        this.emailVerified = emailVerified;
        this.nickname      = nickname;
        this.role          = role;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public boolean isEmailVerified() { return emailVerified; }
    public void setEmailVerified(boolean emailVerified) { this.emailVerified = emailVerified; }

    public String getNickname() { return nickname; }
    public void setNickname(String nickname) { this.nickname = nickname; }

    public String getProfileImg() { return profileImg; }
    public void setProfileImg(String profileImg) { this.profileImg = profileImg; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

    public boolean isDeleted() { return deleted; }
    public void setDeleted(boolean deleted) { this.deleted = deleted; }

    public String getProvider() { return provider; }
    public void setProvider(String provider) { this.provider = provider; }

    public String getProviderId() { return providerId; }
    public void setProviderId(String providerId) { this.providerId = providerId; }

    @Override
    public String toString() {
        return "UserDTO{id=" + id + ", email='" + email + "', role='" + role + "'}";
    }
}
