---
layout: default
permalink: /docs/api/Control_Services/
sidebar: yes
---

Control global services:

    PATCH /api/services/_global/:name

Control services for the given Yamcs instance:

    PATCH /api/services/:instance/service/:name

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">state</td>
    <td class="code">string</td>
    <td>The state of the service. Either <tt>running</tt> or <tt>stopped</tt>.
    Note that once stopped, a service cannot be restarted. Instead a new service (new java Object) will be created and started.</td>
  </tr>
</table>

The same parameters can also be specified in the request body. In case both query string parameters and body parameters are specified, they are merged with priority being given to query string parameters.

### Example

Start a service:

```json
{
  "state" : "running"
}
```

Stop a service:

```json
{
  "state" : "stopped"
}
```
