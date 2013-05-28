<#include "macro-head.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${blogTitle}">
        <meta name="keywords" content="${metaKeywords}"/>
        <meta name="description" content="<#list articles as article>${article.articleTitle}<#if article_has_next>,</#if></#list>"/>
        </@head>
    </head>
    <body>
        <div id="wrap">
                ${topBarReplacement}
                <div id="header">
                    <#include "header.ftl">
                </div>
            <section id="content">
                <#include "article-list.ftl">
            </section>
            <aside class="sidebar">
                <#include "side.ftl">
            </aside>
            <div class="clear"></div>
            <footer id="footer">
                <#include "footer.ftl">
            </footer>
        </div>
    </body>
</html>