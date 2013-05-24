<#include "macro-head.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${allTagsLabel} - ${blogTitle}">
        <meta name="keywords" content="${metaKeywords},${allTagsLabel}"/>
        <meta name="description" content="<#list tags as tag>${tag.tagTitle}<#if tag_has_next>,</#if></#list>"/>
        </@head>
    </head>
    <body id="wrap">
        ${topBarReplacement}
        <div id="header">
            <#include "header.ftl">
        </div>
    <section id="content">
        <ul id="tags" class="tags">
            <#list tags as tag>
            <li>
                <a rel="tag" data-count="${tag.tagPublishedRefCount}"
                   href="${servePath}/tags/${tag.tagTitle?url('UTF-8')}" title="${tag.tagTitle}">
                    <span>${tag.tagTitle}</span>
                    (<b>${tag.tagPublishedRefCount}</b>)
                </a>
            </li>
            </#list>
        </ul>
    </section>
    <aside class="sidebar">
        <#include "side.ftl">
    </aside>
    <footer id="footer">
        <#include "footer.ftl">
    </footer>
    </body>
</html>