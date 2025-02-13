<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Stock Master</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="bg-light">
    <nav class="container-fluid mb-4">
        <div class="row justify-content-center">
            <div class="col-12 col-md-8 col-lg-6">
                <div class="rounded p-3 bg-secondary text-white text-center">
                    <h1 class="mb-0">Stock Master</h1>
                </div>
            </div>
        </div>
    </nav>
    
    <div id="form" class="container mb-4">
        <div class="row justify-content-center">
            <div class="col-12 col-md-8 col-lg-6">
                <form id="taskForm" class="needs-validation" novalidate>
                    <div class="mb-3">
                        <label for="title" class="form-label">Nom</label>
                        <input type="text" class="form-control" id="title" placeholder="Nom" required>
                        <div class="invalid-feedback">Veuillez fournir un nom.</div>
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <textarea class="form-control" id="description" rows="3" required></textarea>
                        <div class="invalid-feedback">Veuillez fournir une description.</div>
                    </div>
                    <div class="mb-3">
                        <label for="quantity" class="form-label">Quantité</label>
                        <input type="number" id="quantity" class="form-control" value="50" min="50" max="200" required>
                        <div class="invalid-feedback">Veuillez entrer une quantité valide.</div>
                    </div>
                    <div class="mb-3">
                        <label for="price" class="form-label">Prix</label>
                        <input type="number" id="price" class="form-control" value="30" min="30" max="150" required>
                        <div class="invalid-feedback">Veuillez entrer un prix valide.</div>
                    </div>
                    <div class="mb-3">
                        <label for="category" class="form-label">Catégorie</label>
                        <select class="form-control" id="category" required>
                            <option value="electronique">Électronique</option>
                            <option value="vetements">Vêtements</option>
                            <option value="alimentation">Alimentation</option>
                        </select>
                        <div class="invalid-feedback">Veuillez sélectionner une catégorie.</div>
                    </div>
                    <div class="d-grid">
                        <button type="button" id="buttonNew" class="btn btn-secondary">Ajouter</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <div class="container mb-4">
        <div class="row justify-content-center">
            <div class="col-12 col-md-10 col-lg-8">
                <div class="card shadow-lg">
                    <div class="card-header bg-secondary text-white text-center py-3">
                        <h4 class="mb-0">Mes produits</h4>
                    </div>
                    <ul class="list-group list-group-flush" id="productList">
                        <!-- Les produits ajoutés apparaîtront ici -->
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
