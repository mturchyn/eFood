<@content for="title">Admin page</@content>
admin page
<br/>
Hello, admin <strong>${name}! </strong>
<br/>
<@link_to controller="category" >Edit categories</@>
<br/>
<@link_to controller="menu" >Any action with menu</@>
<br/>
<@link_to controller="menu" action="new_menu">new menu</@>
<br/>
<@link_to controller="dishes">All dishes</@>
<br/>

<a href="/efood/j_spring_security_logout" > Logout</a>
