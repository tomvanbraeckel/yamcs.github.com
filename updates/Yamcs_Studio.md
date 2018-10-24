---
layout: default
permalink: /updates/Yamcs_Studio/
sidebar: yes
title: Yamcs Studio Updates
---

{% for release in site.data.releases['yamcs-studio'].master limit:20 %}
  {% if release.name %}
  <h2>
    {{ release.name }}<span style="font-size: 10pt">{% if release.windows %}&nbsp;&nbsp;[<a href="{{ release.windos.url }}">Windows x64</a>]{% endif %}{% if release.linux %}&nbsp;&nbsp;[<a href="{{ release.linux.url }}">Linux x64</a>]{% endif %}{% if release.linux %}&nbsp;&nbsp;[<a href="{{ release.macos.url }}">macOS</a>]{% endif %}</span>
    <span style="font-size: small; float: right">{{ release.published_at | date: "%b %d, %y" }}</span>
  </h2>

  {{ release.body | markdownify }}
  
  {% if forloop.last == false %}
  <hr style="border: none; height: 1px; background-color: #e8e8e8; margin-top: 2em; margin-bottom: 2em">
  {% endif %}
  {% endif %}
{% endfor %}
