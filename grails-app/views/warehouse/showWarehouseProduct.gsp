<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Warehouse Product Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        h1 {
            text-align: center;
        }
        .details {
            margin-top: 20px;
        }
        .details p {
            margin-bottom: 10px;
        }
        .details label {
            font-weight: bold;
        }
        .back-link {
            text-align: center;
            margin-top: 20px;
        }
        .back-link a {
            text-decoration: none;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
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
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Warehouse Product Details</h1>

        <!-- Display all products in the warehouse -->
        <h2>Բոլոր ապրանքերը "${warehouseProduct.warehouse.name}" պահեստի</h2>
       <table>
           <thead>
               <tr>
                   <th>Ապրանքի կոդ</th>
                   <th>անուն</th>
                   <th>գին</th>
                   <th>արտադրվել է</th>
                   <th>վավեր է</th>
                   <th>քանակ</th> <!-- Added quantity column header -->
                   <th>հեռացնելա</th>
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
                               <button type="submit">Ջնջել</button>
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

        <!-- Link to go to the product list page -->
         <div class="back-link">
                <a href="${createLink(uri: '/product/index')}">Ապրանքների ցանկ</a>
            </div>

    </div>
</body>
</html>
