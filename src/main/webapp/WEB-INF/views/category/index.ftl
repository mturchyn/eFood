<@content for="title">Категории</@content>


<div class="message"><@flash name="message"/></div>


<table>
    <tr>
        <td>Название</td>
        <td>Стоимость</td>
        <td></td>
    </tr>
<#list categories as category>
    <tr>
        <td>
             ${category.category}
        </td>
        <td>
            ${category.price}
        </td>
        <td>
            <@link_to action="edit" id=category.id>Редактировать</@link_to>
        </td>

    </tr>
</#list>
</table>




