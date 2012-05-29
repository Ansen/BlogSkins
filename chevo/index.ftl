<#include "macro-head.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${blogTitle}">
        <meta name="keywords" content="${metaKeywords}"/>
        <meta name="description" content="<#list articles as article>${article.articleTitle}<#if article_has_next>,</#if></#list>"/>
        </@head>
    </head>
    <body>
        <div id="page">
            <#include "header.ftl">
            <style>
                <!--
                #scroll_box { float:right; text-align:right; margin:0 15px 0 0; padding:0px; height:24px; overflow:hidden }
                #scroll_box li { list-style:none; line-height:24px }
                -->
            </style>
            <div class="bread">
                <div style="float:left">${weizhi}<a href="/">${footg}</a> >> <a href="/1">${indexLabel}</a>
                </div>

                <#if 0 != archiveDates?size>
                <ul id="scroll_box">
                    <#list archiveDates as archiveDate>
                    <#if "en" == localeString?substring(0, 2)>
                    <li><a href="/archives/${archiveDate.archiveDateYear}/${archiveDate.archiveDateMonth}" title="${archiveDate.monthName} ${archiveDate.archiveDateYear}(${archiveDate.archiveDatePublishedArticleCount})">${archiveDate.monthName} ${archiveDate.archiveDateYear}</a>(${archiveDate.archiveDatePublishedArticleCount})
                    </li>
                    <#else>
                    <li>
                        <a href="/archives/${archiveDate.archiveDateYear}/${archiveDate.archiveDateMonth}" title="${archiveDate.archiveDateYear} ${yearLabel} ${archiveDate.archiveDateMonth} ${monthLabel}(${archiveDate.archiveDatePublishedArticleCount})">${archiveDate.archiveDateYear} ${yearLabel} ${archiveDate.archiveDateMonth} ${monthLabel}</a>(${archiveDate.archiveDatePublishedArticleCount})</li>
                    </#if>
                    </#list>
                </ul>
                </#if>
                <div class="clear"></div>
            </div>
            <div class="content">
                <ul class="zoneList">
                    <li class="current"><a href="#">${hotbox}</a></li>
                    <li><a href="#">${mostbox}</a></li>
                    <li><a href="#">${combox}</a></li>
                    <li><a href="#">${tagbox}</a></li>
                </ul>

                <div class="hot">
                    <div class="scrollContent">
                        <#if 0 != mostViewCountArticles?size>
                        <div class="hotContent">
                            <ul class="listTable">
                                <#list mostViewCountArticles as article>
                                <li>
                                    <a href="${article.articlePermalink}" title="${article.articleTitle}">
                                        ${article.articleTitle}
                                    </a>
                                    ${article.articleViewCount}&nbsp;Hits
                                </li>
                                </#list>
                            </ul>
                            <div class="clear"></div>
                        </div>
                        </#if>

                        <#if 0 != mostCommentArticles?size>
                        <div class="hotContent">
                            <ul class="listTable">
                                <#list mostCommentArticles as article>
                                <li>
                                    <a href="${article.articlePermalink}" title="${article.articleTitle}">
                                        ${article.articleTitle}
                                    </a>
                                    ${article.articleViewCount}&nbsp;Hits
                                </li>
                                </#list>
                            </ul>
                            <div class="clear"></div>
                        </div>
                        </#if>

                        <#if 0 != recentComments?size>
                        <div class="hotContent">
                            <ul class="listTable">
                                <#list recentComments as comment>
                                <li>
                                    <a href="${comment.commentSharpURL}" title="${comment.commentContent}">
                                        ${comment.commentContent}
                                    </a>
                                    ${comment.commentName}
                                </li>
                                </#list>
                            </ul>
                            <div class="clear"></div>
                        </div>
                        </#if>

                        <#if 0 != mostUsedTags?size>
                        <div class="hotContent">
                            <ul class="listTable">
                                <#list mostUsedTags as tag>
                                <li>
                                    <a data-count="${tag.tagPublishedRefCount}" 
                                       title="${tag.tagTitle}(${tag.tagPublishedRefCount})"
                                       href="/tags/${tag.tagTitle?url('UTF-8')}">
                                        ${tag.tagTitle}
                                    </a>
                                    ${tag.tagPublishedRefCount}
                                </li>
                                </#list>
                            </ul>

                            <div class="clear"></div>
                        </div>
                        </#if>
                    </div>
                    
                </div>

                <div id="content">
                    <#include "article-list.ftl">
                </div>
                <#include "footer.ftl">
            </div>
        </div>
        <script type="text/javascript">
                
            var o=document.getElementById('scroll_box');
            //setInterval(function(){scrollup(o,24,0)},3000); 
            function scrollup(o,d,c){
                if(d==c){
                    var t=getFirstChild(o.firstChild).cloneNode(true);
                    o.removeChild(getFirstChild(o.firstChild));
                    o.appendChild(t);
                    t.style.marginTop="0px";
                }else{
                    c+=2;
                    getFirstChild(o.firstChild).style.marginTop=-c+"px";
                    window.setTimeout(function(){scrollup(o,d,c)},20);
                }
            }
            function getFirstChild(node){
                while(node.nodeType!=1){
                    node=node.nextSibling;
                }
                return node;
            }
                    
            $(function(){
                var count = $("div.hotContent").size();
                $("div.scrollContent").height(120*count);
                $(".listTable li").hover(function(){
                    $(this).css("background","#EBEBEB");
                },function(){
                    $(this).css("background","none");
                });
                $("ul.zoneList li").click(function(){
                    var i = $(this).index("ul.zoneList li");
                    $(this).addClass("current")
                    .siblings().removeClass("current");
                    $("div.scrollContent").stop(true,false).animate({
                        "top" : -120*i +"px"
                    },500);
                });
                // var t = setInterval("autoScroll()",5000);
                $("ul.zoneList,.hotContent").hover(function(){
                    // clearInterval(t);
                },function(){
                    //    t = setInterval("autoScroll()",5000);
                });
            });
            var k = 0;
            
            function autoScroll() {
                var n = $("div.hotContent").size();
                k = (k >=(n -1)) ? 0:++k;
                $("ul.zoneList li").eq(k).trigger("click");
            }
        </script>
    </body>
</html>
