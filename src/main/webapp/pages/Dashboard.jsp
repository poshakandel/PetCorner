<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard | Pet Corner</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f5f6fa;
            font-family: 'Segoe UI', sans-serif;
        }

        /* HEADER with light lavender */
        .header-section {
            background: #E6E6FA; /* light lavender */
            color: #4B367C;       /* deep lavender/dark purple for contrast */
            padding: 2rem;
            border-radius: 0 0 20px 20px;
            box-shadow: 0 4px 15px rgba(75, 54, 124, 0.1); /* subtle purple shadow */
        }

        /* STAT cards remain white but with soft lavender accent */
        .stats-card {
            background: white;
            border-left: 5px solid #D8BFD8; /* thistle color, soft lavender tone */
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }

        .stats-card.products {
            border-color: #C8A2C8; /* a complementary lavender purple */
        }

        
      /* Light lavender background for nav */
nav.bg-primary {
    background-color: #E6E6FA !important; /* same light lavender */
    color: #4B367C !important; /* deep lavender text for contrast */
}

/* Nav links text color */
nav.bg-primary .nav-link {
    color: #4B367C !important; /* keep deep lavender */
    font-size: 1.2rem !important;
    font-weight: 600;
}

/* Nav links hover and active */
nav.bg-primary .nav-link:hover,
nav.bg-primary .nav-link:focus,
nav.bg-primary .nav-link.active {
    color: #7B68EE !important;  /* medium slate blue */
    background-color: transparent !important;
}

/* Nav link icons */
nav.bg-primary .nav-link i {
    color: #4B367C !important;
    font-size: 1.4rem !important;
    margin-right: 0.6rem;
}

/* Buttons in nav */
nav.bg-primary .nav-link.btn {
    color: #4B367C !important;
    font-size: 1.2rem !important;
    font-weight: 600;
}

