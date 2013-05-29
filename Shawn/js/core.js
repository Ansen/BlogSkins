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
};
var common = new Common();

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
        $this.before("<li class='archive-year'><div onclick='collapseArchive(this, " + 
            year + ")' class='expand-ico'>" + year + "&nbsp;\u5e74</div></li>");
    }
});