package models;

public class Standard {
    private Integer id;
    private String standard;

    public Standard(Integer id, String standard) {
        this.id = id;
        this.standard = standard;
    }
    public Standard(){

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getstandard() {
        return standard;
    }

    public void setstandard(String standard) {
        this.standard = standard;
    }
}