nav.bg-primary .nav-link.btn:hover {
    background-color: rgba(230, 230, 250, 0.3) !important; /* subtle lavender hover */
    color: #4B367C !important;
}

        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-md-3 col-lg-2 d-md-block bg-primary text-white min-vh-100 px-3">
                <div class="py-4 text-center">
                    <h4><i class="fas fa-paw"></i> Pet Corner</h4>
                </div>
                <ul class="nav flex-column mb-4">
                    <li class="nav-item mb-2">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard">
                            <i class="fas fa-tachometer-alt"></i> Dashboard
                        </a>
                    </li>
                    <li class="nav-item mb-3">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/products">
                            <i class="fas fa-box-open"></i> Products
                        </a>
                    </li>
                </ul>

                <!-- Quick Actions -->
                <h6 class="px-2 text-uppercase small mb-3" style="color:#4B367C;">Quick Actions</h6>
                <ul class="nav flex-column mb-4">
                    <li class="nav-item mb-2">
                        <a class="nav-link btn btn-light text-primary d-flex align-items-center" href="${pageContext.request.contextPath}/admin/product/add">
                            <i class="fas fa-plus-circle me-2"></i> Add Product
                        </a>
                    </li>
                    <li class="nav-item mb-2">
                        <a class="nav-link btn btn-light text-danger d-flex align-items-center" href="${pageContext.request.contextPath}/admin/product/delete">
                            <i class="fas fa-trash-alt me-2"></i> Remove Product
                        </a>
                    </li>
                    <li class="nav-item mb-2">
                        <a class="nav-link btn btn-light text-warning d-flex align-items-center" href="${pageContext.request.contextPath}/admin/product/update">
                            <i class="fas fa-edit me-2"></i> Update Product
                        </a>
                    </li>
                    <li class="nav-item mb-2">
                        <a class="nav-link btn btn-light text-info d-flex align-items-center" href="${pageContext.request.contextPath}/admin/products">
                            <i class="fas fa-list me-2"></i> View All
                        </a>
                    </li>
                </ul>

                <div class="mt-auto pb-4">
                    <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-dark w-100" style="color:#4B367C; border-color:#4B367C;">
                        <i class="fas fa-sign-out-alt me-2"></i> Logout
                    </a>
                </div>
            </nav>

            <!-- Main Content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div class="header-section text-center mt-4 mb-5">
                    <h1>Welcome, Admin!</h1>
                </div>

                <div class="container-fluid">
                    <!-- Statistics Row 1 -->
                    <div class="row g-4">
                        <div class="col-md-6">
                            <div class="stats-card">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <div class="card-title text-primary">Total Users</div>
                                        <div class="card-value">${totalUsers}</div>
                                        <small class="text-muted">Last Month: ${totalUsersLastMonth}</small>
                                    </div>
                                    <i class="fas fa-users fa-2x text-primary"></i>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="stats-card products">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <div class="card-title text-success">Total Products</div>
                                        <div class="card-value">${totalProducts}</div>
                                        <small class="text-muted">Last Month: ${totalProductsLastMonth}</small>
                                    </div>
                                    <i class="fas fa-bone fa-2x text-success"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Statistics Row 2 -->
                    <div class="row g-4 mt-3">
                        <div class="col-md-6">
                            <div class="stats-card">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <div class="card-title text-warning">Cart Items</div>
                                        <div class="card-value">${totalCartItems}</div>
                                    </div>
                                    <i class="fas fa-cart-plus fa-2x text-warning"></i>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="stats-card">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <div class="card-title text-info">Most Popular Product</div>
                                        <div class="card-value">${mostPopularProduct}</div>
                                    </div>
                                    <i class="fas fa-star fa-2x text-info"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <!-- Charts Row -->
                <div class="row g-4 mt-5">
                    <!-- Users Bar Chart -->
                    <div class="col-md-6">
                        <h5 class="text-primary mb-1">User Growth Overview</h5>
                        <small class="text-muted d-block mb-3">Comparison between total registered users and last month's new users</small>
                        <canvas id="usersChart" style="max-height: 320px;"></canvas>
                    </div>

                    <!-- Products Pie Chart -->
                    <div class="col-md-6">
                        <h5 class="text-success mb-1">Product Inventory Distribution</h5>
                        <small class="text-muted d-block mb-3">Proportion of total products vs products added last month</small>
                        <canvas id="productsChart" style="max-width: 300px; max-height: 300px; margin: auto; display: block;"></canvas>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                <script>
                    // Users Bar Chart
                    const usersCtx = document.getElementById('usersChart').getContext('2d');
                    const usersChart = new Chart(usersCtx, {
                        type: 'bar',
                        data: {
                            labels: ['Total Users', 'New Last Month'],
                            datasets: [{
                                label: 'Users',
                                data: [${totalUsers}, ${totalUsersLastMonth}],
                                backgroundColor: ['#7B68EE', '#B0C4DE'], // medium slate blue + light steel blue
                                borderRadius: 5
                            }]
                        },
                        options: {
                            responsive: true,
                            plugins: {
                                legend: { display: false },
                                tooltip: { enabled: true }
                            },
                            scales: {
                                y: {
                                    beginAtZero: true,
                                    ticks: { stepSize: 10 }
                                }
                            }
                        }
                    });

                    // Products Pie Chart
                    const productsCtx = document.getElementById('productsChart').getContext('2d');
                    const productsChart = new Chart(productsCtx, {
                        type: 'pie',
                        data: {
                            labels: ['Total Products', 'Added Last Month'],
                            datasets: [{
                                label: 'Products',
                                data: [${totalProducts}, ${totalProductsLastMonth}],
                                backgroundColor: ['#C8A2C8', '#D8BFD8'], // lavender tones
                                borderWidth: 1
                            }]
                        },
                        options: {
                            responsive: true,
                            plugins: {
                                legend: { position: 'bottom' }
                            }
                        }
                    });
                </script>
            </main>
        </div>
    </div>
</body>
</html>
