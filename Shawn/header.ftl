<div id="header">
    <h1 id="title">
        <a href="${servePath}">${blogTitle}</a>
    </h1>
    <h2 id="discription">${blogSubtitle}</h2>
    <ul class="nav" id="header-navi">
        <li>
            <a href="${servePath}/" title="${indexLabel}">${indexLabel}</a>
        </li>
        <li>
            <a href="${servePath}/tags.html">${allTagsLabel}</a>  
        </li>
        <#list pageNavigations as page>
        <li>
            <a href="${page.pagePermalink}" target="${page.pageOpenTarget}">${page.pageTitle}</a>
        </li>
        </#list>
    </ul>
    <div class="twitter" style="opacity: 0.7; "></div>
</div>
<hr />