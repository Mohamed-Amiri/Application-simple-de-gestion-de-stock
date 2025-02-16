<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Stock Master</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4F46E5;
            --secondary-color: #7C3AED;
            --background-color: #F9FAFB;
            --card-background: #FFFFFF;
        }

        body {
            background-color: var(--background-color);
            font-family: system-ui, -apple-system, sans-serif;
        }

        .navbar-brand {
            font-weight: 700;
            color: var(--primary-color);
        }

        .nav-shadow {
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }

        .form-control, .form-select {
            border-radius: 0.5rem;
            padding: 0.75rem 1rem;
            border: 1px solid #E5E7EB;
            transition: all 0.2s ease;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(79, 70, 229, 0.1);
        }

        .form-label {
            font-weight: 500;
            color: #374151;
        }

        .btn-primary {
            background-color: var(--primary-color);
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 0.5rem;
            font-weight: 500;
            transition: all 0.2s ease;
        }

        .btn-primary:hover {
            background-color: var(--secondary-color);
            transform: translateY(-1px);
        }

        .card {
            border: none;
            border-radius: 1rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
        }

        .card-header {
            background-color: var(--card-background);
            border-bottom: 1px solid #E5E7EB;
            padding: 1.5rem;
        }

        .list-group-item {
            padding: 1rem 1.5rem;
            border-left: none;
            border-right: none;
        }

        .product-card {
            transition: all 0.2s ease;
        }

        .product-card:hover {
            background-color: #F9FAFB;
        }

        .category-badge {
            padding: 0.35rem 0.75rem;
            border-radius: 9999px;
            font-size: 0.875rem;
            font-weight: 500;
        }

        .floating-form {
            animation: slideIn 0.3s ease;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .toast {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1050;
        }
    </style>
</head>
<body>
    <!-- Toast Notification -->
    <div class="toast align-items-center text-white bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
            <div class="toast-body">
                Opération réussie!
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>

    <nav class="navbar navbar-expand-lg navbar-light bg-white nav-shadow mb-4">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center" href="#">
                <i class="fas fa-box-open me-2"></i>
                Stock Master
            </a>
        </div>
    </nav>

    <div class="container">
        <div class="row">
            <!-- Add Product Form -->
            <div class="col-lg-4 mb-4">
                <div class="card floating-form">
                    <div class="card-header border-0">
                        <h5 class="mb-0">Ajouter un produit</h5>
                    </div>
                    <div class="card-body">
                        <form id="taskForm" class="needs-validation" novalidate>
                            <div class="mb-3">
                                <label for="title" class="form-label">Nom</label>
                                <input type="text" class="form-control" id="title" placeholder="Nom du produit" required>
                                <div class="invalid-feedback">Veuillez fournir un nom.</div>
                            </div>
                            <div class="mb-3">
                                <label for="description" class="form-label">Description</label>
                                <textarea class="form-control" id="description" rows="3" placeholder="Description du produit" required></textarea>
                                <div class="invalid-feedback">Veuillez fournir une description.</div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-6">
                                    <label for="quantity" class="form-label">Quantité</label>
                                    <input type="number" id="quantity" class="form-control" value="50" min="0" required>
                                    <div class="invalid-feedback">Quantité invalide.</div>
                                </div>
                                <div class="col-6">
                                    <label for="price" class="form-label">Prix (€)</label>
                                    <input type="number" id="price" class="form-control" value="30" min="0" step="0.01" required>
                                    <div class="invalid-feedback">Prix invalide.</div>
                                </div>
                            </div>
                            <div class="mb-4">
                                <label for="category" class="form-label">Catégorie</label>
                                <select class="form-select" id="category" required>
                                    <option value="electronique">Électronique</option>
                                    <option value="vetements">Vêtements</option>
                                    <option value="alimentation">Alimentation</option>
                                </select>
                                <div class="invalid-feedback">Veuillez sélectionner une catégorie.</div>
                            </div>
                            <div class="d-grid">
                                <button type="button" id="buttonNew" class="btn btn-primary">
                                    <i class="fas fa-plus me-2"></i>Ajouter le produit
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Product List -->
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Mes produits</h5>
                        <div class="input-group w-50">
                            <span class="input-group-text border-0 bg-transparent">
                                <i class="fas fa-search text-muted"></i>
                            </span>
                            <input type="text" class="form-control border-0" id="searchInput" placeholder="Rechercher un produit...">
                        </div>
                    </div>
                    <div class="list-group list-group-flush" id="productList">
                        <!-- Product items will be dynamically added here -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Product Modal -->
    <div class="modal fade" id="editProductModal" tabindex="-1" aria-labelledby="editProductModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editProductModalLabel">Modifier le Produit</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editProductForm" class="needs-validation" novalidate>
                        <input type="hidden" id="editProductId">
                        <div class="mb-3">
                            <label for="editTitle" class="form-label">Nom</label>
                            <input type="text" class="form-control" id="editTitle" required>
                            <div class="invalid-feedback">Veuillez fournir un nom.</div>
                        </div>
                        <div class="mb-3">
                            <label for="editDescription" class="form-label">Description</label>
                            <textarea class="form-control" id="editDescription" rows="3" required></textarea>
                            <div class="invalid-feedback">Veuillez fournir une description.</div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-6">
                                <label for="editQuantity" class="form-label">Quantité</label>
                                <input type="number" id="editQuantity" class="form-control" min="0" required>
                                <div class="invalid-feedback">Quantité invalide.</div>
                            </div>
                            <div class="col-6">
                                <label for="editPrice" class="form-label">Prix (€)</label>
                                <input type="number" id="editPrice" class="form-control" min="0" step="0.01" required>
                                <div class="invalid-feedback">Prix invalide.</div>
                            </div>
                        </div>
                        <div class="mb-4">
                            <label for="editCategory" class="form-label">Catégorie</label>
                            <select class="form-select" id="editCategory" required>
                                <option value="electronique">Électronique</option>
                                <option value="vetements">Vêtements</option>
                                <option value="alimentation">Alimentation</option>
                            </select>
                            <div class="invalid-feedback">Veuillez sélectionner une catégorie.</div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                    <button type="button" class="btn btn-primary" id="saveEditButton">Enregistrer les modifications</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Initialize Bootstrap toast
        const toast = new bootstrap.Toast(document.querySelector('.toast'));

        // Global products array
        let products = [];

        // Form validation setup
        function setupFormValidation() {
            const forms = document.querySelectorAll('.needs-validation');
            
            forms.forEach(form => {
                form.addEventListener('submit', event => {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                });
            });
        }

        // Show success notification
        function showNotification(message) {
            const toastBody = document.querySelector('.toast-body');
            toastBody.textContent = message;
            toast.show();
        }

        // Add Product logic
        document.getElementById("buttonNew").addEventListener("click", function() {
            const form = document.getElementById("taskForm");
            
            if (!form.checkValidity()) {
                form.classList.add('was-validated');
                return;
            }

            const title = document.getElementById("title").value;
            const description = document.getElementById("description").value;
            const quantity = document.getElementById("quantity").value;
            const price = document.getElementById("price").value;
            const category = document.getElementById("category").value;
            
            const product = {
                id: Date.now(),
                title,
                description,
                quantity,
                price,
                category
            };

            // Add the new product to the products array
            products.push(product);

            // Update the UI
            updateProductList(product);

            // Reset the form
            form.reset();
            form.classList.remove('was-validated');

            // Show success notification
            showNotification('Produit ajouté avec succès!');
        });

        function updateProductList(product) {
            const productList = document.getElementById("productList");
            const productItem = document.createElement("li");
            productItem.classList.add("list-group-item", "d-flex", "justify-content-between", "align-items-center", "product-card");
            productItem.setAttribute('data-id', product.id);
            
            productItem.innerHTML = `
                <div class="d-flex flex-column">
                    <h6 class="mb-1">${product.title}</h6>
                    <p class="mb-1 text-muted small">${product.description}</p>
                    <div class="d-flex gap-2">
                        <span class="category-badge bg-light text-dark">${product.category}</span>
                        <span class="text-primary">${product.price}€</span>
                        <span class="text-secondary">Stock: ${product.quantity}</span>
                    </div>
                </div>
                <div class="d-flex gap-2">
                    <button class="btn btn-sm btn-info" data-bs-toggle="modal" data-bs-target="#editProductModal" onclick="editProduct(${product.id})">
                        <i class="fas fa-edit"></i> Modifier
                    </button>
                    <button class="btn btn-sm btn-danger" onclick="deleteProduct(${product.id})">
                        <i class="fas fa-trash"></i> Supprimer
                    </button>
                </div>
            `;
            
            productList.appendChild(productItem);
        }

        function editProduct(productId) {
            const product = products.find(p => p.id === productId);
            if (!product) return;

            // Populate modal form with product data
            document.getElementById("editProductId").value = product.id;
            document.getElementById("editTitle").value = product.title;
            document.getElementById("editDescription").value = product.description;
            document.getElementById("editQuantity").value = product.quantity;
            document.getElementById("editPrice").value = product.price;
            document.getElementById("editCategory").value = product.category;
        }