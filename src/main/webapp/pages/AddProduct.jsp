<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Add Product | Pet Corner</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        body {
    height: 100vh;
    margin: 0;
    font-family: 'Poppins', 'Segoe UI', sans-serif;
    background-color: #f9f5ff; 
    display: flex;
    justify-content: center;
    align-items: center;
    color: #333; /* dark gray text for readability */
    overflow: hidden;
}

.form-container {
    width: 90%;
    max-width: 600px;
    background: #ffffff; /* crisp white */
    border-radius: 20px;
    box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.08); /* subtle shadow */
    padding: 3rem 2.5rem;
    animation: fadeInUp 1s ease forwards;
    border: 1px solid #e0e0e0; /* light border */
}

h2 {
    font-weight: 700;
    font-size: 2.4rem;
    margin-bottom: 1.8rem;
    text-align: center;
    color: #222; /* darker for headings */
    text-shadow: none;
}

h2 i {
    color: #666; /* muted icon */
    margin-right: 0.6rem;
    transition: transform 0.3s ease;
}

h2 i:hover {
    transform: rotate(20deg) scale(1.1);
    color: #999;
}

label {
    color: #555; /* medium gray labels */
    font-weight: 600;
    font-size: 1.05rem;
    margin-bottom: 0.4rem;
    display: inline-block;
}

.form-control {
    border: 1px solid #ccc;
    border-radius: 12px;
    padding: 12px 18px;
    background: #fefefe;
    color: #333;
    font-size: 1rem;
    box-shadow: none;
    transition: background 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease;
}

.form-control::placeholder {
    color: #aaa;
    font-style: italic;
}

.form-control:focus {
    background: #fff;
    outline: none;
    border-color: #888;
    box-shadow: 0 0 8px rgba(136, 136, 136, 0.3);
    color: #111;
}

textarea.form-control {
    resize: vertical;
    min-height: 100px;
}

input[type="file"] {
    padding: 6px 10px;
    color: #555;
}

.btn-primary {
    background: #e0e0e0;
    border: none;
    font-weight: 700;
    letter-spacing: 0.03em;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    transition: background 0.3s ease, box-shadow 0.3s ease;
    border-radius: 14px;
    color: #333;
}

.btn-primary:hover, .btn-primary:focus {
    background: #ccc;
    box-shadow: 0 6px 25px rgba(0, 0, 0, 0.15);
    color: #222;
}

.btn-outline-secondary {
    color: #666;
    border-color: #ccc;
    border-radius: 14px;
    transition: all 0.3s ease;
}

.btn-outline-secondary:hover {
    background: #f0f0f0;
    border-color: #999;
    color: #444;
    box-shadow: 0 0 8px #bbb;
}

.form-actions {
    display: flex;
    justify-content: space-between;
    margin-top: 2.5rem;
}

.form-actions .btn {
    width: 48%;
}

.alert-success {
    background-color: #e6f4ea;
    color: #2e7d32;
    border: 1px solid #a5d6a7;
    box-shadow: none;
    border-radius: 12px;
}

.alert-danger {
    background-color: #fdecea;
    color: #d32f2f;
    border: 1px solid #ef9a9a;
    box-shadow: none;
    border-radius: 12px;
}

.alert i {
    margin-right: 0.6rem;
    font-size: 1.2rem;
}
/* Fade-in from bottom animation */
@keyframes fadeInUp {
  0% {
    opacity: 0;
    transform: translateY(25px);
  }
  100% {
    opacity: 1;
    transform: translateY(0);
  }
}

.form-container {
  animation: fadeInUp 0.8s ease forwards;
}

/* Icon rotation + color pulse on hover */
h2 i {
  color: #666;
  margin-right: 0.6rem;
  transition: transform 0.4s ease, color 0.4s ease, filter 0.4s ease;
  cursor: default;
}

h2 i:hover {
  transform: rotate(20deg) scale(1.1);
  color: #999;
  filter: drop-shadow(0 0 3px rgba(153, 153, 153, 0.6));
}

