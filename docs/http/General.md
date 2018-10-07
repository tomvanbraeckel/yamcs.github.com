---
layout: default
permalink: /docs/http/General/
sidebar: yes
---

Yamcs provides a Web api allowing tools to interface with Yamcs resources. By default the Web API uses JSON over HTTP. It is also possible to do Protobuf over HTTP. These pages illustrate all operations via the more common JSON format.

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

### Time
All timestamps are returned as UTC and formatted according to ISO 8601. For example:
    
    2015-08-26T08:08:40.724Z
    2015-08-26
    
### Namespaces
Mission Database entries like parameters and containers may be available under different namespaces. When an operation documents the use of <tt>/:namespace/:name</tt> in the URI, the namespace segment can be repeated for every subsystem in case of hierarchical XTCE names. For example, these resources evaluate to the same parameter resource:

    /api/mdb/simulator/parameters/MDB%3AOPS+Name/SIMULATOR_BatteryVoltage2
    /api/mdb/simulator/parameters/YSS/SIMULATOR/BatteryVoltage2

Notice as well the use of `%3A` and `+` to URL-encode `MDB:OPS Name` to the ASCII character set. The server supports UTF-8 but your client may not.

### Error Handling
When an exception is caught while handling a REST request, the server will try to give some feedback to the client by wrapping it in a generic exception message like so:

```json
{
  "exception" : {
    "type": "<short>",
    "msg": "<long>"
  }
}
```

Clients of the REST API should check on whether the status code is between 200 and 299, and if not, interpret the response with the above structure.

### CORS

Cross-origin Resource Sharing (CORS) allows access to the Yamcs REST API from a remotely hosted web page. This is the HTML5 way of bypassing the self-origin policy typically enforced by browsers. With CORS, the browser will issue a preflight request to Yamcs to verify that it allows browser requests from the originating web page.

CORS is off by default on Yamcs Server, but this is configurable by your site administrator.

### Protobuf

While it is in general recommended to use JSON as documented throughout this chapter, all REST operations also support Google Protocol Buffers for a lighter footprint. Yamcs Studio, for example, uses exclusively binary Protobuf messages. To mark your requests as Protobuf, set this HTTP header:

    Content-Type: application/protobuf
    
If you also want to server to respond with Protobuf messages, add the <tt>Accept</tt> header:

    Accept: application/protobuf

The <tt>.proto</tt> files that define the contract of the REST endpoint are included in the chapter [Proto Files](/docs/http/Proto_Files/). Using the <tt>protoc</tt> compiler, client code can be generated for Java, Python, C++ and more.

The applicable top-level Protobuf messages are documented for every operation separately. If the response status is not between <tt>200</tt> and <tt>299</tt>, deserialize the response as of type <tt>RestExceptionMessage</tt>.
