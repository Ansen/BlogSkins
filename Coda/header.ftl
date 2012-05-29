<div id="maptitle">
    <h1><a href="/">${blogTitle}</a></h1>
    <h3>${blogSubtitle}</h3>
</div>
<div id="mapmenu" class="clear">
    <ul>
        <li>
            <a href="/" title="${indexLabel}">${indexLabel}</a>
        </li>
        <li>
            <a href="/tags.html">${allTagsLabel}</a>  
        </li>
        <#list pageNavigations as page>
        <li>
            <a href="${page.pagePermalink}">${page.pageTitle}</a>
        </li>
        </#list>
    </ul>
</div>
