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
<body id="bugDetail">
<#include "header.ftl">
<div class="bread">
<div style="float:left">${weizhi}<a href="/">${footg}</a> >> <a href="/1">${indexLabel}</a> >> <#list article.articleTags?split(",") as articleTag><a href="/tags/${articleTag?url('UTF-8')}" rel="nofollow">${articleTag}</a><#if articleTag_has_next>&nbsp;,&nbsp;</#if></#list>
</div>
<div class="clear"></div>
<div class="content">
<script language="javascript">
$(function(){
    function getParamsOfShareWindow(width, height) {
        return ['toolbar=0,status=0,resizable=1,width=' + width + ',height=' + height + ',left=',(screen.width-width)/2,',top=',(screen.height-height)/2].join('');
    }

    function bindShareList() {
        var link = encodeURIComponent(document.location);
        var title = encodeURIComponent(document.title.substring(0,100));
        var source = encodeURIComponent('GeSong.org');
        var windowName = '${fxwz}';
        var site = 'http://www.gesong.org/';

        jQuery('#twitter-share').click(function() {
            var url = 'http://twitter.com/share?url=' + link + '&text=' + title;
            var params = getParamsOfShareWindow(500, 375);
            window.open(url, windowName, params);
        });

        jQuery('#douban-share').click(function() {
            var url = 'http://www.douban.com/recommend/?url=' + link + '&title=' + title;
            var params = getParamsOfShareWindow(450, 350);
            window.open(url, windowName, params);
        });

        jQuery('#sina-share').click(function() {
            var url = 'http://v.t.sina.com.cn/share/share.php?url=' + link + '&title=' + title;
            var params = getParamsOfShareWindow(607, 523);
            window.open(url, windowName, params);
        });

        jQuery('#netease-share').click(function() {
            var url = 'http://t.163.com/article/user/checkLogin.do?link=' + link + 'source=' + source + '&info='+ title + '[-_-] ' + link;
            var params = getParamsOfShareWindow(642, 468);
            window.open(url, windowName, params);
        });

        jQuery('#tencent-share').click(function() {
            var url = 'http://v.t.qq.com/share/share.php?title=' + title + '[-_-]&url=' + link + '&site=' + site;
            var params = getParamsOfShareWindow(634, 668);
            window.open(url, windowName, params);
        });
    }

    bindShareList();
});
</script>
<h2 style="text-align:center; font-size:16px"><a class="article-title" href="${article.articlePermalink}">
${article.articleTitle}
</a></h2>
<hr align="center"/>
<h3>${riqi}<#if article.hasUpdated>
${article.articleUpdateDate?string("yyyy-MM-dd HH:mm:ss")}
<#else>
${article.articleCreateDate?string("yyyy-MM-dd HH:mm:ss")}
</#if></h3>

<h3>${hits}${article.articleViewCount} Hits</h3>
<h3>${pinglun}${article.articleCommentCount}&nbsp;comments</h3>
<h3>${laizi}<a href="http://${blogHost}">${footg}</a></h3>
		<h3><div id="share">
		    ${fxwz} - 
		    <a rel="nofollow" id="tencent-share" title="${txwb}">${txwb}</a>
		    <a rel="nofollow" id="sina-share" title="${xlwb}">${xlwb}</a>
		    <a rel="nofollow" id="twitter-share" title="Twitter">Twitter</a>
		    <a rel="nofollow" id="netease-share" title="${wywb}">${wywb}</a>
		    <a rel="nofollow" id="douban-share" title="${douban}">${douban}</a>
		</div></h3>
<hr align="center"/>
<h3 class="detailTitle">${wzqw}</h3>
${article.articleContent}
<#if "" != article.articleSign.signHTML?trim>
<p>${article.articleSign.signHTML}</p>
</#if>
<hr align="center"/>
<@comments commentList=articleComments permalink=article.articlePermalink></@comments>
<#include "footer.ftl">
<@comment_script oId=article.oId>
page.tips.externalRelevantArticlesDisplayCount = "${externalRelevantArticlesDisplayCount}";
</@comment_script>
</div>
</body>
</html>