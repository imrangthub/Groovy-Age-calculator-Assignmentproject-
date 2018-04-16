<%@ page import="java.text.SimpleDateFormat; java.time.Period; java.time.LocalDate" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="layout" content="main"/>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js">    </script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.css"/>
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.js"></script>

    <title>Student | Home</title>
</head>

<body>
<h1 align="center">Student list</h1>
<hr/>
<div id="showMessage" style="color:green";></div>
<div id="message" style="color:green";></div>
<g:if test="${flash.message}">
<div style="color: green">${flash.message}</div>
</g:if>
<g:if test="${flash.error}">
    <div  style="color: red">${flash.error}</div>
</g:if>
<div>
    <button class="btn btn-primary" id="addNewStd">Add new student</button>
</div>

<div class="col-md-8 col-md-offset-2">
    <table class="table table-striped table-hover table-bordered" id="example">
        <thead>
        <tr style="white-space: nowrap">
            <th>Serial no</th>
            <th>Name</th>
            <th>Roll</th>
            <th>Age</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody style="white-space: nowrap;">
        </tbody>
    </table>

</div>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"> Add student information</h4>
            </div>
            <div class="modal-body">

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
                                <td><g:submitButton class="btn btn-success" name="submitBtn" value="Submit" id="submitBtn" /></td>
                            </tr>
                        </table>
                    </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>
%{--modal end--}%
<script>
    jQuery(function ($) {
        var voucherTable = $('#example').DataTable({

        });


        $("#addNewStd").click(function(e){
            $('#regForm').trigger("reset");
            $('#myModal').modal('show');
            e.preventDefault();
        });
        $('#regForm').submit(function(e){
            jQuery.ajax({
                type:'POST',
                dataType: 'JSON',
                data: $('#regForm').serialize(),
                url: "${g.createLink(controller: 'registration', action: 'save')}",
                success: function(data){
                    if(data.isError == true){

                       $('#showMessage').val(data.message);
                        $('#myModal').modal('hide');
                    }else{

                        $('#showMessage').val(data.message);
                        $('#myModal').modal('hide');
                    }
                }
            });
            e.preventDefault();
        });



    });

</script>



</body>
</html>