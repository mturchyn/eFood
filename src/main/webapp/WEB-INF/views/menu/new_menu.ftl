<@content for="title">Создать меню</@content>

<span class="error_message"><@flash name="message"/></span>
<h2>Создание нового меню "на недельку"</h2>


<@form action="createMenu" method="post">
<div>
    <div name="Monday">
        Понедельник
        <#list categories as categorie>

            <p>${categorie}</p>
            <select name="categorie">
                <option value="${Menu.Monday.getDishByType(type)}"
                        selected="true">${Menu.Monday.getDishByType(type).name}</option>
                <#list dishesOfCategorie as dish>
                    <option value="${dish}" >${dish.name}</option>
                </#list>
            </select>


        </#list>
    </div>
    <!--    <div name="Tuesday">
        Вторник
        <#list types as type>
            <p>${type}</p>
            <select name="${type}">
                <option value="${Week.Tuesday.getDishByType(type)}"
                        selected="true">${Week.Tuesday.getDishByType(type).name}</option>
                <#list dishesOfType as dish>
                    <option value="${dish}" selected="${Week.Tuesday.getDishByType(type)}">${dish.name}</option>
                </#list>
            </select>
        </#list>
    </div>
    <div name="Wednesday">
        Среда
        <#list types as type>
            <p>${type}</p>

            <select name="type">
                <option value="${Week.Wednesday.getDishByType(type)}"
                        selected="true">${Week.Wednesday.getDishByType(type).name}</option>
                <#list dishesOfType as dish>
                    <option value="${dish}">${dish.name}</option>
                </#list>
            </select>


        </#list>
    </div>
    <div name="Thursday">
        Четверг
        <#list types as type>

            <p>${type}</p>
            <select name="${type}">
                <option value="${Week.Thursday.getDishByType(type)}"
                        selected="true">${Week.Thursday.getDishByType(type).name}</option>
                <#list dishesOfType as dish>
                    <option value="${dish}">${dish.name}</option>
                </#list>
            </select>


        </#list>
    </div>
    <div name="Friday">
        Пятница
        <#list types as type>

            <p>${type}</p>
            <select name="${type}">
                <option value="${Week.Friday.getDishByType(type)}"
                        selected="true">${Week.Friday.getDishByType(type).name}</option>
                <#list dishesOfType as dish>
                    <option value="${dish}">${dish.name}</option>
                </#list>
            </select>


        </#list>
    </div>
     -->
</div>
</@form>
