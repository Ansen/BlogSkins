$("#share ul").css({
    "display": "none",
    "top": "-225px",
    "opacity": "0"
});
$(".commentlist li cite a,.outter a").attr("href", 
    function() {
        var domain_const = "{{blog.domain}}".substring(0, 7) + "";
        return this.href.replace(domain_const, "")//your domain#####################
    });
$(".commentlist li cite a[href='http://']").each(function() {
    $(this).replaceWith("<span style='color:#444;border-bottom:1px dotted #aaa'>" + $(this).text() + "</span>")
});
$(document).ready(function() {
    //$("#header").html($("#headerf").html());
    //$(".timeta").html($(".meta").html());
    
    // set selected navi
    $("#header-navi li").each(function () {
        var $a = $(this).find("a");
        console.log($a.attr("href"));
        if ($a.attr("href") === latkeConfig.servePath + location.pathname) {
            $(this).addClass("current_page_item");
        } else if (/\/[0-9]+$/.test(location.pathname)) {
            $("#header-navi li")[0].className = "current_page_item";
        }
    });
        
    if ($("input#author:has[value]").length > 0) {
        $("div.friendly").css("display", "none");
        $(".authorgra").css("display", "block");
        var A = '<span style="padding:0 5px;font:bold 10px verdana;color:#888;cursor:pointer;letter-spacing:0" class="infoeditor">(Edit)</span>';
        $("div#respond").append(A);
        $(".infoeditor").toggle(function() {
            $(".friendly").fadeIn();
            $(".authorgra").css("display", "none")
        },
        function() {
            $(".friendly").css("display", "none");
            $(".authorgra").fadeIn()
        })
    }
    $(".twitter").click(function() {
        window.open("http://twitter.com/ansenorg");
        return false
    })
    Util.setTopBar();
})
function hidetoolbar(){
    $("#wgToolBar").slideUp(600,function(){
        $("#showtoolbar").slideDown(600)
    })
}
function showtoolbar(){
    $("#showtoolbar").slideUp(600,function(){
        $("#wgToolBar").slideDown(600)
    })
}
// 点击暧昧文章
var showRelatedul = function (id, label, tags) {
    var $relatedul = $("#relatedul");
    if ($relatedul.hasClass("hidden")) {
        if ($("#randomArticles").html() === "") {
            page.loadRandomArticles();
            page.loadRelevantArticles(id, label);
            if (page.tips.externalRelevantArticlesDisplayCount !== 0) {
                page.loadExternalRelevantArticles(tags);
            }
        }
        $relatedul.slideDown().removeClass("hidden");
    } else {
        $relatedul.slideUp().addClass("hidden");
    }
}
var Util = {
    /**
     * @description 检测页面错误
     */
    error: function () {
        $("#tipMsg").text("Error: " + arguments[0] +
            " File: " + arguments[1] + "\nLine: " + arguments[2] +
            " please report this issue on https://github.com/b3log/b3log-solo/issues/new");
        $("#loadMsg").text("");
    },
        
    /**
     * @description 非 IE6/7 的浏览器，跳转到 kill-browser 页面
     */
    killIE: function () {
        if ($.browser.msie) {
            // kill IE6 and IE7
            if ($.browser.version === "6.0" || $.browser.version === "7.0") {
                window.location = "/kill-browser.html";
                return;
            }
            
            // 后台页面 kill 360 
            if (window.external && window.external.twGetRunPath) {
                var path = external.twGetRunPath();
                if(path && path.toLowerCase().indexOf("360se") > -1 && 
                    window.location.href.indexOf("admin-index") > -1) {
                    window.location = "/kill-browser.html";
                    return; 
                }
            }
        }
    },
    
    /**
     * @description 替换[emXX] 为图片
     * @param {String} str 替换字符串
     * @returns {String} 替换后的字符
     */
    replaceEmString: function (str) {
        var commentSplited = str.split("[em");
        if (commentSplited.length === 1) {
            return str;
        }
        
        str = commentSplited[0];
        for (var j = 1; j < commentSplited.length; j++) {
            var key = commentSplited[j].substr(0, 2);
            str += "<img src='" + latkeConfig.staticServePath + "/skins/" +
            Label.skinDirName + "/images/emotions/em" + key + ".png' alt='" +
            Label["em" + key + "Label"] + "' title='" +
            Label["em" + key + "Label"] + "'/>" + commentSplited[j].substr(3);
        }
        return str;
    },
    
    /**
     * @description URL 没有协议头，则自动加上 http://
     * @param {String} url URL 地址
     * @returns {String} 添加后的URL
     */
    proessURL: function (url) {
        if (!/^\w+:\/\//.test(url)) {
            url = "http://" + url;
        }
        return url;
    },
    
    /**
     * @description 切换到手机版
     * @param {String} skin 切换前的皮肤名称
     */
    switchMobile: function (skin) {
        Cookie.createCookie("btouch_switch_toggle", skin, 365);
        setTimeout(function () {
            location.reload();
        }, 1250); 
    },
    
    /**
     * @description topbar 相关事件
     */
    setTopBar: function () {
        var $top = $("#top");
        if ($top.length === 1) {
            var $showTop = $("#showTop");
            
            $showTop.click(function () {
                $top.slideDown();
                $showTop.hide();
            })
            
            $("#hideTop").click(function () {
                $top.slideUp();
                $showTop.show();
            });
        }
    },
    
    /**
     * @description 回到顶部
     */
    goTop: function () {
        var acceleration = acceleration || 0.1;

        var y = $(window).scrollTop();
        var speed = 1 + acceleration;
        window.scrollTo(0, Math.floor(y / speed));

        if (y > 0) {
            var invokeFunction = "Util.goTop(" + acceleration + ")";
            window.setTimeout(invokeFunction, 16);
        }
    },
    
    /**
     * @description 回到底部
     */
    goBottom: function (bottom) {
        if (!bottom) {
            bottom = 0;
        }
        window.scrollTo(0, $("body").height() - $(window).height() - bottom);
    },
    
    /**
     * @description 页面初始化执行的函数 
     */
    init: function () {
        //window.onerror = Util.error;
        Util.setTopBar();
    },

    /**
     * @description topbar 清除缓存按钮事件
     */
    clearCache: function (all) {
        var data = {};
        if (all === "all") {
            data = {
                "all": "all",
                "URI": ""
            };
        } else {
            data = {
                "all": "",
                "URI": window.location.pathname
            };
        }
        
        $.ajax({
            type: "POST",
            url: latkeConfig.servePath + "/clear-cache.do",
            cache: false,
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function(result){
                window.location.reload();
            }
        });
    },

    /**
     * @description 替换侧边栏表情为图片
     * @param {Dom} comments 评论内容元素
     */
    replaceSideEm: function (comments) {
        for (var i = 0; i < comments.length; i++) {
            var $comment = $(comments[i]);
            $comment.html(Util.replaceEmString($comment.html()));
        }
    },
    
    /**
     * @description 根据 tags，穿件云效果
     * @param {String} [id] tags 根元素 id，默认为 tags
     */
    buildTags: function (id) {
        id = id || "tags";
        
        // 根据引用次数添加样式，产生云效果
        var classes = ["tags1", "tags2", "tags3", "tags4", "tags5"],
        bList = $("#" + id + " b").get();
        var max = parseInt($("#" + id + " b").last().text());
        var distance = Math.ceil(max / classes.length);

        for (var i = 0; i < bList.length; i++) {
            var num = parseInt(bList[i].innerHTML);
            // 算出当前 tag 数目所在的区间，加上 class
            for (var j = 0; j < classes.length; j++) {
                if (num > j * distance && num <= (j + 1) * distance) {
                    bList[i].parentNode.className = classes[j];
                    break;
                }
            }
        }
        
        // 按字母或者中文拼音进行排序
        $("#" + id).html($("#" + id + " li").get().sort(function(a, b) {
            var valA = $(a).find("span").text().toLowerCase();
            var valB = $(b).find("span").text().toLowerCase();
            // 对中英文排序的处理
            return valA.localeCompare(valB);
        }));
    },
    
    /**
     * @description 时间戳转化为时间格式
     * @param {String} time 时间
     * @param {String} format 格式化后日期格式
     * @returns {String} 格式化后的时间
     */
    toDate: function (time, format) {
        var dateTime = new Date(time),
        formatDate;
        var year = dateTime.getFullYear(),
        month = dateTime.getMonth() + 1,
        date = dateTime.getDate(),
        hour = dateTime.getHours() + 1,
        minute = dateTime.getMinutes() + 1;
        
        switch (format) {
            case "yy-MM-dd HH:mm":
                formatDate = year.toString().substr(2) + "-" + month + "-" + date + " " + hour + ":" + minute;
                break;
            default:
                break;
        }
        
        return formatDate;
    }
};

