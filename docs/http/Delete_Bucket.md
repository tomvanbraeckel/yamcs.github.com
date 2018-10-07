---
layout: default
permalink: /docs/http/Delete_Bucket/
sidebar: yes
---
Deleting a bucket means also deleting all objects that are part of it.

Delete a bucket:

    DELETE /api/bucket/:instance/:bucketName

<tt>_global</tt> can be used as instance name to delete a bucket at the global level.


### Response

<pre class="header">Status: 200 OK</pre>

