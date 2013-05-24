
<header id="blog_title"> 
    <h1>
        <a class="title" href="${servePath}">${blogTitle}</a>
    </h1>
    <span class="sub-title">${blogSubtitle}</span>
</header>
<nav id="menu">
    <ul class="header-nav">
            <li>
                <a rel="nofollow" href="${servePath}/">${indexLabel}</a>
            </li>
            <#list pageNavigations as page>
            <li>
                <a href="${page.pagePermalink}" target="${page.pageOpenTarget}">${page.pageTitle}</a>
            </li>
            </#list>  
            <li>
                <a href="${servePath}/tags.html">${allTagsLabel}</a>  
            </li>
            <li>
                <a rel="alternate" href="${servePath}/blog-articles-feed.do">Atom<img src="${staticServePath}/images/feed.png" alt="Atom"/></a>
            </li>
    </ul>
</nav>
<div class="clear"></div>