if (!Cookie) {
    /**
     * @description Cookie 相关操作
     * @static
     */
    var Cookie = {
        /**
         * @description 读取 cookie
         * @param {String} name cookie key
         * @returns {String} 对应 key 的值，如 key 不存在则返回 ""
         */
        readCookie: function (name) {
            var nameEQ = name + "=";
            var ca = document.cookie.split(';');
            for(var i=0;i < ca.length;i++) {
                var c = ca[i];
                while (c.charAt(0)==' ') c = c.substring(1,c.length);
                if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
            }
            return "";
        },
        
        /**
         * @description 清除 Cookie
         * @param {String} name 清除 key 为 name 的该条 Cookie
         */
        eraseCookie: function (name) {
            this.createCookie(name,"",-1);
        },

        /**
         * @description 创建 Cookie
         * @param {String} name 每条 Cookie 唯一的 key
         * @param {String} value 每条 Cookie 对应的值
         * @param {Int} days Cookie 保存时间
         */
        createCookie: function (name, value, days) {
            var expires = "";
            if (days) {
                var date = new Date();
                date.setTime(date.getTime()+(days*24*60*60*1000));
                expires = "; expires="+date.toGMTString();
            }
            document.cookie = name+"="+value+expires+"; path=/";
        }
    };
}
//var common = new Common();
var collapseArchive = function (it, year) {
    var tag = true;
    if (it.className === "collapse-ico") {
        it.className = "expand-ico";
        tag = false;
    } else {
        it.className = "collapse-ico";
    }
    
    $("#archiveSide li").each(function () {
        var $this = $(this);
        // hide other year month archives
        if ($this.data("year") === year) {
            if (tag) {
                $(this).show();
            } else {
                $(this).hide();
            }
        }
    });
};
var currentYear = (new Date()).getFullYear(),
year = currentYear;
$("#archiveSide li").each(function (i) {
    var $this = $(this);
    
    // hide other year month archives
    if ($this.data("year") !== currentYear) {
        $(this).hide()
    }
    
    // append year archive
    if (year !== $this.data("year")) {
        year = $this.data("year");
        $this.before("<li class='archive-year'><div style="font-size: 14px;font-weight: bold;" onclick='collapseArchive(this, " + 
            year + ")' class='expand-ico'>" + year + "&nbsp;\u5e74</div></li>");
    }
});