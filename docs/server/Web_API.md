---
layout: default
permalink: /docs/server/Web_API/
sidebar: yes
---

In `yamcs.yaml` define the exposed port. Traffic on this port is multiplexed between web tools such as the [REST API](/docs/api/REST_API), the [WebSocket API](/docs/api/WebSocket_API) and the web displays.

```yaml
webPort: 8090
```

In `yamcs.(instance).yaml` activate the `YamcsWebService`.

```yaml
services:
      - [...]
      - org.yamcs.web.YamcsWebService
```
