<div class="sidebar-fixed" style="position: fixed; top: 20px;">
        <#if "" != noticeBoard>
    <div class="block">
        <h3>${noticeBoardLabel}</h3>
        <div>${noticeBoard}</div>
    </div>
    </#if>

    <#if 0 != mostCommentArticles?size>
    <div class="block">
        <h3>${mostCommentArticlesLabel}</h3> 
        <ul>
            <#list mostCommentArticles as article>
                <li>
                    <a title="${article.articleTitle}" href="${article.articlePermalink}">${article.articleTitle}</a>
                </li>
            </#list>
        </ul> 
    </div>
    </#if>
<div class="clear"></div>
    <#if 0 != recentComments?size>
    <div class="block">
        <h3>${recentCommentsLabel}</h3> 
        <ul>
            <#list recentComments as comment>
                <li>
                    <a target="_blank" title="${comment.commentContent}" href="${servePath}${comment.commentSharpURL}">${comment.commentName}:${comment.commentContent}</a>
                </li>
            </#list>
        </ul> 
    </div>
    </#if>
<div class="clear"></div>
    <#if 0 != mostViewCountArticles?size>
    <div class="block">
        <h3>${mostViewCountArticlesLabel}</h3> 
        <ul>
            <#list mostViewCountArticles as article>
                <li>
                    <a target="_blank" title="${article.articleTitle}" href="${article.articlePermalink}">${article.articleTitle}</a>
                </li>
            </#list>
        </ul> 
    </div>
    </#if>
<div class="clear"></div>
    <#if 0 != mostUsedTags?size>
    <div class="block">
        <h3>${popTagsLabel}</h3> 
        <ul>
            <#list mostUsedTags as tag>
                <li>
                    <a data-count="${tag.tagPublishedRefCount}"
                       href="${servePath}/tags/${tag.tagTitle?url('UTF-8')}" title="${tag.tagTitle}(${tag.tagPublishedRefCount})">
                        <span>${tag.tagTitle}</span>
                    </a>
                </li>
            </#list>
        </ul> 
    </div>
    </#if>
<div class="clear"></div>
    <#if 0 != links?size>
        <div class="block links bicolumn">
            <h3>${linkLabel}</h3> 
            <ul> 
                <#list links as link>
                    <li><a href="${link.linkAddress}" title="${link.linkTitle}" target="_blank">${link.linkTitle}</a></li>
                </#list>
            </ul>
        </div>
    </#if>
    <#if 0 != archiveDates?size>
    <div class="block bicolumn block-s">
        <h3>${archiveLabel}</h3> 
            <ul> 
                <#list archiveDates as archiveDate>
                <li data-year="${archiveDate.archiveDateYear}">
                    <#if "en" == localeString?substring(0, 2)>
                    <a href="${servePath}/archives/${archiveDate.archiveDateYear}/${archiveDate.archiveDateMonth}"
                       title="${archiveDate.monthName} ${archiveDate.archiveDateYear}(${archiveDate.archiveDatePublishedArticleCount})">
                        ${archiveDate.monthName} ${archiveDate.archiveDateYear}</a>(${archiveDate.archiveDatePublishedArticleCount})
                    <#else>
                    <a href="${servePath}/archives/${archiveDate.archiveDateYear}/${archiveDate.archiveDateMonth}"
                       title="${archiveDate.archiveDateYear} ${yearLabel} ${archiveDate.archiveDateMonth} ${monthLabel}(${archiveDate.archiveDatePublishedArticleCount})">
                        ${archiveDate.archiveDateYear} ${yearLabel} ${archiveDate.archiveDateMonth} ${monthLabel}</a>(${archiveDate.archiveDatePublishedArticleCount})
                    </#if>
                </li>
                </#list>
            </ul> 
    </div>
    </#if>
<div class="clear"></div>
<div class="block" style="margin-top:20px;">
    <form action="/search" class="head-search" method="get">
        <input id="search-input" type="text" name="s" class="inputbox" value="搜索..." onfocus="if (value =='搜索...'){value =''}" onblur="if (value ==''){value='搜索...'}" x-webkit-speech="" lang="zh-CN">
    </form>
</div>
<div class="clear"></div> 
</div>