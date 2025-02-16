<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
 <nav class="container-fluid mb-4">
        <div class="row justify-content-center">
            <div class="col-12 col-md-8 col-lg-6">
                <div class="rounded p-3 bg-secondary text-white">
                    <h1 class="text-center mb-0">Stock Master</h1>
                </div>
            </div>
        </div>
    </nav>
    
    <div id="form" class="container mb-4">
        <div class="row justify-content-center">
            <div class="col-3 col-md-8 col-lg-6">
                <form id="taskForm" class="needs-validation" novalidate>
                    <div class="form-group mb-3">
                        <label for="title">Name</label>
                        <input type="text" class="form-control" id="title" placeholder="Name" required>
                        <div class="invalid-feedback">Please provide a name.</div>
                    </div>

                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <textarea class="form-control" id="description" rows="3"></textarea>
                        <div class="invalid-feedback">Please provide a description.</div>
                    </div>
                 <div class="mb-4">
                            <div class="form-group">
                                <label for="workDuration" class="form-label">Quantité</label>
                                <input type="number" id="workDuration" class="form-control" value="50" min="50" max="200">
                                <div class="invalid-feedback">
                                   
                                </div>
                            </div>
              <div class="mb-4">
                            <div class="form-group">
                                <label for="workDuration" class="form-label">Prix </label>
                                <input type="number" id="workDuration" class="form-control" value="30" min="30" max="150">
                                <div class="invalid-feedback">
                                   
                                </div>
                            </div>
        <div class="form-group mb-3">
                        <label for="priorite">catégorie</label>
                        <select class="form-control" id="priorite" required>
                            <option value="basse">Électronique</option>
                            <option value="moyenne">Vêtements</option>
                            <option value="haute">Alimentation</option>
                        </select>
                        <div class="invalid-feedback">Please select a priority.</div>
                    </div>
        <div class="d-grid">
                        <button type="button" id="buttonnew" class="btn btn-secondary">Ajouter</button>
                    </div>
                    <div class="container mb-4">
        <div class="row justify-content-center">
            <div class="col-12 col-md-10 col-lg-8">
                <div class="card shadow-lg">
                    <div class="card-header bg-secondary text-white py-3">
                        <h4 class="mb-0 d-grid justify-content-center">Mes produits</h4>
                    </div>
                    <ul id="tasks-list" class="list-group list-group-flush">
                        <!-- Task items will be dynamically inserted here -->
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>