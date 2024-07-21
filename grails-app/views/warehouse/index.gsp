    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Warehouse Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                padding: 20px;
                background-color: #f8f9fa;
            }
            .container {
                max-width: 900px;
                margin: auto;
                background-color: #fff;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                border-radius: 5px;
            }
            .header-container {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }
            .btn-create {
                font-size: 16px;
                font-weight: bold;
            }
            .warehouse-section {
                margin-bottom: 20px;
            }
            .back-link {
                display: inline-block; /* Ensures it only takes the necessary width */
                transform: translateX(420px); /* Moves the div to the right */
            }

            .back-link.small {
                font-size: 30%; /* Example: makes it smaller */
                /* Adjust other properties as needed */
            }

            .warehouse-title {
                font-size: 20px;
                font-weight: bold;
                margin-bottom: 10px;
            }
            .product-list {
                list-style-type: none;
                padding-left: 0;
            }
            .product-item {
                margin-bottom: 5px;
                padding: 8px;
                background-color: #f2f2f2;
                border-radius: 3px;
            }
            .form-group {
                margin-bottom: 20px;
            }
            .btn-action {
                padding: 10px 20px;
                font-size: 16px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header-container">
                <h1>Warehouses and Products</h1>
            </div>

            <div class="warehouse-section">
                <g:each var="warehouse" in="${warehouses}">
                    <div class="card mb-3">
                        <div class="card-header warehouse-title">
                            ${warehouse.name}
                        </div>
                        <div class="card-body">
                            <ul class="list-group list-group-flush">
                                <g:each var="wp" in="${warehouseProducts.findAll { it.warehouse == warehouse }}">
                                    <li class="list-group-item product-item">${wp.product.productName}</li>
                                </g:each>
                            </ul>
                        </div>
                    </div>
                </g:each>
            </div>

            <!-- Form to add product -->
            <g:if test="${!addedProduct}">
                <div class="card">
                    <h5 class="card-header">Add Product</h5>
                    <div class="card-body">
                        <g:form action="addProduct" method="post">
                            <div class="form-group">
                                <label for="productId">Product:</label>
                                <select id="productId" name="productId" class="custom-select">
                                    <option value="">Select Product</option>
                                    <g:if test="${availableProducts}">
                                        <g:each var="product" in="${availableProducts}">
                                            <option value="${product.id}">${product.productName}</option>
                                        </g:each>
                                    </g:if>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="quantity">Quantity:</label>
                                <input type="number" id="quantity" name="quantity" min="1" value="1" class="form-control">
                            </div>
                            <button type="submit" class="btn btn-success btn-action">Add Product in wareHouse</button>
                        </g:form>
                    </div>
                </div>
            </g:if>
            <div class="back-link small">
                <a href="${createLink(uri: '/product/index')}" class="btn btn-primary">վերադառնալ ապրանքների ցանկ / Products List</a>
            </div>
        </div>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
    </html>
