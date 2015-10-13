---
layout: default
permalink: /docs/api/WebSocket_API/
sidebar: yes
---

Yamcs provides a WebSocket-API for subscribing to data. A typical use case would be a display tool subscribing to parameter updates. All operations support binary WebSocket frames encoded using Google Protocol Buffers, as well as textual WebSocket frames encoded in JSON. The choice between Protobuf and JSON is currently determined based on the type of the first received client frame. If it's binary, all further message will be Protobuf, if it's text, all further messages will be in JSON.

### Wrapper
Assuming the default _simulator_ instance, WebSocket calls should be directed to a URL of the form `http://localhost:8090/simulator/_websocket`. The frame must contain a text array like this: `[x,y,z,{"<request-type>":"<request>"}]` where:

* `x` is the version of the protocol (currently at 1)
* `y` is the message type. One of:
  - `1` Request
  - `2` Reply
  - `3` Exception
  - `4` Data
* `z` is a sequence counter. Basically this allows clients to couple a response with the original request.
