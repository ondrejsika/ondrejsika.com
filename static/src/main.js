links = document.getElementsByTagName("a")
for(i = 0; i< links.length; i++){
    if (links[i].class && links[i].class.search(/no-taget/) == -1) continue
    if (links[i].hostname != "localhost" && links[i].hostname != "ondrejsika.com") links[i].target = "blank"
}