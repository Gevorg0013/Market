<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Ավելացնել ապրանք պահեստում</title>
</head>
<body>
<h1>Add Product to Warehouse</h1>
<g:form action="addToWarehouse/${warehouse?.id}">
    <label for="productId">Product:</label>
    <g:select name="productId" from="${availableProducts}" optionKey="id" optionValue="name" required="true"/><br/>
    <label for="quantity">Quantity:</label>
    <g:textField name="quantity" required="true"/><br/>
    <g:submitButton name="Add"/>
</g:form>

</body>
</html>
