<@content for="title">Create category</@content>


<h2>Create category</h2>

<span class="error_message"><@flash name="message"/></span>
<@form action="create" method="post">
    <table style="margin:30px">
        <tr>
            <td>Name</td>
            <td><input type="text" name="category" value="${(flasher.params.category)!}" required>
            </td>
        </tr>
        <tr>
            <td>Price:</td>
            <td><input type="text" name="price" value="${(flasher.params.price)!}" required>
            </td>
        </tr>
        <tr>
            <td></td>
            <td><@link_to>Cancel</@link_to> | <input type="submit" value="Create category"></td>

        </tr>
    </table>
</@form>






