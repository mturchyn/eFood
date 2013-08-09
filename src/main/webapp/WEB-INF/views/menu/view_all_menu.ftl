<@content for="title">All menus</@content>

<div id="result"></div>
<@link_to controller="menu" action="getJsonMenu" destination="result"  >Get Books</@>
<script type="text/javascript">

    $(document).ready(function () {
        $.ajax({
            url: 'getWeeklyMenuAsJson',
            type: 'GET',
            success: function (data, textStatus) {

            }


        });
    });
</script>
