package dto;

public class ProductDTO {
    private int id;
    private String productName;
    private float price;
    String image;
    private String manufacturer;
    private String description;

    public ProductDTO() {
    }

    public ProductDTO(int id, String productName, float price, String image, String description,String manufacturer) {
        this.id = id;
        this.productName = productName;
        this.price = price;
        this.image = image;
        this.manufacturer = manufacturer;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }
}
