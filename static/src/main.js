/*
Remove GA for fucking EU cookie law

(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
ga('create', 'UA-39461955-1', 'ondrejsika.com');
ga('send', 'pageview');
*/

var disqus_shortname = 'ondrejsika';
(function () {
    var s = document.createElement('script'); s.async = true;
    s.type = 'text/javascript';
    s.src = '//' + disqus_shortname + '.disqus.com/count.js';
    (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
}());

links = document.getElementsByTagName("a")
for(i = 0; i< links.length; i++){
    if (links[i].class && links[i].class.search(/no-taget/) == -1) continue
    if (links[i].hostname != "127.0.0.1" && links[i].hostname != "localhost" && links[i].hostname != "ondrejsika.com" && links[i].hostname != "www.ondrejsika.com" && links[i].hostname != "personal.ondrejsika.com") links[i].target = "_blank"
}

