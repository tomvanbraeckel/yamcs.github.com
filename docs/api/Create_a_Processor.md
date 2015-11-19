---
layout: default
permalink: /docs/api/Create_a_Processor/
sidebar: yes
---

Create a replay processor for the given Yamcs instance:

    POST /api/processors/:instance
    
Replay processors allow for synchronized playback of different types of archived data.


### Parameters

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">name</td>
    <td class="code">string</td>
    <td><strong>Required.</strong> The name of the processor. Must be unique for the Yamcs instance.</td>
  </tr>
  <tr>
    <td class="code">start</td>
    <td class="code">stop</td>
    <td><strong>Required.</strong> The time at which the replay should start.</td>
  </tr>
  <tr>
    <td class="code">stop</td>
    <td class="code">string</td>
    <td>The time at which the replay should stop. If unspecified, the replay will keep going as long as there is remaining data.</td> 
  </tr>
  <tr>
    <td class="code">loop</td>
    <td class="code">bool</td>
    <td>Whether the processing should restart at the end of the replay. Default: <tt>no</tt></td>
  </tr>
  <!--tr>
    <td class="code">type</td>
    <td class="code">string</td>
    <td>The type of the processor. Default <tt>Archive</tt>.</td>
  </tr-->
  <tr>
    <td class="code">speed</td>
    <td class="code">string</td>
    <td>
        The speed of the processor. One of:
        <ul>
            <li><tt>afap</tt></li>
            <li>a speed factor relative to the original speed. Example: <tt>2x</tt></li>
            <li>a fixed delay value in milliseconds. Example: <tt>2000</tt></li>
        </ul>
        Default: <tt>1x</tt>
    </td>
  </tr>
  <!--tr>
    <td class="code">persistent</td>
    <td class="code">bool</td>
    <td>Keep the processor when terminated. Default: <tt>no</tt></td>
  </tr-->
  <tr>
    <td class="code">clientId</td>
    <td class="code">array of integers</td>
    <td>The client IDs that should be connected to this processor.</td>
  </tr>
  <tr>
    <td class="code">paraname</td>
    <td class="code">array of strings</td>
    <td>Name patterns of parameters that are included in the replay. Patterns are matched on the qualified names and support wildcard expansion. If the pattern matches the name of a space system, all parameters directly within that system are included.</td>
  </tr>
  <tr>
    <td class="code">ppgroup</td>
    <td class="code">array of strings</td>
    <td>
        <p>Exact names of the groups of processed parameters to include in the replay.</p>
        <p><strong>Partial wildcard matching is not currently supported.</strong></p>
    </td>
  </tr>
  <tr>
    <td class="code">packetname</td>
    <td class="code">array of strings</td>
    <td>
        <p>Exact qualified names of the packets to include in the replay. Specify <tt>*</tt> to include all packets.</p>
        <p><strong>Partial wildcard matching is not currently supported.</strong></p>
    </td>
  </tr>
  <tr>
    <td class="code">cmdhist</td>
    <td class="code">bool</td>
    <td>Whether or not to replay Command History. Default: <tt>no</tt></td>
  </tr>
</table>

The criteria <tt>paraname</tt>, <tt>ppgroup</tt>, <tt>packetname</tt> and <tt>cmdhist</tt> are additive. At least one of them should be filled in, or there will be nothing to replay.


### Example

Replay everything except PPs as of January 1st 2015 at 4.5x the original speed, and add client 12 to the replay:

{% highlight json %}
{
  "name" : "A sample processor",
  "start" : "2015-01-01T00:00:00.000",
  "clientId" : [ 12 ],
  "speed": "4.5x",
  "paraname": [ "*" ],
  "packetname": [ "*" ],
  "cmdhist": true
}
{% endhighlight %}

Replay parameters directly under <tt>/GC</tt> or anywhere under <tt>/YSS</tt> at a fixed delay of 1 second, and switch client 12 to this replay processor:

{% highlight json %}
{
  "name" : "A lighter processor",
  "start" : "2015-01-01T00:00:00.000",
  "clientId" : [ 12 ],
  "speed": "1000",
  "paraname": [ "/YSS/*", "/GC" ]
}
{% endhighlight %}

Notice how the speed value must always be encoded as a string to keep our parser happy.


### Protobuf

#### Request

<pre class="r header"><a href="/docs/api/rest.proto/">rest.proto</a></pre>
{% highlight nginx %}
message CreateProcessorRequest {
  optional string name = 1;
  optional string start = 2;
  optional string stop = 3;
  optional bool loop = 4;
  optional string speed = 5;
  repeated int32 clientId = 6;
  repeated string paraname = 7;
  repeated string ppgroup = 8;
  repeated string packetname = 9;
  optional bool cmdhist = 10;
  optional bool persistent = 11;
}
{% endhighlight %}
