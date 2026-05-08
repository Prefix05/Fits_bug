package dto.member;

public class PostDTO {

    private int id;

    // USER 테이블 FK
    private Integer userId;

    // free / exerciseComplete
    private String postType;

    private String title;

    private String body;

    private String image;

    private String hashtags;

    // recommended 컬럼
    private long recommended;

    // created_at
    private String createdAt;

    // hidden / normal
    private String status;

    
    public PostDTO() {
        super();
    }

    
    public PostDTO(int id,
                   Integer userId,
                   String postType,
                   String title,
                   String body,
                   String image,
                   String hashtags,
                   long recommended,
                   String createdAt,
                   String status) {

        super();

        this.id = id;
        this.userId = userId;
        this.postType = postType;
        this.title = title;
        this.body = body;
        this.image = image;
        this.hashtags = hashtags;
        this.recommended = recommended;
        this.createdAt = createdAt;
        this.status = status;
    }


    public int getId() {
        return id;
    }


    public void setId(int id) {
        this.id = id;
    }


    public Integer getUserId() {
        return userId;
    }


    public void setUserId(Integer userId) {
        this.userId = userId;
    }


    public String getPostType() {
        return postType;
    }


    public void setPostType(String postType) {
        this.postType = postType;
    }


    public String getTitle() {
        return title;
    }


    public void setTitle(String title) {
        this.title = title;
    }


    public String getBody() {
        return body;
    }


    public void setBody(String body) {
        this.body = body;
    }


    public String getImage() {
        return image;
    }


    public void setImage(String image) {
        this.image = image;
    }


    public String getHashtags() {
        return hashtags;
    }


    public void setHashtags(String hashtags) {
        this.hashtags = hashtags;
    }


    public long getRecommended() {
        return recommended;
    }


    public void setRecommended(long recommended) {
        this.recommended = recommended;
    }


    public String getCreatedAt() {
        return createdAt;
    }


    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }


    public String getStatus() {
        return status;
    }


    public void setStatus(String status) {
        this.status = status;
    }


    @Override
    public String toString() {

        return "PostDTO [id=" + id
                + ", userId=" + userId
                + ", postType=" + postType
                + ", title=" + title
                + ", body=" + body
                + ", image=" + image
                + ", hashtags=" + hashtags
                + ", recommended=" + recommended
                + ", createdAt=" + createdAt
                + ", status=" + status
                + "]";
    }
}