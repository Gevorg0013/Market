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
            margin-right: 10px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .btn-sale[disabled] {
            background-color: #ccc;
            cursor: not-allowed;
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
                <!-- Loop through each market product -->
                <g:each in="${marketProducts}" var="marketProduct">
                    <tr>
                        <td>${marketProduct.product.productName}</td>
                        <td>${marketProduct.quantity}</td>
                        <td>${marketProduct.product.expirationDate ?: '-'}</td> <!-- Display expiration date or '-' if not available -->
                        <td>
                            <!-- Form for removing a product -->
                            <g:form controller="market" action="removeProduct">
                                <input type="hidden" name="marketProductId" value="${marketProduct.id}">
                                <button type="submit" class="btn btn-sale">Վաճառել</button>
                            </g:form>
                        </td>
                    </tr>
                </g:each>
            </tbody>
        </table>

        <!-- Actions -->
        <div class="actions">
            <!-- Link to add a new market product -->
            <g:link controller="market" action="index" class="btn">Ավելացնել նոր ապրանք</g:link>

            <!-- Button to move expired products -->
            <button id="moveExpiredProductsBtn" class="btn btn-danger">Տեղափոխել ժամկետանց ապրանքներ պահեստ</button>

            <!-- Link to go back to warehouse index -->
            <g:link controller="warehouse" action="showWarehouseProduct" class="btn">Գնալ պահեստ</g:link>
        </div>
    </div>

    <!-- JavaScript to disable sale button based on expiration date -->
    <script>
        // Select all buttons with class 'btn-sale'
        var saleButtons = document.querySelectorAll('.btn-sale');

        // Iterate through each button
        saleButtons.forEach(function(button) {
            // Find the corresponding expiration date in the same row
            var expirationDateCell = button.closest('tr').querySelector('td:nth-child(3)');
            var expirationDateText = expirationDateCell.textContent.trim();

            // Convert expiration date text to Date object
            if (expirationDateText !== '-') {
                var expirationDate = new Date(expirationDateText);

                // Get today's date
                var today = new Date();
                today.setHours(0, 0, 0, 0); // Set time to start of day for accurate comparison

                // Compare expiration date with today's date
                if (expirationDate < today) {
                    button.disabled = true; // Disable the button if expiration date is in the past
                }
            }
        });
    </script>

    <!-- JavaScript to move expired products -->
    <script>
           document.getElementById('moveExpiredProductsBtn').addEventListener('click', function() {
               // Confirm before proceeding
               if (confirm('Are you sure you want to move expired products to warehouse?')) {
                   // Make an AJAX call to execute server-side logic
                   var xhr = new XMLHttpRequest();
                   xhr.open('POST', '/product/moveExpiredProductsToWarehouse');
                   xhr.setRequestHeader('Content-Type', 'application/json');
                   xhr.onload = function() {
                       if (xhr.status === 200) {
                           alert('Expired products moved to warehouse successfully.');
                           // Optionally update UI or redirect
                           window.location.reload(); // Example: Reload the page
                       } else {
                           alert('Failed to move expired products to warehouse.');
                       }
                   };
                   xhr.send();
               }
           });
       </script>

</body>
</html>
