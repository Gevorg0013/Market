<!-- grails-app/views/emptyWarehouseError.gsp -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Empty Warehouse Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 20px;
            text-align: center;
        }
        .container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #dc3545;
            margin-bottom: 20px;
        }
        p {
            font-size: 18px;
            margin-bottom: 20px;
        }
        .btn-back {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        .btn-back:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Պահեստը դատարկ է</h1>
<p>Գնալ ներքեվի լինկով ստեղծել առնվազն մեկ ապրանք որպեսզի առնվազն մեկ պահեստ հասանելի լինի:</p>
        <a href="${createLink(uri: '/warehouse/index')}" class="btn-back">Ավելացնել նոր ապրանք պահեստում</a>
    </div>
</body>
</html>
