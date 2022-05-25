package models;

public class House {
    private Integer id;
    private String name;
    private String address;
    private Integer maxPeople;
    private Integer typeId;
    private Integer standardId;
    private String description;
    private String status;
    private String image;
    private Float price;

    public House() {
    }

    public House(Integer id, String name, String address, Integer maxPeople, Integer typeId, Integer standardId, String description, String status,String image, Float price) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.maxPeople = maxPeople;
        this.typeId = typeId;
        this.standardId = standardId;
        this.description = description;
        this.status = status;
        this.image = image;
        this.price = price;
    }

    public House(String name, String address, int maxPeople, int typeId, int standardId, String description, String status, String image, Float price) {
        this.name = name;
        this.address = address;
        this.maxPeople = maxPeople;
        this.typeId = typeId;
        this.standardId = standardId;
        this.description = description;
        this.status = status;
        this.image = image;
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getMaxPeople() {
        return maxPeople;
    }

    public void setMaxPeople(Integer maxPeople) {
        this.maxPeople = maxPeople;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public Integer getStandardId() {
        return standardId;
    }

    public void setStandardId(Integer standardId) {
        this.standardId = standardId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }
}
