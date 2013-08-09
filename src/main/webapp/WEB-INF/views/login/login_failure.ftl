<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${context_path}/css/bootstrap_2.3.1/bootstrap.css">
    <link rel="stylesheet" href="${context_path}/css/bootstrap_2.3.1/bootstrap-responsive.css">
    <script src="${context_path}/js/bootstrap_2.3.1/bootstrap.js" type="text/javascript"></script>
    <#--<script type='text/javascript'>-->
        <#--function hide(id) {-->
            <#--document.getElementById(id).style.display = 'none';-->
        <#--}-->
    <#--</script>-->
    <title>Login failed</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="span4 offset4 well">
            <div class="alert alert-danger " onClick="hide('error')" id="error">
                <button type="button" class="close" data-dismiss="alert">×</button>
                <strong>Incorrect Username or Password!</strong> Please, try again!
            </div>
            <legend>Please Sign In</legend>
            <form method="POST" action="/efood/j_spring_security_check" accept-charset="UTF-8">
                <input type="text" id="username" class="span4" name="j_username" placeholder="Username">
                <input type="password" id="password" class="span4" name="j_password" placeholder="Password">
                <label class="checkbox">
                    <input type="checkbox" name="remember-me-parameter" checked="checked"> Remember Me
                </label>
                <button type="submit" name="submit" class="btn btn-info btn-block">Sign in</button>
            </form>
        </div>
    </div>
</div>
<script src="${context_path}/js/myjs.js" type="text/javascript"></script>
</body>

</html>