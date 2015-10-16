---
layout: default
permalink: /docs/api/REST_API/
sidebar: yes
chapter: yes
---

Yamcs provides a RESTful web service allowing remote tools to interface with a growing set of internals.

All operations accept and deliver both JSON and Protobuf. The `.proto` files that define the contract of the REST endpoint are included in the yamcs source code. Using the `protoc` compiler, client code can be generated for Java, Python, C++ and more.

All operations documented in the following pages assume the default _simulator_ instance. They also assume that the client is sending and asking JSON messages. However, the server is also capable of reading and writing binary data using Google Protocol Buffers. If -as a client- you are sending in the Protobuf wire format, change the HTTP `Content-Type` header to `application/octet-stream`. If you also want the server to respond with Protobuf messages, set the HTTP `Accept` header to `application/octet-stream`.


## Error Handling
When an exception is caught while handling a REST request, the server will try to give some feedback to the client by wrapping it in a generic exception message like this:

{% highlight json %}
{
  "exception" : {
    "type": "<short>",
    "msg": "<long>"
  }
}
{% endhighlight %}

Clients of the REST API should check on whether the status code is `200 OK`, and if not, deserialize the response as a `RestExceptionMessage` instead.

Note that the exception handling still requires more thoughtwork in terms of when we return an applicative exception as part of a 200 response, and when we return an actual exception.
