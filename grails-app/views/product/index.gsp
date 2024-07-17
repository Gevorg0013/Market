<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f9f9f9;
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
    </style>
</head>
<body>
    <h1>Ապրանքների ցանկ</h1>
    <table>
        <thead>
            <tr>
                <th>Ծածկագիր</th>
                <th>Անվանում</th>
                <th>Գին</th>
                <th>Արտադրվել է...</th>
                <th>Մինչև</th>
                <th>Գործողություններ</th>
            </tr>
        </thead>
        <tbody>
            <g:each in="${products}" var="product">
                <tr>
                    <td>${product.coverLetter}</td>
                    <td>${product.title}</td>
                    <td>${product.price}</td>
                    <td>${product.dateOfAppointment}</td>
                    <td>${product.expirationDate ?: 'N/A'}</td>
                    <td class="actions">
                        <g:link action="edit" id="${product.id}">Փոփոխել</g:link>
                        <g:link action="delete" id="${product.id}" onclick="return confirm('Are you sure you want to delete this product?');">Ջնջել</g:link>
                    </td>
                </tr>
            </g:each>
        </tbody>
    </table>
    <a href="${createLink(controller: 'product', action: 'create')}" class="add-product">Ավելացնել նոր ապրանք</a>
</body>
</html>
