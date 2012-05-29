<#include "macro-head.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${notFoundLabel} - ${blogTitle}">
        <meta name="keywords" content="${notFoundLabel},${metaKeywords}"/>
        <meta name="description" content="${sorryLabel},${notFoundLabel},${metaDescription}"/>
        <meta name="robots" content="noindex, follow"/>
        </@head>
		<link rel="stylesheet" type="text/css" href="/skins/${skinDirName}/css/style${miniPostfix}.css?${staticResourceVersion}" media="all" />
    </head>
    <body id="blog">
		<div id="wrap">
			<#include "header-articel.ftl">
			<div id="content" class="clear">
				<div id="main" class="left">
					<article id="post" class="clear">
						<div align=center>
						<h3>${sorryLabel} ${notFoundLabel}</h3><br /><br />
						<h3><a href="http://${blogHost}"><span>${returnTo1Label}${blogTitle}</span></a></h3><br />
						<h3>OR</h3><br />
						<script type="text/javascript">
						  var GOOG_FIXURL_LANG = 'zh-CN';
						  var GOOG_FIXURL_SITE = 'http://www.ansen.org'
						</script>
						<script type="text/javascript"
						  src="http://linkhelp.clients.google.com/tbproxy/lh/wm/fixurl.js">
						</script>
						</div>
					</article>
				</div>
				<#include "side.ftl">
			</div>
			<#include "footer.ftl">
		</div>
    </body>
</html>	