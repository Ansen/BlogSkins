<#include "macro-head.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${authorName} - ${blogTitle}">
        <meta name="keywords" content="${metaKeywords},${authorName}"/>
        <meta name="description" content="<#list articles as article>${article.articleTitle}<#if article_has_next>,</#if></#list>"/>
        </@head>
    </head>
    <body id="wrap">
        ${topBarReplacement}
        <div id="header">
            <#include "header.ftl">
        </div>
    <section id="content">
            <h2>${author1Label}${authorName}</h2>
            <#include "article-list.ftl">
    </section>
    <aside class="sidebar">
        <#include "side.ftl">
    </aside>
    <footer id="footer">
        <#include "footer.ftl">
    </footer>
    </body>
</html>