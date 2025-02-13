package main;
import stock.Category;
import stock.Product;
import stock.dao.CategoryDAO; // Updated import
import stock.dao.ProductDAO;  // Updated import
import java.sql.SQLException;

public class main {
    public static void main(String[] args) {
        try {
            CategoryDAO categoryDAO = new CategoryDAO();
            ProductDAO productDAO = new ProductDAO();

            // Ajout d'une catégorie
            Category category = new Category("Electronique");
            categoryDAO.addCategory(category);

            // Affichage des catégories
            System.out.println("Catégories disponibles : " + categoryDAO.getAllCategories());

            // Ajout d'un produit
            Product product = new Product("Ordinateur", "PC Portable HP", 10, 800.00, "Electronique");
            productDAO.addProduct(product);

            // Affichage des produits
            System.out.println("Produits disponibles : " + productDAO.getAllProducts());

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

