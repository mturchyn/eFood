<@content for="title">Edit category</@content>


<h2>Edit category</h2>

<span class="error_message"><@flash name="message"/></span>
<@form action="update" method="post" id=category.id>
    <table style="margin:30px">
        <tr>
            <td>Name</td>
            <td><input type="text" name="category" value="${category.category}" required=""> *
            </td>
        </tr>
        <tr>
            <td>Price:</td>
            <td><input type="text" name="price" value="${category.price}" required=""> *
                            <span class="error"><@flash name="error"/></span>
            </td>
        </tr>
        <tr>
            <td></td>
            <td><@link_to>Cancel</@link_to> | <input type="submit" value="Edit category"></td>

        </tr>
    </table>
</@form>



