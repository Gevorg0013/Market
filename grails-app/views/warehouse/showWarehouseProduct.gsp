<!DOCTYPE html>
<html lang="en">
<head>
     <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Պահեստ</title>
    <style>
       body {
           font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
           margin: 0; /* Reset margin to ensure full page utilization */
           background-color: #f3f4f6;
       }

       .container {
           width: 100%; /* Occupy full width of the viewport */
           min-height: 100vh; /* Use full viewport height */
           padding: 20px;
           background-color: #f3f4f6; /* Match body background */
           box-sizing: border-box; /* Ensure padding is included in width/height */
           position: relative;
       }
        h1 {
            text-align: center;
            color: #333;
        }
        h2 {
            margin-top: 20px;
            font-size: 1.5rem;
            color: #007bff;
        }
        .details {
            margin-top: 20px;
        }
        .details p {
            margin-bottom: 10px;
            color: #666;
        }
        .details label {
            font-weight: bold;
            color: #333;
        }
        .back-link {
            text-align: right;
            margin-top: 20px;
        }
        .back-link a {
            text-decoration: none;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .back-link a:hover {
            background-color: #0056b3;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
            color: #333;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        /* Style for the Market index link in the lower right corner */
        .market-index-link {
            position: absolute;
            bottom: 20px;
            right: 20px;
        }
        .market-index-link a {
            text-decoration: none;
            padding: 10px 20px;
            background-color: #28a745;
            color: #fff;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .market-index-link a:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Պահեստ</h1>

        <!-- Display all products in the warehouse -->
        <h2>"${warehouseProduct.warehouse.name}" պահեստ</h2>
        <table>
            <thead>
                <tr>
                    <th>Ապրանքի կոդ</th>
                    <th>Անուն</th>
                    <th>Գին</th>
                    <th>Արտադրվել է</th>
                    <th>Վավեր է</th>
                    <th>Քանակ</th> <!-- Added quantity column header -->
                    <th>Հեռացնել</th>
                </tr>
            </thead>
            <tbody>
                <!-- Iterate over each warehouse product -->
                <g:each var="wp" in="${warehouseProducts}">
                    <tr>
                        <td>${wp.product.id}</td>
                        <td>${wp.product.productName}</td>
                        <td>${wp.product.price}</td>
                        <td>${wp.product.dateOfAppointment}</td>
                        <td>${wp.product.expirationDate}</td>
                        <td>${wp.quantity}</td> <!-- Display quantity -->
                        <td>
                            <!-- Form to delete warehouse product -->
                            <form action="${createLink(action: 'removeProductFromWarehouse', params: [warehouseProductId: wp.id])}" method="post">
                                <button type="submit" style="padding: 8px 12px; background-color: #dc3545; color: #fff; border: none; border-radius: 4px; cursor: pointer;">Ջնջել</button>
                            </form>
                        </td>
                    </tr>
                </g:each>
            </tbody>
        </table>

        <!-- Link to go back to the main warehouse index -->
        <div class="back-link">
            <a href="${createLink(uri: '/warehouse/index')}">Ավելացնել ապրանք</a>
        </div>

        <!-- Market index link in the lower right corner -->
        <div class="market-index-link">
            <a href="http://localhost:8080/market/index">Խանութում ապրանք ավելացնելու էջ</a>
        </div>

        <!-- Link to go to the product list page -->
        <div class="back-link">
            <a href="${createLink(uri: '/product/index')}">Ապրանքների ցուցակ</a>
        </div>

    </div>
</body>
</html>
