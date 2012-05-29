<div id="sidebar">
    <ul>
        <li class="rssfeed">
            <a rel="external nofollow" href="http://feed.gesong.org/" title="${FeedaDDress}">
                <img src="/skins/${skinDirName}/images/rss.gif" width="64" height="64" alt="Subscribe" style="opacity: 0.7; " />
            </a> 
            <a rel="external nofollow" href="http://fusion.google.com/add?feedurl=http://${blogHost}/blog-articles-feed.do" title="Google Reader">
                <span style="color:#1B4EBE">G</span><span style="color:#D42609">o</span><span style="color:#E8B801">o</span><span style="color:#1B4EBE">g</span><span style="color:#1DA224;font-size:13px">l</span><span style="color:#D42609">e</span>
            </a> | 
            <a rel="external nofollow" href="http://www.xianguo.com/subscribe.php?url=http://${blogHost}/blog-articles-feed.do" title="${XianGuoReader}">
                <span style="color:#ff6600">${XianGuo}</span>
            </a>
        </li>
    </ul>
	 <#if "" != noticeBoard>
    <ul>
        <li>
            <span class="side">&nbsp;~&nbsp;Notice</span>
            <ul>
                <span>${noticeBoard}</span>
            </ul>
        </li>
    </ul>
    </#if>
    <#if 0 != mostViewCountArticles?size>
    <ul>
        <li>
            <span class="side">~Hot</span>
            <ul>
                <#list mostViewCountArticles as article>
                <li>
                    <a href="${article.articlePermalink}" title="${article.articleTitle}">${article.articleTitle}</a>
                </li>
                </#list>
            </ul>
        </li>
    </ul>
    </#if>
    <#if 0 != mostUsedTags?size>
    <ul>
        <li>
            <span class="side">&nbsp;~&nbsp;Tags&nbsp;&nbsp;&nbsp;</span>
            <ul id="widget_tag_cloud">
                <#list mostUsedTags as tag>
                <a data-count="${tag.tagPublishedRefCount}" title="${tag.tagTitle}(${tag.tagPublishedRefCount})" 
                   href="/tags/${tag.tagTitle?url('UTF-8')}">${tag.tagTitle}</a>
                </#list>
            </ul>
            <!-- color tag -->
            <script type="text/javascript">
                $("#widget_tag_cloud a").each(function (i) {
                    this.style.color = randomColor()
                });
                function randomColor() {
                    var arrHex = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"];
                    var strHex = "#";
                    var index;
                    for (var i = 0; i < 6; i++) {
                        index = Math.round(Math.random() * 15);
                        strHex += arrHex[index];
                    }
                    return strHex;
                }
    
            </script>
        </li>
    </ul>
    </#if>
    <#if 0 != mostCommentArticles?size>
    <ul>
        <li>
            <span class="side">&nbsp;~&nbsp;Most</span>
            <ul>
                <#list mostCommentArticles as article>
                <li>
                    <a href="${article.articlePermalink}" title = "${article.articleTitle}">${article.articleTitle}</a>
                </li>
                </#list>
            </ul>
        </li>
    </ul>
    </#if>
	<#if 0 != recentComments?size>
    <ul>
        <li>
            <span class="side">~Comments</span>
            <ul>
                <#list recentComments as comment>
                <li class="commentsli">                        
                    ${comment.commentName}&nbsp;&nbsp;<a href="${comment.commentSharpURL}" title="${comment.commentContent}">${comment.commentContent}</a>
                </li>
                </#list>
            </ul>
        </li>
    </ul>
    </#if>
    <#if 0 != links?size>
    <ul>
        <li>
            <span class="side">&nbsp;~&nbsp;Links</span>
            <ul class="outter">
                <#list links as link>
                <li style="opacity: 0.7;">
                    <a href="${link.linkAddress}" title ="${link.linkDescription}" style="background:url(/skins/Shawn/images/tco.gif) no-repeat -86px -470px;padding:2px 0 2px 20px" target="_blank">${link.linkTitle}</a>
                </li>
                </#list>
            </ul>
        </li>
    </ul>
    </#if>
    <#if 0 != archiveDates?size>
    <ul>
        <li>
            <span class="side">&nbsp;~&nbsp;Archives</span>
            <ul>
                <#list archiveDates as archiveDate>
                <li>
                    <#if "en" == localeString?substring(0, 2)>
                    <a href="/archives/${archiveDate.archiveDateYear}/${archiveDate.archiveDateMonth}" title="${archiveDate.monthName} ${archiveDate.archiveDateYear}(${archiveDate.archiveDatePublishedArticleCount})">${archiveDate.monthName} ${archiveDate.archiveDateYear}</a>(${archiveDate.archiveDatePublishedArticleCount})
                    <#else>
                    <a href="/archives/${archiveDate.archiveDateYear}/${archiveDate.archiveDateMonth}" title="${archiveDate.archiveDateYear} ${yearLabel} ${archiveDate.archiveDateMonth} ${monthLabel}(${archiveDate.archiveDatePublishedArticleCount})">${archiveDate.archiveDateYear} ${yearLabel} ${archiveDate.archiveDateMonth} ${monthLabel}</a>(${archiveDate.archiveDatePublishedArticleCount})
                    </#if>
                </li>
                </#list>
            </ul>
        </li>
    </ul>
    </#if>
</div>
<div class="clear"></div>