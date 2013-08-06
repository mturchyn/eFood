<@content for="title">Login</@content>

<h3>Login</h3>

<#--<#if error==1>-->
<#--<div class="errorblock">-->
    <#--Your login attempt was not successful, try again.<br/>-->
<#--</div>-->
<#--</#if>-->

<@form action="/efood/j_spring_security_check" method="post">
<table>
    <tr>
        <td>User:</td>
        <td><input type='text' name='j_username' value=''>
        </td>
    </tr>
    <tr>
        <td>Password:</td>
        <td><input type='password' name='j_password'/>
        </td>
    </tr>
    <tr>
        <td colspan='2'><input name="submit" type="submit"
                               value="submit"/>
        </td>
    </tr>
</table>
</@form>
