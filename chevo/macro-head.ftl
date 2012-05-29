<#macro head title>
<meta charset="utf-8" />
<title>${title}</title>
<#nested>
<meta http-equiv="Window-target" content="_top" />
<link href="/blog-articles-feed.do" title="ATOM" type="application/atom+xml" rel="alternate" />
<link rel="icon" type="image/png" href="/favicon.png" />
<link rel="canonical" href="http://${blogHost}" />
<link rel="stylesheet" type="text/css" href="/skins/${skinDirName}/css/style${miniPostfix}.css" media="all"/>
<#if "" == miniPostfix>
<script type="text/javascript" src="/js/lib/jquery/jquery.min.js" charset="utf-8"></script>
<#else>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js" charset="utf-8"></script>
</#if>
${htmlHead}
</#macro>