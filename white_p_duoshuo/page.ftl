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
    <body id="wrap">
        ${topBarReplacement}
        <div id="header">
            <#include "header.ftl">
        </div>
    <section id="content">
        <article class="post">
                <header>
                    <h2>${page.pageTitle}</h2>
                </header>
                <div class="con">
                    ${page.pageContent}
                </div>
            </article>
            <div class="postunder">
                <div id="comments">
                    <@comments commentList=pageComments article=page></@comments>
                </div>
            </div>
    </section>
    <aside class="sidebar">
        <#include "side.ftl">
    </aside>
    <footer id="footer">
        <#include "footer.ftl">
    </footer>
    </body>
</html>