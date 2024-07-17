<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .container {
            max-width: 500px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            margin-bottom: 5px;
            display: block;
            color: #555;
        }
        input[type="text"], input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        g\:submitButton {
            background-color: #5cb85c;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            margin-top: 10px;
        }
        g\:submitButton:hover {
            background-color: #4cae4c;
        }
        .back-link {
            text-align: center;
            margin-top: 20px;
        }
        .back-link a {
            color: #007BFF;
            text-decoration: none;
        }
        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Փոփոխոլ ապրանքը</h1>
    <g:form controller="product" action="update" method="post">
        <g:hiddenField name="id" value="${product.id}"/>

        <label for="coverLetter">Ծածկագիր:</label>
        <g:textField name="coverLetter" value="${product?.coverLetter}"/>

        <label for="title">Ապրանքի անվաում:</label>
        <g:textField name="title" value="${product?.title}"/>

        <label for="price">Ապրանքի գին:</label>
        <g:textField name="price" value="${product?.price}"/>

        <label for="dateOfAppointment">Արտադրման ամսաթիվ:</label>
        <g:datePicker name="dateOfAppointment" value="${product?.dateOfAppointment}"/>

        <label for="expirationDate">ապրանքի վերջնաժամկետ:</label>
        <g:datePicker name="expirationDate" value="${product?.expirationDate}"/>

        <g:submitButton name="update" value="Փոփոխել"/>
    </g:form>

    <div class="back-link">
        <a href="${createLink(controller: 'product', action: 'index')}">Վերադառնալ ցուցակ</a>
    </div>
</div>

</body>
</html>
