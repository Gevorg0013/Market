<!-- grails-app/views/storeapp/warehouse/create.gsp -->

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Create Warehouse</title>
</head>
<body>
<h1>Create Warehouse</h1>

<g:form action="save">
    <label for="code">Code:</label>
    <g:textField name="code" required="true"/><br/>

    <label for="name">Name:</label>
    <g:textField name="name" required="true"/><br/>

    <g:submitButton name="Create"/>
</g:form>

</body>
</html>
