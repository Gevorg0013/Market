<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Պահեստից ուղարկել խանութ</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 20px;
        }
        h1 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f0f0f0;
            font-weight: bold;
        }
        .btn {
            display: inline-block;
            background-color: #007bff;
            color: #fff;
            padding: 8px 12px;
            text-decoration: none;
            border-radius: 4px;
            text-align: center;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Պահեստից ուղարկել խանութ</h1>

    <table>
        <thead>
            <tr>
                <th>Ապրանքի Անուն</th>
                <th>Քանակը պահեստում</th>
                <th>Գործողություն</th>
            </tr>
        </thead>
        <tbody>
            <g:each in="${warehouseProducts}" var="warehouseProduct">
                <tr>
                    <td>${warehouseProduct.product.productName}</td>
                    <td>${warehouseProduct.quantity}</td>
                    <td>
                        <g:form controller="market" action="addProduct">
                            <input type="hidden" name="warehouseProductId" value="${warehouseProduct.id}">
                            <button type="submit" class="btn">Add to Market</button>
                        </g:form>
                    </td>
                </tr>
            </g:each>
        </tbody>
    </table>

    <p><a href="${createLink(action: 'view')}">Գնալ դեպի խանութի վաճառքի էջ</a></p>
</body>
</html>
