<@content for="title">Categories</@content>


<div class="message"><@flash name="message"/></div>


<table>
    <tr>
        <td>Name</td>
        <td>Price</td>
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
            <@link_to action="edit" id=category.id>Edit</@link_to>
        </td>

    </tr>
</#list>
</table>




