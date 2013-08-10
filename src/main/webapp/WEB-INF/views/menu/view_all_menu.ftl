<@content for="title">All menus</@content>

<div id="result"></div>
<#--<@link_to controller="menu" action="asd" method="get" destination="result"  >Get Books</@>-->
<#--<@link_to controller="books" action="fetch" destination="result" >Get Books</@>-->



<script type="text/javascript">
    function qqqq() {
        alert("qqq");
    }
    function qqq() {
        $(document).ready(function () {
            $.ajax({
                url: '${context_path}/menu/get_weekly_menu_to_ajax',
                type: 'GET',
                dataType: 'json',
                success: function (data, textStatus) {
                }
            });
        });
    }


</script>

<button onclick="qqq()">qqq</button>