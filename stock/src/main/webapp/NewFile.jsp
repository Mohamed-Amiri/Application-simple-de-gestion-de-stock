<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            --primary-color: #6366f1;
            --success-color: #22c55e;
            --warning-color: #f59e0b;
            --danger-color: #ef4444;
        }
        
        body {
            background-color: #f8f9fa;
        }

        .navbar {
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .card {
            border: none;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease;
        }

        .card:hover {
            transform: translateY(-2px);
        }

        .floating-form {
            background: white;
            border-radius: 1rem;
        }

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
            transform: scale(1.05);
        }

        .btn-delete {
            background-color: #FEE2E2;
            color: #DC2626;
            border: none;
        }

        .btn-delete:hover {
            background-color: #FCA5A5;
            color: #B91C1C;
            transform: scale(1.05);
        }

        .category-badge {
            display: inline-block;
            padding: 0.35rem 0.75rem;
            border-radius: 1rem;
            font-size: 0.85rem;
        }

        .product-card {
            transition: all 0.2s ease;
            cursor: pointer;
        }

        .product-card:hover {
            background-color: #f8f9fa;
        }

        .modal-content {
            border-radius: 1rem;
            border: none;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
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
            animation: pulse 1.5s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        .search-input {
            border-radius: 2rem;
            padding-left: 2.5rem;
        }

        .search-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            z-index: 10;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-white">
        <div class="container">
            <a class="navbar-brand fw-bold text-primary" href="#">StockMaster</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Rapports</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Paramètres</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container py-5">
        <div class="row g-4">
            <div class="col-lg-4">
                <div class="card h-100">
                    <div class="card-header bg-white border-0 py-4">
                        <h4 class="mb-0 fw-bold" id="formTitle">Ajouter un produit</h4>
                    </div>
                    <div class="card-body pt-0">
                        <form id="productForm" class="needs-validation" novalidate>
                            <input type="hidden" id="productId">
                            <div class="mb-3">
                                <label for="title" class="form-label">Nom du produit</label>
                                <input type="text" class="form-control" id="title" required>
                                <div class="invalid-feedback">Veuillez saisir un nom valide</div>
                            </div>
                            <div class="mb-3">
                                <label for="description" class="form-label">Description</label>
                                <textarea class="form-control" id="description" rows="3" required></textarea>
                                <div class="invalid-feedback">Veuillez saisir une description</div>
                            </div>
                            <div class="row g-3 mb-3">
                                <div class="col-md-6">
                                    <label for="quantity" class="form-label">Quantité</label>
                                    <input type="number" class="form-control" id="quantity" min="50" max="200" required>
                                    <div class="invalid-feedback">50-200 unités requis</div>
                                </div>
                                <div class="col-md-6">
                                    <label for="price" class="form-label">Prix (€)</label>
                                    <input type="number" class="form-control" id="price" min="30" max="150" required>
                                    <div class="invalid-feedback">30-150€ requis</div>
                                </div>
                            </div>
                            <div class="mb-4">
                                <label for="category" class="form-label">Catégorie</label>
                                <select class="form-select" id="category" required>
                                    <option value="electronique">Électronique</option>
                                    <option value="vetements">Vêtements</option>
                                    <option value="alimentation">Alimentation</option>
                                </select>
                            </div>
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary py-2">
                                    <i class="fas fa-plus me-2"></i>Ajouter produit
                                </button>
                                <button type="button" id="cancelButton" class="btn btn-outline-secondary" style="display: none;">
                                    Annuler modification
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-lg-8">
                <div class="card">
                    <div class="card-header bg-white d-flex flex-column flex-md-row justify-content-between align-items-center py-4">
                        <h4 class="mb-3 mb-md-0 fw-bold">Liste des produits</h4>
                        <div class="position-relative w-100 ms-md-3" style="max-width: 400px;">
                            <i class="fas fa-search search-icon text-muted"></i>
                            <input type="text" id="searchInput" class="form-control search-input" placeholder="Rechercher...">
                        </div>
                    </div>
                    <div class="card-body p-0">
                        <div class="list-group list-group-flush" id="productList">
                            <!-- Dynamic content -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Delete Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body text-center p-5">
                    <div class="delete-modal-icon mb-4">
                        <i class="fas fa-exclamation"></i>
                    </div>
                    <h4 class="mb-3 fw-bold">Confirmer la suppression</h4>
                    <p class="text-muted mb-4">Êtes-vous sûr de vouloir supprimer définitivement ce produit ?</p>
                    <div class="d-flex justify-content-center gap-3">
                        <button type="button" class="btn btn-lg btn-light" data-bs-dismiss="modal">Annuler</button>
                        <button type="button" class="btn btn-lg btn-danger" id="confirmDelete">Supprimer</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // JavaScript remains mostly the same with improved form validation
        document.addEventListener('DOMContentLoaded', function() {
            // ... [Previous JavaScript code] ...
            
            // Add form validation enhancements
            Array.prototype.slice.call(document.querySelectorAll('.needs-validation'))
                .forEach(function(form) {
                    form.addEventListener('submit', function(event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }

                        form.classList.add('was-validated')
                    }, false)
                })
            
            // Add success notification function
            function showSuccessAlert(message) {
                const alert = document.createElement('div')
                alert.className = 'alert alert-success alert-dismissible fade show position-fixed top-0 end-0 m-4'
                alert.style.zIndex = 1000
                alert.innerHTML = `
                    ${message}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                `
                document.body.appendChild(alert)
                
                setTimeout(() => alert.remove(), 3000)
            }
        })
    </script>
</body>
</html>