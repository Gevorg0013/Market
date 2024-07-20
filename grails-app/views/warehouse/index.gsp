<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Warehouse Page</title>
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
        .actions-column {
            white-space: nowrap;
        }
        .btn-action {
            padding: 6px 12px;
            font-size: 14px;
            margin-right: 5px;
        }
        .btn-create {
            font-size: 16px;
            font-weight: bold;
        }
        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .warehouse-section {
            margin-bottom: 20px;
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
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header-container">
            <h1>Warehouses and Products</h1>
            <a href="#" class="btn btn-primary btn-create">Create Warehouse</a>
        </div>

        <div class="warehouse-section">
            <g:each var="warehouse" in="${warehouses}">
                <div class="warehouse-title">${warehouse.name}</div>
                <ul class="product-list">
                    <g:each var="wp" in="${warehouseProducts.findAll { it.warehouse == warehouse }}">
                        <li class="product-item">${wp.product.productName}</li>
                    </g:each>
                </ul>
            </g:each>
        </div>

        <!-- Form to add product -->
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
            <button type="submit" class="btn btn-success btn-action">Add Product</button>
        </g:form>
    </div>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
