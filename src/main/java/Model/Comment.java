package Model;

public class Comment {

    private String name;
    private String username;
    private int id, article_id, user_id;
    private String comment;
    private String date;

    public Comment() {
    }

    public Comment(String name, String username, int id, int article_id, int user_id, String comment, String date) {
        this.name = name;
        this.username = username;
        this.id = id;
        this.article_id = article_id;
        this.user_id = user_id;
        this.comment = comment;
        this.date = date;
    }

    public String getName() {
        return name;
    }

    public String getUsername() {
        return username;
    }

    public int getId() {
        return id;
    }

    public int getArticle_id() {
        return article_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public String getComment() {
        return comment;
    }

    public String getDate() {
        return date;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setArticle_id(int article_id) {
        this.article_id = article_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
