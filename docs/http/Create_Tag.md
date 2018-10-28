---
layout: default
permalink: /docs/http/Create_Tag/
sidebar: yes
---

Create a tag for the given archive instance:

    POST /api/archive/:instance/tags


### Parameters

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">name</td>
    <td class="code">string</td>
    <td><strong>Required.</strong> The name of the tag.</td>
  </tr>
  <tr>
    <td class="code">description</td>
    <td class="code">string</td>
    <td>The description of the tag.</td>
  </tr>
  <tr>
    <td class="code">start</td>
    <td class="code">string</td>
    <td>The start time of the tag. Default is unbounded.</td>
  </tr>
  <tr>
    <td class="code">stop</td>
    <td class="code">string</td>
    <td>The stop time of the tag. Default is unbounded.</td>
  </tr>
  <tr>
    <td class="code">color</td>
    <td class="code">string</td>
    <td>The color of the tag. Must be an RGB hex color, e.g. <tt>#ff0000</tt></td>
  </tr>
</table>


### Example

Create a red tag covering January 1st 2015, onwards:

```json
{
  "name" : "My archive annotation",
  "start" : "2015-01-01T00:00:00.000Z",
  "color" : "#ff0000"
}
```


### Alternative Media Types

#### Protobuf

Use these HTTP headers:

    Content-Type: application/protobuf
    Accept: application/protobuf
    
Request is of type:

{% proto rest/rest.proto %}
message CreateTagRequest {
  optional string name = 1;
  optional string start = 2;
  optional string stop = 3;
  optional string description = 4;
  optional string color = 5;
}
{% endproto %}
