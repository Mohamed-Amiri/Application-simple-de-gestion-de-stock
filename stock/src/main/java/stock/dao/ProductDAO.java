package stock.dao;

import stock.Product;
import stock.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    public void addProduct(Product product) throws SQLException {
        String sql = "INSERT INTO produits (nom, description, quantite_stock, prix_unitaire, categorie_nom) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, product.getName());
            stmt.setString(2, product.getDescription());
            stmt.setInt(3, product.getStockQuantity());
            stmt.setDouble(4, product.getUnitPrice());
            stmt.setString(5, product.getCategoryName());
            stmt.executeUpdate();
        }
    }

    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM produits";
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                products.add(new Product(
                    rs.getString("nom"),
                    rs.getString("description"),
                    rs.getInt("quantite_stock"),
                    rs.getDouble("prix_unitaire"),
                    rs.getString("categorie_nom")
                ));
            }
        }
        return products;
    }

    public void deleteProduct(String name) throws SQLException {
        String sql = "DELETE FROM produits WHERE nom = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, name);
            stmt.executeUpdate();
        }
    }
}
