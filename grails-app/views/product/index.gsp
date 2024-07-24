<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ապրանքների ցուցակ</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f9f9f9; /* Light gray background */
            position: relative; /* Position relative for absolute positioning */
        }
        h1 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        a {
            text-decoration: none;
            color: #007BFF;
        }
        a:hover {
            text-decoration: underline;
        }
        .actions {
            display: flex;
            gap: 10px;
        }
        .add-product {
            display: inline-block;
            margin-bottom: 20px;
            padding: 10px 20px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
        }
        .add-product:hover {
            background-color: #0056b3;
        }
        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

    </style>
</head>
<body style="background-color: #f9f9f9;"> <!-- Set background color here -->
    <header>
        <h1>Ապրանքների ցանկ / Product List</h1>
    </header>
    <table>
        <thead>
            <tr>
                <th>Ծածկագիր / ID</th>
                <th>Անվանում / Name</th>
                <th>Գին / Price</th>
                <th>Արտադրվել է... / Date of Appointment</th>
                <th>Մինչև / Expiration Date</th>
                <th>Գործողություններ / Actions</th>
            </tr>
        </thead>
        <tbody>
            <!-- Assuming 'products' is populated correctly from the backend -->
            <g:each in="${products}" var="product">
                <tr>
                    <td>${product.coverLetter}</td>
                    <td>${product.productName}</td>
                    <td>${product.price} AMD</td> <!-- Added 'AMD' after the price -->
                    <td>${product.dateOfAppointment}</td>
                    <td>${product.expirationDate ? product.expirationDate : ''}</td> <!-- Conditional display of expiration date -->
                    <td class="actions">
                        <g:link action="edit" id="${product.id}">Փոփոխել / Edit</g:link>
                        <g:link action="delete" id="${product.id}" onclick="return confirm('Are you sure you want to delete this product?');">Ջնջել / Delete</g:link>
                    </td>
                </tr>
            </g:each>
        </tbody>
    </table>
    <a href="${createLink(controller: 'product', action: 'create')}" class="add-product">Ավելացնել նոր ապրանք / Add New Product</a>
<!-- Optional: Redirect link/button -->
    <!-- Optional: Redirect link/button -->
<a href="${createLink(controller: 'warehouse', action: 'showWarehouseProduct')}" class="redirect-link">Պահեստ</a>

</body>
</html>
