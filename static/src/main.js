(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
ga('create', 'UA-39461955-1', 'ondrejsika.com');
ga('send', 'pageview');

var _gauges = _gauges || [];
(function() {
    var t   = document.createElement('script');
    t.type  = 'text/javascript';
    t.async = true;
    t.id    = 'gauges-tracker';
    t.setAttribute('data-site-id', '529d9839613f5d4398000052');
    t.src = '//secure.gaug.es/track.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(t, s);
})();

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
    if (links[i].hostname != "localhost" && links[i].hostname != "ondrejsika.com") links[i].target = "_blank"
}

// Set body width to 50em
if (window.location.hash == '#fixed_width'){
    document.getElementsByTagName('body')[0].style.width = '50em';
}
if (window.localStorage){
    if (window.location.hash == '#fixed_width_on'){
        window.localStorage.setItem('fixed_width', true);
    }
    if (window.location.hash == '#fixed_width_off'){
        window.localStorage.setItem('fixed_width', false);
    }
    if (window.location.hash == '#invert_on'){
        window.localStorage.setItem('invert', true);
    }
    if (window.location.hash == '#invert_off'){
        window.localStorage.setItem('invert', false);
    }


    if (window.localStorage.getItem('fixed_width') == 'true'){
        document.getElementsByTagName('body')[0].style.maxWidth = '50em';
    }
}

