---
layout: default
permalink: /updates/Yamcs_Server_(v3.x.x)/
sidebar: yes
title: Yamcs Server Updates (v3.x.x)
---

{% for release in site.data.releases.yamcs.legacy limit:20 %}
  <h2>
    Yamcs {{ release.version }}<span style="font-size: 10pt">{% if release.tgz %}&nbsp;&nbsp;[<a href="{{ release.tgz.url }}">.tar.gz</a>]{% endif %}{% if release.rpm %}&nbsp;&nbsp;[<a href="{{ release.rpm.url }}">.rpm</a>]{% endif %}</span>
    <span style="font-size: small; float: right">{{ release.published_at | date: "%b %d, %y" }}</span>
  </h2>

  {{ release.body | markdownify }}
  
  {% if forloop.last == false %}
  <hr style="border: none; height: 1px; background-color: #e8e8e8; margin-top: 2em; margin-bottom: 2em">
  {% endif %}
{% endfor %}
