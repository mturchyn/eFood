<@content for="title">Create</@content>
<span class="error_message"><@flash name="message"/></span>
<h2>Form for creating new menu</h2>
<@form action="create" method="post">
<div>
    <p>Choise days, please:</p>
    <#list listOfDays as day>
        <div style="float: left; margin: 20px;">
            <br>
            <h2>${day}</h2>
            <input type="checkbox" name="day" value="${day_index}">
            <#list listOfCategories as dishCategory>

                <p>${dishCategory.category}:</p>
                <select name="${dishCategory.category}">
                    <option value="..." selected="true">...</option>
                    <#list dishCategory.listOfDishes as dish>
                        <option name="${dish.id}" value="${dish.id}">${dish.name}</option>
                    </#list>
                </select>
            </#list>
        </div>
    </#list>
    <div style="float: left">
        <input type="date" name="date" required="true">
    </div>
    <div style="float: left">
        <input type="submit" value="create menu">
    </div>
</div>
</@form>
