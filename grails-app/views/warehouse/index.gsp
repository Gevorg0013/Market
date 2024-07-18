<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Warehouse List</title>
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
    </style>
</head>
<body>
    <div class="container">
        <div class="header-container">
            <h1 class="mt-3 mb-4">Warehouse List</h1>
            <g:link class="btn btn-primary btn-create" action="create">Create New Warehouse</g:link>
        </div>

        <table class="table table-striped">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Code</th>
                    <th scope="col">Name</th>
                    <th scope="col">Products</th>
                    <th scope="col" class="actions-column text-center">Actions</th>
                </tr>
            </thead>
            <tbody>
                <g:each var="warehouse" in="${warehouses}">
                    <tr>
                        <td>${warehouse.code}</td>
                        <td>${warehouse.name}</td>
                        <td>
                            <ul>
                                <g:each var="product" in="${warehouse.products}">
                                    <li>${product.name} - Quantity: ${product.quantity}</li>
                                </g:each>
                            </ul>
                        </td>
                        <td class="actions-column text-center">
                            <g:link class="btn btn-sm btn-primary btn-action" action="edit" id="${warehouse.id}">Edit</g:link>
                            <g:form action="delete/${warehouse.id}" method="post" class="d-inline">
                                <g:submitButton class="btn btn-sm btn-danger btn-action" name="Delete"/>
                            </g:form>
                        </td>
                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
