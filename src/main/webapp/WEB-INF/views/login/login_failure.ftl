<@content for="title">Login failure</@content>
\
<div class="container" style="width: 250px;  ">
    <div class="alert alert-danger ">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <strong>Incorrect Username or Password!</strong>  Please, try again!
    </div>
    <div class="span4 offset4 well">
        <legend>Please Sign In</legend>
        <form method="POST" action="/efood/j_spring_security_check" class="form-horizontal">
            <input name="j_username" type="text" id="inputUsername" placeholder="Username">
            <p></p>
            <input name="j_password" type="password" id="inputPassword" placeholder="Password">
            <p></p>
        <#--<div class="checkbox">-->
        <#--<label>-->
        <#--<input type="checkbox"> Remember me-->
        <#--</label>-->
        <#--</div>-->

            <button type="submit" class="btn btn-info ">Sign in</button>
        </form>
    </div>
</div>
