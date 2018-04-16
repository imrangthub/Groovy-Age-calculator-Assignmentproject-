<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Student | Edit</title>
</head>

<body>
<h1 align="center">Registration form</h1>
<hr/>
<g:if test="${flash.error}">
    <div style="color: red">${flash.error}</div>
</g:if>

<fieldset>
    <legend>add student information</legend>
    <g:form action="update">
        <g:hiddenField name="id" value="${registration.id}"/>
        <table>
            <tr>
                <td>Name</td>
                <td><g:textField name="name" value="${registration.name}" /></td>
            </tr>
            <tr>
                <td>Roll</td>
                <td><g:textField name="roll" value="${registration.roll}" /></td>
            </tr>
            <tr>
                <td>Dath of birth</td>
                <td><input type="date" name="birthday" value="${registration.birthday}" /></td>
            </tr>
            <tr>
                <td></td>
                <td><g:submitButton name="submitBtn" value="Submit" /></td>
            </tr>
        </table>
    </g:form>
</fieldset>
<g:link action="index">Back</g:link>

</body>
</html>