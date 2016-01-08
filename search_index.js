---
---

var search_data = [];

{% for post in site.posts %}
  data = {
    url: '{{ post.url }}',
    title: '{{ post.title }}',
    body: '{{ post.content | strip_newlines | strip_html | textilize | escape | replace:'\','' }}'
  }
  var id = search_data.push(data) - 1;
  index.add(angular.extend(data, {id: id}));
{% endfor %}

