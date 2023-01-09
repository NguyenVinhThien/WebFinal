package Model;

public class Editor_Manage_Categories {
    private int id;
    private String nameEditor;
    private String nameCategory;
    public int getId() {
        return id;
    }

    public String getNameEditor() {
        return nameEditor;
    }

    public void setNameEditor(String nameEditor) {
        this.nameEditor = nameEditor;
    }

    public String getNameCategory() {
        return nameCategory;
    }

    public void setNameCategory(String nameCategory) {
        this.nameCategory = nameCategory;
    }

    public Editor_Manage_Categories()
    {

    }
    public Editor_Manage_Categories(int id, int editor_id, int category_id,String nameEditor, String nameCategory) {
        super();
        this.id = id;
        this.editor_id = editor_id;
        this.category_id = category_id;
        this.nameEditor = nameEditor;
        this.nameCategory = nameCategory;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEditor_id() {
        return editor_id;
    }

    public void setEditor_id(int editor_id) {
        this.editor_id = editor_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    private int editor_id;
    private int category_id;
}
