<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Warehouse</title>
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
        <h1>Delete Warehouse</h1>

        <p>Are you sure you want to delete this warehouse?</p>

        <form action="${createLink(controller: 'warehouse', action: 'delete', params: [id: warehouse.id])}" method="post">
            <div class="form-group">
                <button type="submit" class="btn btn-danger">Delete</button>
                <a href="${createLink(controller: 'warehouse', action: 'index')}" class="btn btn-secondary ml-2">Cancel</a>
            </div>
        </form>

        <div class="mt-3">
            <g:if test="${flash.message}">
                <div class="alert alert-info">${flash.message}</div>
            </g:if>
        </div>
    </div>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
