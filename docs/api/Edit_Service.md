---
layout: default
permalink: /docs/api/Edit_Service/
sidebar: yes
---

Edit a global service:

    PATCH /api/services/_global/:name

Edit a service for a specific Yamcs instance:

    PATCH /api/services/:instance/:name

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
    Note that once stopped, a service cannot be resumed. Instead a new service instance will be created and started.</td>
  </tr>
</table>

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
