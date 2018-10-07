---
layout: default
permalink: /docs/http/WebSocket/
sidebar: yes
chapter: yes
---

Yamcs provides a WebSocket API for data subscriptions. A typical use case would be a display tool subscribing to parameter updates.

The WebSocket supports two subprotocols:

1. Textual WebSocket frames encoded in JSON
2. Binary WebSocket frames encoded in Google Protocol Buffers

To select one or the other specify this header on your WebSocket upgrade request:

    Sec-WebSocket-Protocol: protobuf

or

    Sec-WebSocket-Protocol: json

When unspecified, the server defaults to JSON.

### Wrapper

WebSocket calls should be directed to a URL of the form:

    http://localhost:8090/_websocket/:instance
    
Replace <tt>:instance</tt> with your Yamcs instance name. The frame must contain a text array like so:

    [x,y,z,{"<request-type>":"<request>"}]
    
Where:

<table class="inline">
    <tr>
        <td class="code">x</td>
        <td>the version of the protocol (currently fixed at 1)</td>
    </tr>
    <tr>
        <td class="code">y</td>
        <td>
            the message type. One of:
            <ul>
                <li><tt>1</tt> Request</li>
                <li><tt>2</tt> Reply</li>
                <li><tt>3</tt> Exception</li>
                <li><tt>4</tt> Data</li>
            </ul>
        </td>
    </tr>
    <tr>
        <td class="code">z</td>
        <td>a sequence counter. Enables clients to couple a response with the original request</td>
    </tr>
</table>

The <tt>request-type</tt> and <tt>request</tt> criteria vary for every type of resource, and are each time indicated in further pages.

### Java Client

If you are developing a Java application integrated with Yamcs, we recommend using the LGPL Java WebSocket client distributed as part of the <tt>yamcs-api</tt> jar.
