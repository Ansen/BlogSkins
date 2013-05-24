<#list articles as article>
<article class="post">
            <div class="info">
                <a rel="nofollow" href="${servePath}${article.articlePermalink}#comments">
            ${article.articleCommentCount}&nbsp;&nbsp;${commentLabel}
        </a>
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
                <h2>
                    <a href="${servePath}${article.articlePermalink}">${article.articleTitle}</a>
                </h2>
            </header>
            <div class="con">
                ${article.articleAbstract}
                <div class="tags">
                    <ul>
                        <#list article.articleTags?split(",") as articleTag>
                        <li>
                            <a href="${servePath}/tags/${articleTag?url('UTF-8')}">                ${articleTag}</a><#if articleTag_has_next>,</#if>
                        </li>
                        </#list>
                    <ul>
                </div>
            </div>
        </article>
</#list>