---
layout: default
permalink: /docs/http/Edit_Client/
sidebar: yes
---

Edit a client:

    PATCH /api/clients/:id


### Parameters

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">instance</td>
    <td class="code">string</td>
    <td>The instance. If unspecified, this defaults to the instance that the client is currently connected to.</td>
  </tr>
  <tr>
    <td class="code">processor</td>
    <td class="code">string</td>
    <td>The processor. If <tt>instance</tt> is provided and <tt>processor</tt> is not, then this will default to the default processor for that instance.</td>
  </tr>
</table>

### Example

Update the client's processor to <tt>replay123</tt>:

```json
{
  "processor" : "replay123"
}
```

Later on, leave the replay and switch to the default processor (e.g. realtime) on the simulator instance:

```json
{
  "instance" : "simulator"
}
```

### Alternative Media Types

#### Protobuf

Use these HTTP headers:

    Content-Type: application/protobuf
    Accept: application/protobuf
    
Request is of type:

<pre class="r header"><a href="{{ site.proto }}/rest/rest.proto">rest.proto</a></pre>
```proto
message EditClientRequest {
  optional string instance = 1;
  optional string processor = 2;
}
```
