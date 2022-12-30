package Model;


public class Categories {
    private int id;

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getParen_ID() {
        return paren_ID;
    }
    public void setParen_ID(int paren_ID) {
        this.paren_ID = paren_ID;
    }
    private String name;
    private int paren_ID;
    public Categories() {

    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public Categories(int id, String name, int paren_ID) {
        super();
        this.id = id;
        this.name = name;
        this.paren_ID = paren_ID;
    }
}

