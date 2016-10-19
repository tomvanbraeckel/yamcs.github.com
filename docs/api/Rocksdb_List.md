---
layout: default
permalink: /docs/api/RocksDB_List/
sidebar: yes
---

List all RocksDB databases:

    GET /api/archive/:instance/rocksdb/list
    
    
### Example

<pre class="header">
Status: 200 OK
</pre>

```plain/text
/storage/yamcs-data/yops/events-histo
/storage/yamcs-data/yops/ParameterArchive
/storage/yamcs-data/yops/pp-histo
/storage/yamcs-data/yops/cmdhist-histo
/storage/yamcs-data/yops/2016/pp
/storage/yamcs-data/yops/tm-histo
```

