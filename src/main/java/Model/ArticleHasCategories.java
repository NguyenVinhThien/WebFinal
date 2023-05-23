package Model;

public class ArticleHasCategories {
    private int id_article;
    private String title;
    private String publish_date;
    private int views;
    private String abstract_article;
    private String content;
    private int categories_id;
    private int premium;
    private int writer_id;
    private int status;
    private String cat_name;
    private int parent_id;

    private String headline_image;

    public ArticleHasCategories() {
    }

    public ArticleHasCategories(int id_article, String title, String publish_date, int views, String abstract_article, String content, int categories_id, int premium, int writer_id, int status, String cat_name, int parent_id, String headline_image) {
        this.id_article = id_article;
        this.title = title;
        this.publish_date = publish_date;
        this.views = views;
        this.abstract_article = abstract_article;
        this.content = content;
        this.categories_id = categories_id;
        this.premium = premium;
        this.writer_id = writer_id;
        this.status = status;
        this.cat_name = cat_name;
        this.parent_id = parent_id;
        this.headline_image = headline_image;
    }

    public String getHeadline_image() {
        return headline_image;
    }

    public void setHeadline_image(String headline_image) {
        this.headline_image = headline_image;
    }

    //    public ArticleHasCategories(int id_article, String title, String publish_date, int views, String abstract_article, String content, int categories_id, int premium, int writer_id, int status, String cat_name, int parent_id) {
//        this.id_article = id_article;
//        this.title = title;
//        this.publish_date = publish_date;
//        this.views = views;
//        this.abstract_article = abstract_article;
//        this.content = content;
//        this.categories_id = categories_id;
//        this.premium = premium;
//        this.writer_id = writer_id;
//        this.status = status;
//        this.cat_name = cat_name;
//        this.parent_id = parent_id;
//    }

    public int getId_article() {
        return id_article;
    }

    public String getTitle() {
        return title;
    }

    public String getPublish_date() {
        return publish_date;
    }

    public int getViews() {
        return views;
    }

    public String getAbstract_article() {
        return abstract_article;
    }

    public String getContent() {
        return content;
    }

    public int getCategories_id() {
        return categories_id;
    }

    public int getPremium() {
        return premium;
    }

    public int getWriter_id() {
        return writer_id;
    }

    public int getStatus() {
        return status;
    }

    public String getCat_name() {
        return cat_name;
    }

    public int getParent_id() {
        return parent_id;
    }

    public void setId_article(int id_article) {
        this.id_article = id_article;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setPublish_date(String publish_date) {
        this.publish_date = publish_date;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public void setAbstract_article(String abstract_article) {
        this.abstract_article = abstract_article;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setCategories_id(int categories_id) {
        this.categories_id = categories_id;
    }

    public void setPremium(int premium) {
        this.premium = premium;
    }

    public void setWriter_id(int writer_id) {
        this.writer_id = writer_id;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setCat_name(String cat_name) {
        this.cat_name = cat_name;
    }

    public void setParent_id(int parent_id) {
        this.parent_id = parent_id;
    }
}
