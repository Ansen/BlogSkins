<aside class="left ver_side">
        <form id="searchform" target="_blank" method="get" action="http://www.google.com/search">
            <fieldset class="opaque_10">
                <input id="s" class="search icon" type="text" name="q" />
                <input type="submit" id="searchsubmit" class="button" value="${Search}" />
                <input type="hidden" name="oe" value="UTF-8" />
                <input type="hidden" name="ie" value="UTF-8" />
                <input type="hidden" name="newwindow" value="0" />
                <input type="hidden" name="sitesearch" value="www.ansen.org" />
            </fieldset>
        </form>
    <div class="hor_side"></div>
    <#if "" != noticeBoard>
    <div class="widget hor_side">
        <h3><span>${noticeBoardLabel}</span></h3><div>
            <span>${noticeBoard}</span>
        </div>
    </div>
    </#if>
    <#if 0 != mostViewCountArticles?size>
    <div class="widget hor_side">
        <h3><span>${mostViewCountArticlesLabel}</span></h3><ul>
            <#list mostViewCountArticles as article>
            <li>
                <a href="${article.articlePermalink}" title="${article.articleTitle}">${article.articleTitle} - ${article.articleViewCount}</a>
            </li>
            </#list>
        </ul>
    </div>
    </#if>
    <#if 0 != mostCommentArticles?size>
    <div class="widget hor_side">
        <h3><span>${mostCommentArticlesLabel}</span></h3><ul>
            <#list mostCommentArticles as article>
            <li>
                <a href="${article.articlePermalink}" title = "${article.articleTitle}">${article.articleTitle} - ${article.articleCommentCount}</a>
            </li>
            </#list>
        </ul>
    </div>
    </#if>
    <#if 0 != mostUsedTags?size>
    <div class="widget hor_side">
        <#list mostUsedTags as tag>
        <a data-count="${tag.tagPublishedRefCount}" href="/tags/${tag.tagTitle?url('UTF-8')}" class="tag-link-37" title="${tag.tagPublishedRefCount} 个话题" style="font-size: 14.75px;">${tag.tagTitle}</a>
        </#list>
    </div>
    </#if>
    <#if 0 != recentComments?size>
    <div class="widget hor_side">
        <h3><span>${recentCommentsLabel}</span></h3>
        <ul id="recentComments">
            <#list recentComments as comment>
            <li class="r_item">
                <div class="row">
                    <span class="r_name">
                        <a href="${comment.commentSharpURL}">${comment.commentName}</a>
                    </span>
                    <br>
                    <span class="r_excerpt" title="${comment.commentContent}">${comment.commentContent}</span>
                </div>
            </li>
            </#list>
        </ul>
    </div>
    </#if>
    <#if 0 != archiveDates?size>
    <div class="widget hor_side">
        <h3><span>${archiveLabel}</span></h3>
        <ul id="archiveSide">
            <#list archiveDates as archiveDate>
            <li data-year="${archiveDate.archiveDateYear}">
                <#if "en" == localeString?substring(0, 2)>
                <a href="/archives/${archiveDate.archiveDateYear}/${archiveDate.archiveDateMonth}"
                   title="${archiveDate.monthName} ${archiveDate.archiveDateYear}(${archiveDate.archiveDatePublishedArticleCount})">
                    ${archiveDate.monthName} ${archiveDate.archiveDateYear}</a>(${archiveDate.archiveDatePublishedArticleCount})
                <#else>
                <a href="/archives/${archiveDate.archiveDateYear}/${archiveDate.archiveDateMonth}"
                   title="${archiveDate.archiveDateYear} ${yearLabel} ${archiveDate.archiveDateMonth} ${monthLabel}(${archiveDate.archiveDatePublishedArticleCount})">
                    ${archiveDate.archiveDateYear} ${yearLabel} ${archiveDate.archiveDateMonth} ${monthLabel}</a>(${archiveDate.archiveDatePublishedArticleCount})
                </#if>
            </li>
            </#list>
        </ul>
    </div>
    </#if>
</aside>