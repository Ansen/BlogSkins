<#include "macro-head.ftl">
<!DOCTYPE html>
<html>
<head>
<@head title="${tag.tagTitle} - ${blogTitle}">
<meta name="keywords" content="${metaKeywords},${tag.tagTitle}"/>
<meta name="description" content="<#list articles as article>${article.articleTitle}<#if article_has_next>,</#if></#list>"/>
</@head>
</head>
<body>
<#include "header.ftl">
<div class="content">
<h2 class="pagetitle">
<a href="/tag-articles-feed.do?oId=${tag.oId}" class="feed-ico" target="_blank">
${tag1Label}
${tag.tagTitle}
</a>
(${tag.tagPublishedRefCount})
</h2>
<#include "article-list.ftl">
<#include "footer.ftl">
</div>
</body>
</html>
