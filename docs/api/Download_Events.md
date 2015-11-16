---
layout: default
permalink: /docs/api/Download_Events/
sidebar: yes
---

Download archived events:

    GET /api/archive/:instance/downloads/events
    
<div class="hint">
This operation will possibly download a very large file. If you worry about size for your application, check out the support for <a href="/docs/api/List_Events/">paged event retrievals</a> instead.
</div>


### Parameters

<table class="inline">
    <tr>
        <th>Name</th>
        <th>Type</th>
        <th>Description</th>
    </tr>
    <tr>
        <td class="code">start</td>
        <td class="code">string</td>
        <td>Filter the lower bound of the event's generation time. Specify a date string in ISO 8601 format</td>
    </tr>
    <tr>
        <td class="code">stop</td>
        <td class="code">string</td>
        <td>Filter the upper bound of the event's generation time. Specify a date string in ISO 8601 format</td>
    </tr>
    <tr>
        <td class="code">order</td>
        <td class="code">string</td>
        <td>The order of the returned results. Can be either <tt>asc</tt> or <tt>desc</tt>. Default: <tt>asc</tt></td>
    </tr>
</table>


### Media Type

In addition to the usual support for JSON and Protobuf, the response for this particular resource can be made to output CSV data by setting the HTTP `Accept` header to `text/csv`. Or alternatively, append the suffix <tt>.csv</tt> at the end of your URI path:

    GET /api/archive/:instance/downloads/events.csv


### Response

The response will be a stream of individual event records. When using Protobuf, every event is delimited by its byte size.
