<#include "macro-head.ftl">
<#include "macro-comments.ftl">
<!DOCTYPE html>
<html>
<head>
<@head title="${page.pageTitle} - ${blogTitle}">
<meta name="keywords" content="${metaKeywords},${page.pageTitle}" />
<meta name="description" content="${metaDescription}" />
</@head>
</head>
<body id="bugDetail">
<#include "header.ftl">
<div class="content">
<p class="caption" ${page.pageContent}</p>
<@comments commentList=pageComments permalink=page.pagePermalink></@comments>
<#include "footer.ftl">
</div>
<@comment_script oId=page.oId></@comment_script>
</body>
</html>
