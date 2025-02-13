package stock;

public class Product {
    private String name;
    private String description;
    private int stockQuantity;
    private double unitPrice;
    private String categoryName;

    public Product() {}

    public Product(String name, String description, int stockQuantity, double unitPrice, String categoryName) {
        this.name = name;
        this.description = description;
        this.stockQuantity = stockQuantity;
        this.unitPrice = unitPrice;
        this.categoryName = categoryName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    @Override
    public String toString() {
        return "Product{name='" + name + "', description='" + description + 
               "', stockQuantity=" + stockQuantity + ", unitPrice=" + unitPrice +
               ", categoryName='" + categoryName + "'}";
    }
}
