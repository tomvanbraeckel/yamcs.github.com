---
layout: default
permalink: /docs/server/TSE_Data_Link/
sidebar: yes
---

Sends telecommands to a configured [TSE Commander](/docs/server/TSE_Commander/) and reads back output as processed parameters.

### Class Name
[<tt>org.yamcs.tctm.TseDataLink</tt>](https://javadoc.io/page/org.yamcs/yamcs-tse/latest/org/yamcs/tctm/TseDataLink.html)


### Configuration Options

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">host</td>
    <td class="code">string</td>
    <td><strong>Required.</strong> The host of the TSE Commander.</td>
  </tr>
  <tr>
    <td class="code">port</td>
    <td class="code">integer</td>
    <td><strong>Required.</strong> The TCP port of the TSE Commander</td>
  </tr>
  <tr>
    <td class="code">tcStream</td>
    <td class="code">string</td>
    <td>Stream on which to receive command instructions. Default: <tt>tc_tse</tt></td>
  </tr>
  <tr>
    <td class="code">ppStream</td>
    <td class="code">string</td>
    <td>Stream on which to output received parameters. Default: <tt>pp_tse</tt></td>
  </tr>
</table>
