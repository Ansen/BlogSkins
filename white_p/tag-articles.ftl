<#include "macro-head.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${tag.tagTitle} - ${blogTitle}">
        <meta name="keywords" content="${metaKeywords},${tag.tagTitle}"/>
        <meta name="description" content="<#list articles as article>${article.articleTitle}<#if article_has_next>,</#if></#list>"/>
        </@head>
    </head>
    <body id="wrap">
        ${topBarReplacement}
        <div id="header">
            <#include "header.ftl">
        </div>
    <section id="content">
        <h2>
            <a rel="alternate" href="${servePath}/tag-articles-feed.do?oId=${tag.oId}" class="feed-ico">
                ${tag1Label}
                ${tag.tagTitle}
                (${tag.tagPublishedRefCount})
            </a>
        </h2>
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