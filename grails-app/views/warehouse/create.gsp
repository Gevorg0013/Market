<!-- grails-app/views/warehouse/create.gsp -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Warehouse</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        fieldset {
            margin-bottom: 15px;
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 5px;
        }
        legend {
            font-size: 1.2em;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }
        label {
            display: inline-block;
            width: 120px;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type=text], select {
            width: calc(100% - 130px); /* Adjusted to allow space for the label */
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type=submit] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            float: right;
        }
        input[type=submit]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Create Warehouse</h2>
<g:form action="save">
    <!-- Warehouse details fields -->
    <fieldset>
        <legend>Warehouse Details</legend>
        <div>
            <label for="name">Name:</label>
            <g:textField name="name" required=""/>
        </div>
        <div>
            <label for="code">Code:</label>
            <g:textField name="code" required=""/>
        </div>
    </fieldset>

    <!-- Products selection (assuming multiple products can be selected) -->
    <fieldset>
        <legend>Products to Add</legend>
        <div>
            <label for="products">Products:</label>
            <g:select name="productIds" from="${products}" optionKey="id" optionValue="productName" multiple="true"/>
        </div>
        <div>
            <label for="quantities">Quantities:</label>
            <g:textField name="quantities" required=""/>
        </div>
    </fieldset>

    <!-- Hidden field for product IDs -->
    <g:hiddenField name="productIds" value=""/>

    <!-- Submit button -->
    <input type="submit" value="Create"/>
</g:form>



</div>
</body>
</html>
