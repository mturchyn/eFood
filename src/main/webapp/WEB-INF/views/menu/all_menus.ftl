<@content for="title">All menus</@content>
${time1}
<br>
${weeklyMenus.mondayDate}
<#list weeklyMenus.listOfMenu as menu>
    <br>
    ${menu.date}
    <#list menu.listOfDishes as dish>

        ${dish.name}
    <br>



    </#list>
</#list>
