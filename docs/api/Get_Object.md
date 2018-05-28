---
layout: default
permalink: /docs/api/Get_Object/
sidebar: yes
---

Get an object:

    GET /api/buckets/:instance/:bucketName/:objectName

<tt>_global</tt> can be used as instance name to get an object from a bucket at the global level.

### Response

The object data is returned in the body of the response. The response Content-Type is set to the content type of the object specified when uploading the object. If no Content-Type has been specified when creating the object, the Content-Type of the response will be set to "application/octet-stream".
