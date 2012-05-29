<#macro comments commentList permalink>
<h3 class="detailTitle">${commentLabel}</h3>  
<div class="replys">
    <#if 0 == commentList?size>
    ${noCommentLabel}
    </#if>
    <ol class="replylist" id="comments">
        <li></li>
        <#list commentList as comment>
        <li class="reply clearfix" id="${comment.oId}">
            <div class="reply-content">
                <div class="reply-info">
                    <span class="addtime">
                        ${comment.commentDate?string("yyyy-MM-dd HH:mm:ss")} | 
                        <#if "http://" == comment.commentURL>
                        ${comment.commentName}
                        <#else>
                        <a href="${comment.commentURL}" target="_blank" rel="nofollow">${comment.commentName}</a>
                        </#if>
                        <#if comment.isReply>
                        @
                        <a href="${permalink}#${comment.commentOriginalCommentId}"
                           onmouseover="page.showComment(this, '${comment.commentOriginalCommentId}', 23);"
                           onmouseout="page.hideComment('${comment.commentOriginalCommentId}')">${comment.commentOriginalCommentName}</a>
                        </#if>
                    </span>
                </div>
                <div class="replylist-act">
                    <a class="replyBtn" href="javascript:replyTo('${comment.oId}');">${replyLabel}</a>
                </div>
                <div class="description">
                    <img alt="${comment.commentName}" src="${comment.commentThumbnailURL}"/>
                    <p> ${comment.commentContent}</p>
                </div>
            </div>
        </li>
        </#list>
    </ol>
</div>

<h3 class="detailTitle">
    ${postCommentsLabel}
</h3>

<div class="replys">
    <table id="commentForm" class="form">
        <tbody>
            <tr>
                <th>
                    ${commentName1Label}
                </th>
                <td colspan="2">
                    <input type="text" class="normalInput" id="commentName"/>
                </td>
            </tr>
            <tr>
                <th>
                    ${commentEmail1Label}
                </th>
                <td colspan="2">
                    <input type="text" class="normalInput" id="commentEmail"/>
                </td>
            </tr>
            <tr>
                <th>
                    ${commentURL1Label}
                </th>
                <td colspan="2">
                    <input type="text" id="commentURL"/>
                </td>
            </tr>
            <tr>
                <th>
                    ${commentEmotions1Label}
                </th>
                <td id="emotions">
                    <span class="em00" title="${em00Label}"></span>
                    <span class="em01" title="${em01Label}"></span>
                    <span class="em02" title="${em02Label}"></span>
                    <span class="em03" title="${em03Label}"></span>
                    <span class="em04" title="${em04Label}"></span>
                    <span class="em05" title="${em05Label}"></span>
                    <span class="em06" title="${em06Label}"></span>
                    <span class="em07" title="${em07Label}"></span>
                    <span class="em08" title="${em08Label}"></span>
                    <span class="em09" title="${em09Label}"></span>
                    <span class="em10" title="${em10Label}"></span>
                    <span class="em11" title="${em11Label}"></span>
                    <span class="em12" title="${em12Label}"></span>
                    <span class="em13" title="${em13Label}"></span>
                    <span class="em14" title="${em14Label}"></span>
                </td>
            </tr>
            <tr>
                <th valign="top">
                    ${commentContent1Label}
                </th>
                <td colspan="2">
                    <textarea rows="5" cols="58" id="comment"></textarea>
                </td>
            </tr>
            <tr>
                <th>
                    ${captcha1Label}
                </th>
                <td class="captcha">
                    <input type="text" class="normalInput" id="commentValidate"/>
                    <img id="captcha" alt="validate" src="/captcha.do" />
                </td>
                <th>
                    <span class="error-msg" id="commentErrorTip"></span>
                </th>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <button id="submitCommentButton" onclick="page.submitComment();">${submmitCommentLabel}</button>
                </td>
            </tr>
        </tbody>
    </table>
</div>
</#macro>

<#macro comment_script oId>
<script type="text/javascript" src="/js/page${miniPostfix}.js" charset="utf-8"></script>
<script type="text/javascript">
    var page = new Page({
        "nameTooLongLabel": "${nameTooLongLabel}",
        "mailCannotEmptyLabel": "${mailCannotEmptyLabel}",
        "mailInvalidLabel": "${mailInvalidLabel}",
        "commentContentCannotEmptyLabel": "${commentContentCannotEmptyLabel}",
        "captchaCannotEmptyLabel": "${captchaCannotEmptyLabel}",
        "loadingLabel": "${loadingLabel}",
        "oId": "${oId}",
        "skinDirName": "${skinDirName}",
        "blogHost": "${blogHost}",
        "randomArticles1Label": "${randomArticles1Label}",
        "externalRelevantArticles1Label": "${externalRelevantArticles1Label}"
    });

    var addComment = function (result, state) {
        var commentHTML = '<li></li><li class="reply clearfix" id="' + result.oId + 
            '"><div class="reply-content"> <div class="reply-info"><span class="addtime">' + 
            result.commentDate + "&nbsp;|&nbsp;" + result.replyNameHTML;

        if (state !== "") {
            var commentOriginalCommentName = $("#" + page.currentCommentId + " .addtime>a").first().text();
            commentHTML += '&nbsp;@&nbsp;<a href="' + result.commentSharpURL.split("#")[0] + '#' + page.currentCommentId + '"'
                + 'onmouseover="page.showComment(this, \'' + page.currentCommentId + '\', 23);"'
                + 'onmouseout="page.hideComment(\'' + page.currentCommentId + '\')">' + commentOriginalCommentName + '</a>';
        }

        commentHTML += '</span></div><div class="replylist-act"><a class="replyBtn" '
            + 'href="javascript:replyTo(\'' + result.oId + '\');">${replyLabel}</a>'
            + '</div><div class="description">'
            + '<img alt="' + $("#commentName" + state).val() + '" src="' + result.commentThumbnailURL + '"/>'
            + '<p>'
            + Util.replaceEmString($("#comment" + state).val().replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/\n/g,"<br/>"))
            + '</p></div></div></li>';
        return commentHTML;
    }

    var replyTo = function (id) {
        var commentFormHTML = "<table class='form comment-reply' id='replyForm'>";
        page.addReplyForm(id, commentFormHTML);
    };

    (function () {
        page.load();
        // emotions
        page.replaceCommentsEm("#comments .description>p");
            <#nested>
        })();
</script>
</#macro>