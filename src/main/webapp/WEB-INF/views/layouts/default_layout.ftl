<#setting url_escaping_charset='UTF-8'>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${context_path}/css/main.css" rel="stylesheet">
    <link href="${context_path}/css/bootstrap.css" rel="stylesheet">
    <link href="${context_path}/css/bootstrap_2.3.1/bootstrap.css" rel="stylesheet">
    <link href="${context_path}/css/bootstrap_2.3.1/bootstrap-responsive.css" rel="stylesheet">
    <link href="${context_path}/css/style.css" rel="stylesheet">
    <script src="${context_path}/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <title><@yield to="title"/>-eFood</title>
</head>
<body>
<div id="wrap">
<#include "header.ftl" >
    <div class="container">
    ${page_content}
    </div>

</div>

<#include "footer.ftl" >

<script src="${context_path}/js/bootstrap.js" type="text/javascript"></script>
<script src="${context_path}/js/bootstrap_2.3.1/bootstrap.js" type="text/javascript"></script>
<script src="${context_path}/js/aw.js" type="text/javascript"></script>
<script src="${context_path}/js/my_script.js" type="text/javascript"></script>
</body>
</html>