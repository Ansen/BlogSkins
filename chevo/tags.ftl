<#include "macro-head.ftl">
<!DOCTYPE html>
<html>
<head>
<@head title="${allTagsLabel} - ${blogTitle}">
<meta name="keywords" content="${metaKeywords},${allTagsLabel}"/>
<meta name="description" content="<#list tags as tag>${tag.tagTitle}<#if tag_has_next>,</#if></#list>"/>
</@head>
</head>
<body>
${topBarReplacement}
<#include "header.ftl">
<div class="clear"></div>
<div class="content">
<ul id="tags" class="tags">
<#list tags as tag>
<li>
    <a data-count="${tag.tagPublishedRefCount}"
       href="/tags/${tag.tagTitle?url('UTF-8')}" title="${tag.tagTitle}">
        <span>${tag.tagTitle}</span>
        (<b>${tag.tagPublishedRefCount}</b>)
    </a>
</li>
</#list>
</ul>
<hr align="center"/>
</div>
<#include "footer.ftl">
<script type="text/javascript">
common.buildTags();
</script>
</body>
</html>