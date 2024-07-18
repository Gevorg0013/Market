<!-- grails-app/views/storeapp/warehouse/sendProduct.gsp -->

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Send Product to Another Warehouse</title>
</head>
<body>
<h1>Send Product to Another Warehouse</h1>

<g:form action="sendToOtherWarehouse/${warehouse?.id}">
    <label for="productId">Product:</label>
    <g:select name="productId" from="${warehouse?.products}" optionKey="product.id" optionValue="product.name" required="true"/><br/>

    <label for="quantity">Quantity:</label>
    <g:textField name="quantity" required="true"/><br/>

    <label for="toWarehouseId">To Warehouse:</label>
    <g:select name="toWarehouseId" from="${Warehouse.list()}" optionKey="id" optionValue="name" required="true"/><br/>

    <g:submitButton name="Send"/>
</g:form>

</body>
</html>
