---
layout: default
permalink: /updates/Yamcs_Studio_(v1.0.x)/
sidebar: yes
title: Yamcs Studio Updates (v1.0.x)
---

<div class="hint">
  v1.0.x releases should only be used to run against legacy versions of Yamcs Server (v3.x.x).
</div>

{% for release in site.data.releases['yamcs-studio'].legacy limit:20 %}
  <h2>
    Yamcs Studio {{ release.version }}<span style="font-size: 10pt">{% if release.windows %}&nbsp;&nbsp;[<a href="{{ release.windows.url }}">Windows x64</a>]{% endif %}{% if release.linux %}&nbsp;&nbsp;[<a href="{{ release.linux.url }}">Linux x64</a>]{% endif %}{% if release.linux %}&nbsp;&nbsp;[<a href="{{ release.macos.url }}">macOS</a>]{% endif %}</span>
    <span style="font-size: small; float: right">{{ release.published_at | date: "%b %d, %y" }}</span>
  </h2>

  {{ release.body | markdownify }}
  
  {% if forloop.last == false %}
  <hr style="border: none; height: 1px; background-color: #e8e8e8; margin-top: 2em; margin-bottom: 2em">
  {% endif %}
{% endfor %}
