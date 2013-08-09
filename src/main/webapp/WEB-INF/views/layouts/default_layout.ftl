<#setting url_escaping_charset='ISO-8859-1'>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <LINK href="${context_path}/css/main.css" rel="stylesheet" type="text/css"/>
    <LINK href="${context_path}/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <script src="${context_path}/js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="${context_path}/js/bootstrap.js" type="text/javascript"></script>
    <script src="${context_path}/js/aw.js" type="text/javascript"></script>
    <title>ActiveWeb - <@yield to="title"/></title>
</head>
<body>
<div id="wrap">
<#include "header.ftl" >
    <div class="container">
    ${page_content}
    </div>

</div>

<#include "footer.ftl" >

</body>

</html>
