---
layout: default
sidebar: yes
permalink: /docs/studio/Overview/
---

#### Brief History of Yamcs
Yamcs started as a server software first and foremost. While it initially started as a swiss-army knife to fill gaps in existing traditional mission control systems, it gradually grew to cover the whole spectrum of TM processing and TC commanding. Missions can have very specific software requirements, and often include a varied stack of software. Over the years Yamcs was extended in various ways to play nicely with different kinds of TM and TC software.

Along the way, standalone client GUIs were developed as the need arose. This includes Archive Browser, Event Viewer, Packet Viewer and Yamcs Monitor. These tools are being used in many missions.

For many years, however, the main thing that was felt missing from the Yamcs software stack, was a display solution. And this is where Yamcs Studio comes into play.

#### Yamcs Studio
Yamcs Studio is a desktop frontend to Yamcs. Its main attraction is its support for operator displays, but it also includes other facets that cover TC commanding and insight into various runtime aspects of Yamcs. Most of our legacy client GUIs have also been ported into Yamcs Studio (with the exception of the Packet Viewer), for an integrated solution.

Yamcs can be made to integrate with display software other than Yamcs Studio (and in fact, this is often the case in long-running missions where Yamcs was added in the mix after the project's initial conception), but there are advantages to working with Yamcs Studio:

* Increased semantical coherence
* Single point of contact
* Opportunities for customisation that covers both server and client
* Integrated operational views

#### Technology
Yamcs Studio is an Eclipse RCP application, and builds upon Open Source software libraries like CS-Studio, Netty, Protobuf and of course our own Yamcs API.

The main programming language is Java 8.

#### License
Yamcs Studio follows a similar licensing scheme as Yamcs Server. The core of Yamcs Studio is open-source and licensed under the Eclipse Public License. Mission-specific extensions can be developed on a case-by-case basis and under custom licenses.

We believe that having an open-source core, is not only fun and exciting, but that this increases the quality of our products and benefits all of our customers equally.