.btn-primary {
  background: #6A0DAD; /* purple */
  color: white;
  box-shadow: 0 4px 15px rgba(106, 13, 173, 0.3);
  transition: background 0.4s ease, box-shadow 0.4s ease;
  border-radius: 14px;
  border: none;
}

.btn-primary:hover, .btn-primary:focus {
  background: #4B007D; /* deep purple */
  box-shadow: 0 6px 25px rgba(75, 0, 125, 0.5);
  color: #fff;
}

.form-container {
  background: linear-gradient(135deg, #f3e8ff 0%, #d6c1ff 100%);
  border: 1px solid #6A0DAD;
  box-shadow: 0 8px 32px 0 rgba(106, 13, 173, 0.1);
}


.form-control:focus {
  border-color: #6A0DAD;
  box-shadow: 0 0 8px rgba(106, 13, 173, 0.3);
}

/* Added for price error message */
.is-invalid {
    border-color: #d9534f !important;
    padding-right: calc(1.5em + 0.75rem);
    background-repeat: no-repeat;
    background-position: right calc(0.375em + 0.1875rem) center;
    background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
}

.invalid-feedback {
    display: none;
    color: #d9534f;
    font-size: 0.875rem;
    margin-top: 0.25rem;
}

.is-invalid + .invalid-feedback {
    display: block;
}

    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet" />
</head>
<body>

    <div class="form-container">
        <h2><i class="fas fa-plus-circle"></i>Add New Product</h2>
        <%
            String successMessage = request.getParameter("success");
            String errorMessage = request.getParameter("error");
        %>
        <% if (successMessage != null) { %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="fas fa-check-circle"></i> <%= successMessage %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } else if (errorMessage != null) { %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="fas fa-exclamation-triangle"></i> <%= errorMessage %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } %>
        <form action="${pageContext.request.contextPath}/admin/product/add" method="post" enctype="multipart/form-data" novalidate id="productForm">
            <div class="mb-4">
                <label for="name">Product Name</label>
                <input
                  type="text"
                  id="name"
                  name="name"
                  class="form-control"
                  placeholder="E.g. Cozy Dog Sweater"
                  required
                  oninvalid="this.setCustomValidity('Please fill out this field')"
                  oninput="this.setCustomValidity('')"
                />
            </div>
            <div class="mb-4">
                <label for="description">Description</label>
                <textarea
                  id="description"
                  name="description"
                  class="form-control"
                  placeholder="A warm, comfy sweater for your furry friend."
                  required
                  oninvalid="this.setCustomValidity('Please fill out this field')"
                  oninput="this.setCustomValidity('')"
                ></textarea>
            </div>
            <div class="mb-4">
                <label for="price">Price ($)</label>
                <input
                  type="text"
                  id="price"
                  name="price"
                  class="form-control"
                  placeholder="49.99"
                  required
                />
                <div class="invalid-feedback" id="priceError">Please enter a valid price (numbers only, max 2 decimals).</div>
            </div>
            <div class="mb-4">
                <label for="image">Product Image</label>
                <input type="file" id="image" name="image" accept="image/*" class="form-control" required />
            </div>
            <div class="form-actions">
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-outline-secondary">
                    <i class="fas fa-arrow-left"></i> Back
                </a>
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Add Product
                </button>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const form = document.getElementById('productForm');
        const priceInput = document.getElementById('price');
        const priceError = document.getElementById('priceError');

        // Hide error by default
        priceError.style.display = 'none';

        form.addEventListener('submit', function(event) {
            // Reset custom validation states
            priceInput.classList.remove('is-invalid');
            priceError.style.display = 'none';

            // Validate price with regex: digits, optional dot, max 2 decimals
            const priceValue = priceInput.value.trim();
            const priceRegex = /^\d+(\.\d{1,2})?$/;

            if (!priceRegex.test(priceValue)) {
                // Invalid price format
                event.preventDefault();
                event.stopPropagation();

                priceInput.classList.add('is-invalid');
                priceError.textContent = "Invalid price format. Use numbers only, max 2 decimals.";
                priceError.style.display = 'block';

                priceInput.focus();
            }

            // Also rely on HTML5 validation for other inputs
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }

            form.classList.add('was-validated');
        });
    </script>
</body>
</html>
