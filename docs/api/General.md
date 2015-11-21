---
layout: default
permalink: /docs/api/General/
sidebar: yes
---

Yamcs provides a RESTful web service allowing remote tools to interface with a growing set of internals. All operations accept both JSON and Protobuf as a media type. These pages document the use of the common JSON format.

### HTTP Verbs
The supported verbs in the REST API are:

<table class="inline">
    <tr>
        <td class="code">GET</td>
        <td>Retrieve a resource</td>
    </tr>
    <tr>
        <td class="code">POST</td>
        <td>Create a new resource</td>
    </tr>
    <tr>
        <td class="code">PATCH</td>
        <td>Update an existing resource</td>
    </tr>
    <tr>
        <td class="code">DELETE</td>
        <td>Delete a resource</td>
    </tr>
</table>

Many HTTP clients (including Java's <tt>HttpsUrlConnection</tt>) are not able to send request bodies over <tt>GET</tt>. Therefore whenever an operation documents a <tt>GET</tt> request body, it will accept both <tt>GET</tt> and <tt>POST</tt> requests.

In addition, since the use of the HTTP <tt>PATCH</tt> method is not as widespread as it ought to be, Yamcs accepts both <tt>PUT</tt> or <tt>POST</tt> to be used instead. 

### Time
All timestamps are returned as UTC and formatted according to ISO 8601. E.g.
    
    2015-08-26T08:08:40.724
    2015-08-26
    
### Namespaces
Mission Database resources like parameters and containers are available under different namespaces. When an operation documents the use of <tt>/:namespace/:name</tt> in the URI, the namespace segment can be repeated for every subsystem in case of hierarchical XTCE names. For example, these resources evaluate to the same parameter resource:

    /api/mdb/simulator/parameters/MDB%3AOPS+Name/SIMULATOR_BatteryVoltage2
    /api/mdb/simulator/parameters/YSS/SIMULATOR/BatteryVoltage2

Notice as well the use of `%3A` and `+` to URL-encode `MDB:OPS Name` to the ASCII character set. The server supports UTF-8 but your client may not.

### Error Handling
When an exception is caught while handling a REST request, the server will try to give some feedback to the client by wrapping it in a generic exception message like so:

{% highlight json %}
{
  "exception" : {
    "type": "<short>",
    "msg": "<long>"
  }
}
{% endhighlight %}

Clients of the REST API should check on whether the status code is between 200 and 299, and if not, interpret the response with the above structure.

### Pretty Printing
JSON responses will be automatically pretty-printed for improved curl experience. Turn this behaviour off by setting the query parameter <tt>pretty=no</tt> in your URI. This will make responses slightly faster and lighter.

### Protobuf

While it is in general recommended to use JSON as documented throughout this chapter, all REST operations also support Google Protocol Buffers for a lighter footprint. Yamcs Studio, for example, uses exclusively binary Protobuf messages. To mark your requests as Protobuf, set this HTTP header:

    Content-Type: application/octet-stream
    
If you also want to server to respond with Protobuf messages, add the <tt>Accept</tt> header:

    Accept: application/octet-stream

The <tt>.proto</tt> files that define the contract of the REST endpoint are included in the chapter [Proto Files](/docs/api/Proto_Files/). Using the <tt>protoc</tt> compiler, client code can be generated for Java, Python, C++ and more.

The applicable top-level Protobuf messages are documented for every operation separately. If the response status is not <tt>200 OK</tt>, deserialize the response as of type <tt>RestExceptionMessage</tt>.
