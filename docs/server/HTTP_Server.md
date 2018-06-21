---
layout: default
permalink: /docs/server/HTTP_Server/
sidebar: yes
---

Yamcs includes an embedded HTTP server that provides these functionalities:

* Serve REST API
* Serve WebSocket API
* Serve the Yamcs website

By default the HTTP server binds to port 8090.

The HTTP Server is tightly integrated with the security system of Yamcs and serves as the default interface for external tooling wanting to integrate. This covers both server-to-server and server-to-user communication patterns.

The HTTP Server can be disabled when its functionality is not needed. Note that in this case also official external clients such as Yamcs Studio will not be able to connect to Yamcs.

### Class Name
[<tt>org.yamcs.web.HttpServer</tt>](https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/web/HttpServer.html)

### Configuration

This is a global service defined in <tt>etc/yamcs.yaml</tt>. Example from a typical deployment:

<pre class="r header">yamcs.yaml</pre>
```yaml
services:
  - org.yamcs.web.HttpServer

webConfig:
  webRoot:
    - lib/yamcs-web
    - web
  webPort: 8090
```

The webConfig supports these options:

<dl>
  <dt>webRoot</dt>
  <dd>List of file paths that are statically served. This usually points to the web files for the built-in Yamcs website (<tt>lib/yamcs-web</tt>) and to site-specific configuration options (<tt>web</tt>) such as synoptic displays.</dd>

  <dt>webPort</dt>
  <dd>The port at which Yamcs web services may be reached. The default is port 8090.</dd>

  <dt>zeroCopyEnabled</dt>
  <dd>Indicates whether zero-copy can be used to optimize non-SSL static file serving. Usually this can be left to true, but is has been added as an option to fix specific deployment issues (e.g. some docker hosts).</dd>

  <dt>cors</dt>
  <dd>
    Configure cross-origin resource sharing for the REST API. This facilitates use of the API in external web applications that directly access the Yamcs API. CORS is a W3C specification enforced by all major browsers. Details are described at <a href="https://www.w3.org/TR/cors/">https://www.w3.org/TR/cors/</a>. Yamcs simply adds configurable support for some of the CORS preflight response headers.
  </dd>
</dl>


#### CORS sub-configuration

The <tt>cors</tt> configuration option supports these sub-properties:

<dl>
  <dt>enabled</dt>
  <dd>Whether CORS support is enabled. Note that Yamcs' buit-in website does not need CORS to be enabled, since it shares the same origin as the REST API.</dd>

  <dt>allowOrigin</dt>
  <dd>Exact string that will be set in the <tt>Access-Control-Allow-Origin</tt> header of the preflight response.</dd>

  <dt>allowCredentials</dt>
  <dd>Exact string that will be set in the <tt>Access-Control-Allow-Credentials</tt> header of the preflight response.</dd>
</dl>

Example:

<pre class="r header">yamcs.yaml</pre>
```yaml
webConfig:
  cors:
    enabled: true
    allowOrigin: "*"
    allowCredentials: false
```
