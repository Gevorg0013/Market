<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create New Warehouse</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: auto;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Create New Warehouse</h1>

    <g:form controller="warehouse" action="save">
        <div class="form-group">
            <label for="code">Code:</label>
            <g:textField name="code" class="form-control" required="true"/>
        </div>

        <div class="form-group">
            <label for="name">Name:</label>
            <g:textField name="name" class="form-control" required="true"/>
        </div>

        <div class="form-group">
            <g:submitButton class="btn btn-primary" name="Save"/>
            <g:link class="btn btn-secondary ml-2" action="index">Cancel</g:link>
        </div>
    </g:form>
</div>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
