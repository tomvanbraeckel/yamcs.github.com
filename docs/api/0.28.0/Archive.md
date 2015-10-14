---
version: 0.28.0
layout: default
permalink: /docs/api/Archive/0.28.0/
sidebar: yes
---

### Fetch archive data `api/archive`

Fetches Parameters, Packets, Processed Parameters, Events and/or Command History from the Yamcs Archive. The API of this method is likely to change in the near future.

Filters are specified in the request body, and should always include at least a `start` and a `stop` value. These are to be encoded in the internal Yamcs time format (use `TimeEncoding` from `yamcs-api`). We might make this configurable in the future.

Request the command history:

```
curl -XGET http://localhost:8090/simulator/api/archive -d '{"start": 1425686400,"stop": 1426636800,"commandHistoryRequest": {}}'
```

In practice the Yamcs archive could be very big. Therefore, responses are by default limited to about 1MB. Anything above will generate a server error. If your client is expected to fetch more data than that, you should use the `stream`-option like so:

Request parameters:

```
curl -XGET http://localhost:8090/simulator/api/archive -d '{"start": 1425686400,"stop": 1426636800,"commandHistoryRequest": {}}'
```

Notice in the response that we now receive multiple individually delimited JSON messages, therefore your JSON client does not need to wait for the full response before starting processing. For Protobuf clients, the individual message are prefixed with their byte-size (Protobuf is not a self-delimiting message format).
