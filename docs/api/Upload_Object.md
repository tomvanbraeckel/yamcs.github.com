---
layout: default
permalink: /docs/api/Upload_Object/
sidebar: yes
---

Upload an object

    POST /api/archive/:instance/:bucketName/:objectName
    POST /api/archive/:instance/:bucketName

<tt>_global</tt> can be used as instance name to upload to a bucket at the global level.

If the bucketName is <tt>user.username</tt> then a bucket will be created automatically if it does not exist. Otherwise the bucket must exist before being used.
    

### Simple Upload

In case of simple upload, the objectName has to be specified as part of the URL and the Content-Type header has to be set to the type of the object. The body of the request is the object data.

### Form upload

The form based upload can be used to upload an object from an HTML form. In this case the Content-Type of the request is set to <tt>multipart/form-data</tt>, and the body will contain at least one part which is the object data. This part includes a   filename which is used as the object name as well as a Content-Type header. The name attribute for the file part is ignored.
Additional parts (which do not specify a filename) will be used as metadata: the name is specified as part of the Content-Disposition and the value is the body of the part.

This can be tested using the curl with the -F option. 


#### Example

```
POST /api/buckets/_global/my_bucket HTTP/1.1
Host: localhost:8090
User-Agent: curl/7.58.0
Accept: */*
Content-Length: 1090
Content-Type: multipart/form-data; boundary=------------------------7109c709802f7ae4

--------------------------7109c709802f7ae4
Content-Disposition: form-data; name="file"; filename="object/name"
Content-Type: text/plain

[object data]
--------------------------7109c709802f7ae4
Content-Disposition: form-data; name="name1"

value1
--------------------------7109c709802f7ae4
Content-Disposition: form-data; name="name2"

value2
--------------------------7109c709802f7ae4--

```

This will create an object named "object/name" with two metadata properties:

```json
 {
   "name1": "value1",
   "name2": "value2"
}
```
