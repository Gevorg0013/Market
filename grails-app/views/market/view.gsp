<!-- grails-app/views/marketProduct/index.gsp -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Market Products</title>
    <style>
    
        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .market-products-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .market-products-table th, .market-products-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        .market-products-table th {
            background-color: #f2f2f2;
        }
        .actions {
            margin-top: 20px;
            text-align: center;
        }
        .btn {
            display: inline-block;
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Ապրանքների ցուցակ</h1>
        </div>

        <!-- Table of Market Products -->
        <table class="market-products-table">
            <thead>
                <tr>
                    <th>Ապրանքի անունը</th>
                    <th>քանակ</th>
                    <th>պահպանման վերջնաժամկետ</th>
                    <th>Գործողություններ</th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${marketProducts}" var="marketProduct">
                    <tr>
                        <td>${marketProduct.product.productName}</td>
                        <td>${marketProduct.quantity}</td>
                        <td>${marketProduct.product.expirationDate ?: '-'}</td> <!-- Display expiration date or '-' if not available -->
                        <td>
                            <!-- Link to view details of the market product -->
                <g:form controller="market" action="removeProduct">
                    <input type="hidden" name="marketProductId" value="${marketProduct.id}">
                    <button type="submit" class="btn">Վաճառել</button>
                </g:form>
                        </td>
                    </tr>
                </g:each>
            </tbody>
        </table>
        <!-- Actions -->
        <div class="actions">
            <!-- Create New Market Product link with redirection to market/index -->
            <g:link controller="market" action="index" class="btn">Ավելացնել նոր ապրանք</g:link>

            <!-- Link back to Warehouse Index -->
            <g:link controller="warehouse" action="index" class="btn">Գնալ պահեստ</g:link>
        </div>
    </div>
</body>
</html>
