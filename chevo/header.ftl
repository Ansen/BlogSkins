	<div class="banner">
		<div class="logo">
		<h1>${blogTitle}</h1>
		<div class="weibo"><a target="_blank" href="http://t.qq.com/andyxs">@andyxs</a></div></div>
				<div class="login">
					<a href="/login">Login</a>&nbsp;&nbsp;&nbsp;
				</div>
				</div>
<div class="nav">
		<ul>
<li>
<a href="/1" title="${indexLabel}">${indexLabel}</a>
</li>
<#list pageNavigations as page>
<li>
<a href="${page.pagePermalink}">${page.pageTitle}</a>
</li>
</#list>
<li>
<a href="/tags.html">${allTagsLabel}</a>  
</li>
		</ul>
        <form action="http://www.google.com/cse" target="_blank" method="get" id="searchbox">
		<input type="hidden" name="cx" value="010335913100646491589:rxiiiza_zns" />
            <input type="text" name="q" id="search_input" />
           <input type="submit" value=" " id="search_button" />
        </form>
	</div>
