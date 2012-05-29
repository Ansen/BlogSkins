	<div id="header">
		<div id="logo">
			<a href="/" title="${blogTitle}" rel="home">${blogTitle}</a>
			<div id="description">${blogSubtitle}</div>
		</div>
		<div id="header_right">
			<div id="header_meta">
				<div id="header_search_area">
					<form action="http://www.google.com/cse" id="cse-search-box">
        				<div>
           					<input type="hidden" name="cx" value="partner-pub-6776264782593260:2266952709" />
            				<input type="hidden" name="ie" value="UTF-8" />
           					<input type="text" name="q" size="25" />
        				</div>
   					</form>
				</div>
				<a id="rss" rel="external nofollow" href="${blogHost}/blog-articles-feed.do" title="RSS FEED" ></a>
			</div>
			<div class="clear"></div>
			<div id="social">
				<div class="menu-default-container">
					<ul class="menu" id="menu-default">
						<li class="facebook"><a target="_blank" href="http://#">Facebook</a></li>
						<li class="twitter"><a target="_blank" href="http://#">Twitter</a></li>
						<li class="tencent"><a target="_blank" href="http://#">Twitter</a></li>
						<li class="gplus"><a target="_blank" href="http://#">Twitter</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="header_menu">
			<div class="menu-menu-container">
				<ul>
					<li>
						<a href="/">${indexLabel}</a>
					</li>
					<li>
						<a href="/tags.html">${allTagsLabel}</a>
					</li>
					 <#list pageNavigations as page>
					<li>
						<a href="${page.pagePermalink}">${page.pageTitle}</a>
					</li>
					</#list>
				</ul>
			</div>
		</div>
	</div>