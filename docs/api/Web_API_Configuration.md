---
layout: default
permalink: /docs/api/Web_API_Configuration/
sidebar: yes
---

In `yamcs.yaml` define the exposed port. Traffic on this port is multiplexed between web tools such as the [[REST API]], the [[WebSocket API]] and the web displays.
```yaml
    webPort: 8090
```

In `yamcs.(instance).yaml` activate the `YamcsWebService`.
```yaml
    services:
      - [...]
      - org.yamcs.web.YamcsWebService
```
