<h3><a href="#">${zxwz}</a><a class="catrss" href="http://${blogHost}/blog-articles-feed.do" target="_blank"></a></h3>
<table class="listTable">
			<thead>
				<tr>
					<th width="150">${listime}</th>
					<td width="620">${listtitle}</td>
					<th width="70">${listviews}</th>
					<th width="60">${listcoms}</th>
				</tr>
			</thead>
<tbody>
<#list articles as article>
<tr>
<th>
<#if article.hasUpdated>
${article.articleUpdateDate?string("yyyy-MM-dd HH:mm:ss")}
<#else>
${article.articleCreateDate?string("yyyy-MM-dd HH:mm:ss")}
</#if></th>

<td>
<a <#if article.hasUpdated || article_index==0> 
style="background: url('/skins/chevo/images/otm-ico-new.png') no-repeat right 0 scroll  transparent;padding-right:30px;" <#else>
style="background: url('/skins/chevo/images/credit.png') no-repeat right 0 scroll  transparent;padding-right:20px;"
</#if>
href="${article.articlePermalink}" rel="bookmark" title="${article.articleTitle}">
${article.articleTitle}
</a>
<#if article.articlePutTop>
<sup class="tip">${topArticleLabel}</sup>
</#if>
</td>

<th>${article.articleViewCount}&nbsp;Hits</th>

<th>${article.articleCommentCount}&nbsp;comments</th>
</tr>
<div class="entry">${article.articleAbstract}</div>
</#list>
</tbody>
</table>

<#if 0 != paginationPageCount>

<p class="page">
${paginationCurrentPageNum}/${paginationPageCount}
<#if 1 != paginationPageNums?first>
<a class="current" href="${path}/1">1st</a>
<a href="${path}/${paginationPreviousPageNum}">${TitelNO1}</a>
</#if>
<#list paginationPageNums as paginationPageNum>
<#if paginationPageNum == paginationCurrentPageNum>
<span class="current">${paginationPageNum}</span>
<#else>
<a title="${paginationPageNum}" href="${path}/${paginationPageNum}">${paginationPageNum}</a>
</#if>
</#list>
<#if paginationPageNums?last != paginationPageCount>
<a href="${path}/${paginationNextPageNum}">${TitelNO}</a>
<a title="Last ${TitelNO}" href="${path}/${paginationPageCount}">Last ${TitelNO}</a>
</#if>
<#else>
</p>
<h3>Page not found</h3>
<p>Sorry, but you are looking for something that isn\'t here.</p>
</#if>