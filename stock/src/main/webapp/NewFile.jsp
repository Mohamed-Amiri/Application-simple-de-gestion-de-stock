<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!DOCTYPE html>
<html lang="fr">
<head>
   
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Stock Master</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
 
        
        .action-buttons .btn {
            padding: 0.5rem;
            width: 2.5rem;
            height: 2.5rem;
            border-radius: 0.5rem;
            transition: all 0.2s ease;
        }
        
        .btn-edit {
            background-color: #FEF3C7;
            color: #D97706;
            border: none;
        }
        
        .btn-edit:hover {
            background-color: #FDE68A;
            color: #B45309;
        }
        
        .btn-delete {
            background-color: #FEE2E2;
            color: #DC2626;
            border: none;
        }
        
        .btn-delete:hover {
            background-color: #FCA5A5;
            color: #B91C1C;
        }
        
        .modal-content {
            border-radius: 1rem;
            border: none;
        }
        
        .modal-header {
            border-bottom: 1px solid #E5E7EB;
        }
        
        .modal-footer {
            border-top: 1px solid #E5E7EB;
        }
        
        .delete-modal-icon {
            width: 4rem;
            height: 4rem;
            background-color: #FEE2E2;
            color: #DC2626;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto;
            font-size: 1.5rem;
        }
    </style>
</head>
<body>
    <!-- ... Previous navbar remains the same ... -->
    
    <div class="container">
        <div class="row">
            <div class="col-lg-4 mb-4">
                <div class="card floating-form">
                    <div class="card-header border-0">
                        <h5 class="mb-0" id="formTitle">Ajouter un produit</h5>
                    </div>
                    <div class="card-body">
                        <form id="productForm" class="needs-validation" novalidate>
                            <input type="hidden" id="productId">
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
                                    <input type="number" id="quantity" class="form-control" value="50" min="50" max="200" required>
                                    <div class="invalid-feedback">Quantité invalide.</div>
                                </div>
                                <div class="col-6">
                                    <label for="price" class="form-label">Prix (€)</label>
                                    <input type="number" id="price" class="form-control" value="30" min="30" max="150" required>
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
                            <div class="d-grid gap-2">
                                <button type="submit" id="submitButton" class="btn btn-primary">
                                    <i class="fas fa-plus me-2"></i>Ajouter le produit
                                </button>
                                <button type="button" id="cancelButton" class="btn btn-light" style="display: none;">
                                    Annuler
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Mes produits</h5>
                        <div class="input-group w-50">
                            <span class="input-group-text border-0 bg-transparent">
                                <i class="fas fa-search text-muted"></i>
                            </span>
                            <input type="text" id="searchInput" class="form-control border-0" placeholder="Rechercher un produit...">
                        </div>
                    </div>
                    <div class="list-group list-group-flush" id="productList">
                        <!-- Products will be dynamically added here -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body text-center p-4">
                    <div class="delete-modal-icon mb-4">
                        <i class="fas fa-trash-alt"></i>
                    </div>
                    <h5 class="mb-3">Confirmer la suppression</h5>
                    <p class="text-muted mb-4">Êtes-vous sûr de vouloir supprimer ce produit ? Cette action est irréversible.</p>
                    <div class="d-flex justify-content-center gap-2">
                        <button type="button" class="btn btn-light" data-bs-dismiss="modal">Annuler</button>
                        <button type="button" class="btn btn-danger" id="confirmDelete">Supprimer</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            let products = [];
            let currentProductId = null;
            const productForm = document.getElementById('productForm');
            const productList = document.getElementById('productList');
            const searchInput = document.getElementById('searchInput');
            const deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
            
            // Form submission handler
            productForm.addEventListener('submit', function(e) {
                e.preventDefault();
                if (productForm.checkValidity()) {
                    const productData = {
                        id: currentProductId || Date.now(),
                        title: document.getElementById('title').value,
                        description: document.getElementById('description').value,
                        quantity: document.getElementById('quantity').value,
                        price: document.getElementById('price').value,
                        category: document.getElementById('category').value
                    };

                    if (currentProductId) {
                        // Update existing product
                        products = products.map(p => p.id === currentProductId ? productData : p);
                    } else {
                        // Add new product
                        products.push(productData);
                    }

                    renderProducts();
                    resetForm();
                }
                productForm.classList.add('was-validated');
            });

            // Cancel button handler
            document.getElementById('cancelButton').addEventListener('click', resetForm);

            // Search handler
            searchInput.addEventListener('input', function(e) {
                const searchTerm = e.target.value.toLowerCase();
                const filteredProducts = products.filter(product => 
                    product.title.toLowerCase().includes(searchTerm) ||
                    product.description.toLowerCase().includes(searchTerm)
                );
                renderProducts(filteredProducts);
            });

            // Delete confirmation handler
            document.getElementById('confirmDelete').addEventListener('click', function() {
                if (currentProductId) {
                    products = products.filter(p => p.id !== currentProductId);
                    renderProducts();
                    deleteModal.hide();
                    currentProductId = null;
                }
            });

            function renderProducts(productsToRender = products) {
                productList.innerHTML = productsToRender.map(product => `
                    <div class="list-group-item product-card">
                        <div class="d-flex justify-content-between align-items-start">
                            <div class="flex-grow-1">
                                <h6 class="mb-1">${product.title}</h6>
                                <p class="mb-1 text-muted small">${product.description}</p>
                                <span class="category-badge bg-primary bg-opacity-10 text-primary">${product.category}</span>
                            </div>
                            <div class="text-end me-3">
                                <div class="mb-1">
                                    <span class="fw-bold">${product.price}€</span>
                                </div>
                                <div class="text-muted small">
                                    Stock: ${product.quantity} unités
                                </div>
                            </div>
                            <div class="action-buttons d-flex gap-2">
                                <button class="btn btn-edit" onclick="editProduct(${product.id})">
                                    <i class="fas fa-edit"></i>
                                </button>
                                <button class="btn btn-delete" onclick="deleteProduct(${product.id})">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                `).join('');
            }

            function resetForm() {
                currentProductId = null;
                productForm.reset();
                productForm.classList.remove('was-validated');
                document.getElementById('formTitle').textContent = 'Ajouter un produit';
                document.getElementById('submitButton').innerHTML = '<i class="fas fa-plus me-2"></i>Ajouter le produit';
                document.getElementById('cancelButton').style.display = 'none';
            }

            // Make these functions globally available
            window.editProduct = function(id) {
                const product = products.find(p => p.id === id);
                if (product) {
                    currentProductId = id;
                    document.getElementById('title').value = product.title;
                    document.getElementById('description').value = product.description;
                    document.getElementById('quantity').value = product.quantity;
                    document.getElementById('price').value = product.price;
                    document.getElementById('category').value = product.category;
                    
                    document.getElementById('formTitle').textContent = 'Modifier le produit';
                    document.getElementById('submitButton').innerHTML = '<i class="fas fa-save me-2"></i>Enregistrer les modifications';
                    document.getElementById('cancelButton').style.display = 'block';
                }
            };

            window.deleteProduct = function(id) {
                currentProductId = id;
                deleteModal.show();
            };
        });
    </script>
</body>
</html>