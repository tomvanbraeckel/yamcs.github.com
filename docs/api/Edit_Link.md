---
layout: default
permalink: /docs/api/Edit_Link/
sidebar: yes
---

Edit a link:

    PATCH /api/links/:instance/:name

<strong>!!</strong> due to a bug in Yamcs <= v0.29.4 you should temporarily use the url `/api/links/:instance/link/:name`

### Parameters

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">state</td>
    <td class="code">string</td>
    <td>The state of the link. Either <tt>enabled</tt> or <tt>disabled</tt>.</td>
  </tr>
</table>

The same parameters can also be specified in the request body. In case both query string parameters and body parameters are specified, they are merged with priority being given to query string parameters.

### Example

Enable a link:

```json
{
  "state" : "enabled"
}
```

Disable a link:

```json
{
  "state" : "disabled"
}
```

### Alternative Media Types

#### Protobuf

Use these HTTP headers:

    Content-Type: application/protobuf
    Accept: application/protobuf
    
Request is of type:

<pre class="r header"><a href="/docs/api/rest.proto/">rest.proto</a></pre>
```proto
message EditLinkRequest {
  optional string state = 1;
}
```
