<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <title>Student | Create</title>
</head>

<body>
<h1 align="center">Registration form</h1>
<hr/>
<g:if test="${flash.error}">
    <div style="color: red">${flash.error}</div>
</g:if>

<fieldset>
    <legend>add student information</legend>
    <form id="regForm">
        <table>
            <tr>
                <td>Name</td>
                <td><g:textField name="name" /></td>
            </tr>
            <tr>
                <td>Roll</td>
                <td><g:textField name="roll" /></td>
            </tr>
            <tr>
                <td>Dath of birth</td>
                <td><input type="date" name="birthday" /></td>
            </tr>
            <tr>
                <td></td>
                <td><g:submitButton name="submitBtn" value="Submit" id="submitBtn" /></td>
            </tr>
        </table>
    </form>
</fieldset>
<g:link action="index">Back</g:link>


<script>

    $("#updateLateAttModalForm").submit(function(e) {
        $('#updateLateAttModal .modal-footer-action-btns').hide();
        $('#updateLateAttModal .modal-refresh-processing').show();
        jQuery.ajax({
            type:'POST',
            dataType:'JSON',
            data: $("#updateLateAttModalForm").serialize(),
            url: "${g.createLink (controller: 'attnEmployee', action:'updateLateEntry')}",
            success: function(data){
                if(data.isError == true){
                    showErrorMsg(data.message);
                }else{
                    $('#updateLateAttModal').modal('hide');
                    empAttnList.draw(false);
                    showSuccessMsg(data.message);
                }
            }
        });
        e.preventDefault();
    });

    $(document).ready(function(){
        $("#regForm").submit(function(e){
            jQuery.ajax({
                type:'POST',
                dataType: 'JSON',
                data: $("#regForm").serialize(),
                url: "${g.createLink(controller: 'registration', action: 'save')}",

            });
            e.preventDefault();
        });



    });

</script>

</body>
</html>