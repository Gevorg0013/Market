<!-- grails-app/views/storeapp/warehouse/edit.gsp -->

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Edit Warehouse</title>
</head>
<body>
<h1>Edit Warehouse</h1>

<g:form action="update/${warehouse?.id}">
    <label for="code">Code:</label>
    <g:textField name="code" value="${warehouse?.code}" required="true"/><br/>

    <label for="name">Name:</label>
    <g:textField name="name" value="${warehouse?.name}" required="true"/><br/>

    <g:submitButton name="Update"/>
</g:form>

</body>
</html>
