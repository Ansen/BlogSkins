<#include "macro-head.ftl">
<#include "macro-comments.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${article.articleTitle} - ${blogTitle}">
        <meta name="keywords" content="${article.articleTags}" />
        <meta name="description" content="${article.articleAbstract?html}" />
        </@head>
    </head>
    <body id="wrap">
        ${topBarReplacement}
        <div id="header">
            <#include "header.ftl">
        </div>
    <section id="content">
<article class="post">
        <div class="info">
            ${article.articleCommentCount}&nbsp;&nbsp;${commentLabel}
        </div>
        <div class="date">
            <span class="day">
                <#if article.hasUpdated>
                ${article.articleUpdateDate?string("dd")}
                <#else>
                ${article.articleCreateDate?string("dd")}
                </#if>
            </span>
            <span class="time">
                <#if article.hasUpdated>
                ${article.articleUpdateDate?string("MM")}
                <#else>
                ${article.articleCreateDate?string("MM")}
                </#if>
            </span>
            <span class="year">
                <#if article.hasUpdated>
                ${article.articleUpdateDate?string("yyyy")}
                <#else>
                ${article.articleCreateDate?string("yyyy")}
                </#if>
            </span>
        </div>
        <header>
            <h2>${article.articleTitle}</h2>
        </header>
        <div class="con">
            ${article.articleContent}
            <#if "" != article.articleSign.signHTML?trim>
            <div>
                ${article.articleSign.signHTML}
            </div>
            </#if>
        </div>
    </article>
    <div class="postunder">
        <@comments commentList=articleComments article=article></@comments>
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