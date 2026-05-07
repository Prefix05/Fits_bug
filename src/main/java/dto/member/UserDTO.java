/*
 * package dto.member;
 * 
 * import java.time.LocalDateTime;
 * 
 * public class UserDTO {
 * 
 * private int id; private String email; private String password; private String
 * name; private String phone; // DB 컬럼: phone (이전 tel → phone 통일) private
 * boolean emailVerified; // DB 컬럼: email_verified private String nickname;
 * private String profileImage; // DB 컬럼: profileImg private String role; //
 * ENUM → String으로 MyBatis 처리 간편화 private LocalDateTime createdAt; private
 * boolean deleted; // DB 컬럼: is_deleted private String provider; //
 * ENUM('kakao','naver') private String providerId; // DB 컬럼: provider_id
 * private Integer otherId;
 * 
 * public UserDTO() {}
 * 
 * 
 * public UserDTO(int id, String email, String password, String name, String
 * phone, boolean emailVerified, String nickname, String profileImage, String
 * role, LocalDateTime createdAt, boolean deleted, String provider, String
 * providerId, Integer otherId) { super(); this.id = id; this.email = email;
 * this.password = password; this.name = name; this.phone = phone;
 * this.emailVerified = emailVerified; this.nickname = nickname;
 * this.profileImage = profileImage; this.role = role; this.createdAt =
 * createdAt; this.deleted = deleted; this.provider = provider; this.providerId
 * = providerId; this.otherId = otherId; }
 * 
 * 
 * public int getId() { return id; } public void setId(int id) { this.id = id; }
 * 
 * public String getEmail() { return email; } public void setEmail(String email)
 * { this.email = email; }
 * 
 * public String getPassword() { return password; } public void
 * setPassword(String password) { this.password = password; }
 * 
 * public String getName() { return name; } public void setName(String name) {
 * this.name = name; }
 * 
 * public String getPhone() { return phone; } public void setPhone(String phone)
 * { this.phone = phone; }
 * 
 * public boolean isEmailVerified() { return emailVerified; } public void
 * setEmailVerified(boolean emailVerified) { this.emailVerified = emailVerified;
 * }
 * 
 * public String getNickname() { return nickname; } public void
 * setNickname(String nickname) { this.nickname = nickname; }
 * 
 * 
 * public String getRole() { return role; } public void setRole(String role) {
 * this.role = role; }
 * 
 * public LocalDateTime getCreatedAt() { return createdAt; } public void
 * setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
 * 
 * public boolean isDeleted() { return deleted; } public void setDeleted(boolean
 * deleted) { this.deleted = deleted; }
 * 
 * public String getProvider() { return provider; } public void
 * setProvider(String provider) { this.provider = provider; }
 * 
 * public String getProviderId() { return providerId; } public void
 * setProviderId(String providerId) { this.providerId = providerId; }
 * 
 * 
 * 
 * 
 * public String getProfileImage() { return profileImage; }
 * 
 * public void setProfileImage(String profileImage) { this.profileImage =
 * profileImage; }
 * 
 * public Integer getOtherId() { return otherId; }
 * 
 * public void setOtherId(Integer otherId) { this.otherId = otherId; } }
 */

package dto.member;

import java.time.LocalDateTime;

public class UserDTO {
    private int id;
    private String email;
    private String password;
    private String name;
    private String phone;
    private int age;               
    private String gender;         
    private boolean email_verified; 
    private String nickname;
    private String profile_image;   
    private String role;
    private LocalDateTime created_at; 
    private boolean is_deleted;     
    private String provider;
    private String provider_id;     
    private Integer otherId;        // 로직용 (MEMBER ID 등 보관용)

    public UserDTO() {}


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

    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public boolean isEmail_verified() { return email_verified; }
    public void setEmail_verified(boolean email_verified) { this.email_verified = email_verified; }

    public String getNickname() { return nickname; }
    public void setNickname(String nickname) { this.nickname = nickname; }

    public String getProfile_image() { return profile_image; }
    public void setProfile_image(String profile_image) { this.profile_image = profile_image; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public LocalDateTime getCreated_at() { return created_at; }
    public void setCreated_at(LocalDateTime created_at) { this.created_at = created_at; }

    public boolean isIs_deleted() { return is_deleted; }
    public void setIs_deleted(boolean is_deleted) { this.is_deleted = is_deleted; }

    public String getProvider() { return provider; }
    public void setProvider(String provider) { this.provider = provider; }

    public String getProvider_id() { return provider_id; }
    public void setProvider_id(String provider_id) { this.provider_id = provider_id; }

    public Integer getOtherId() { return otherId; }
    public void setOtherId(Integer otherId) { this.otherId = otherId; }
}