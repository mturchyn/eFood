<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${context_path}/css/bootstrap_2.3.1/bootstrap.css">
    <link rel="stylesheet" href="${context_path}/css/bootstrap_2.3.1/bootstrap-responsive.css">
    <title>Login</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="span4 offset4 well">
            <legend>Please Sign In</legend>
            <form method="POST"  action="/efood/j_spring_security_check"accept-charset="UTF-8">
                <input type="text" id="username" class="span4" name="j_username" placeholder="Username">
                <input type="password" id="password" class="span4" name="j_password" placeholder="Password">
                <label class="checkbox">
                    <input type="checkbox" name="_spring_security_remember_me" checked="checked" value="true"> Remember Me
                </label>
                <button type="submit" name="submit" class="btn btn-info btn-block">Sign in</button>
            </form>
        </div>
    </div>
</div>
<script src="${context_path}/js/jquery-1.7.2.min.js"></script>
<script src="${context_path}/js/bootstrap_2.3.1/bootstrap.js"></script>
</body>

</html>