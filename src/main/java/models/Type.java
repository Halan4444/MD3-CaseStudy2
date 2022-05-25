package models;

public class Type {
    private Integer id;
    private String Type;

    public Type(Integer id, String Type) {
        this.id = id;
        this.Type = Type;
    }

    public Type() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return Type;
    }

    public void setType(String Type) {
        this.Type = Type;
    }
}
