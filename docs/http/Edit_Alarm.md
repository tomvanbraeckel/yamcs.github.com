---
layout: default
permalink: /docs/http/Edit_Alarm/
sidebar: yes
---

    PATCH /api/processors/:instance/:processor/parameters/:namespace/:name/alarms/:seqnum
    
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
    <td><strong>Required.</strong> The state of the alarm. Either <tt>acknowledged</tt> or <tt>unacknowledged</tt></td>
  </tr>
  <tr>
    <td class="code">comment</td>
    <td class="code">string</td>
    <td>Message documenting the alarm change.</td>
  </tr>
</table>

### Example

```json
{
  "state": "acknowledged",
  "comment": "bla bla"
}
```


### Alternative Media Types

#### Protobuf

Use these HTTP headers:

    Content-Type: application/protobuf
    Accept: application/protobuf
    
Request is of type:

{% proto rest/rest.proto %}
message EditAlarmRequest {
  optional string state = 1;
  optional string comment = 2;
}
{% endproto %}
