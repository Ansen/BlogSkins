<#include "macro-head.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${notFoundLabel} - ${blogTitle}">
        <meta name="keywords" content="${notFoundLabel},${metaKeywords}"/>
        <meta name="description" content="${sorryLabel},${notFoundLabel},${metaDescription}"/>
        <meta name="robots" content="noindex, follow"/>
        </@head>
    </head>
    <body id="body">
        ${topBarReplacement}
        <div id="top-bar" style="width: 100%; "></div>
            <div id="wrapper">
            	<#include "header.ftl">
                <div id="main">
                	<div id="content">
                		<div class="post">
							<h2 class="post_title_h2">
								${sorryLabel} ${notFoundLabel}<br>
                                <a href="http://${blogHost}">${returnTo1Label}${blogTitle}</a>
							</h2>
							<div class="clear"></div>
							<div class="post_content">
                                <div align=center>
                                    <script type="text/javascript">
                                      var GOOG_FIXURL_LANG = 'zh-CN';
                                      var GOOG_FIXURL_SITE = '${blogHost}'
                                    </script>
                                    <script type="text/javascript"
                                      src="http://linkhelp.clients.google.com/tbproxy/lh/wm/fixurl.js">
                                    </script>
                                </div>
							</div>
							<div class="menu-mark"></div>
						</div>
					</div>
	                <div id="sidebar" class="widget-area">
	                	<#include "side.ftl">
	                </div>
	                <div class="clear"></div>
                </div>
                <div class="clear"></div>
                <#include "footer.ftl">
            </div>
            <div class="clear"></div>
            <div id="bottom-bar"></div>
    </body>
</html>