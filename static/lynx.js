var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-39461955-1']);
_gaq.push(['_setDomainName', 'ondrejsika.com']);
_gaq.push(['_trackPageview']);

(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();

if (window.location.hash == "#lynx") {
    document.getElementsByTagName("h1")[0].outerHTML = "<center>"+document.getElementsByTagName("h1")[0].outerHTML+"</center>"
    css = document.createElement("link");
    css.setAttribute("rel", "stylesheet");
    css.setAttribute("type", "text/css");
    css.setAttribute("href", "/static/lynx-lynx.css");
    document.getElementsByTagName("head")[document.getElementsByTagName("head").length-1].appendChild(css);
    document.getElementById("switch-lynx").href = "/";
    document.getElementById("switch-lynx").innerHTML = "Back from Lynx";
    document.getElementById("switch-lynx").onclick = function(){
        window.location.href='/';
        window.location.reload();
    }
}