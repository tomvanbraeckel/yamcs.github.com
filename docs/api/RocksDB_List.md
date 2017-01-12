---
layout: default
permalink: /docs/api/RocksDB_List/
sidebar: yes
---

List all RocksDB databases:

    GET /api/archive/:instance/rocksdb/list
    
### Example

<pre class="header">
GET /api/archive/yops/rocksdb/list
</pre>

### Response
The response is a list of directory names where the RocksDB databases are stored:

<pre>
/storage/yamcs-data/yops/events-histo
/storage/yamcs-data/yops/ParameterArchive
/storage/yamcs-data/yops/pp-histo
/storage/yamcs-data/yops/cmdhist-histo
/storage/yamcs-data/yops/2016/pp
/storage/yamcs-data/yops/tm-histo
</pre>

