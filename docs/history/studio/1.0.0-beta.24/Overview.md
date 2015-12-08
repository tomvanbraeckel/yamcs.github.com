---
layout: default
sidebar: yes
version: 1.0.0-beta.24
permalink: /docs/studio/1.0.0-beta.24/Overview/
---

### Brief History of Yamcs
Yamcs started out as a server software. While it was initially conceived as a swiss-army knife to fill the gaps in existing traditional mission control systems, it gradually grew to cover the whole spectrum of TM processing and TC commanding. Missions can have very specific software requirements, and often include a varied stack of software. Throughout the years Yamcs was extended in various ways in order to interact perfectly with different kinds of TM and TC software.

Along the way, standalone client GUIs were developed as needed. These include the Archive Browser, Event Viewer, Packet Viewer and Yamcs Monitor. These tools are being used in many missions.

An extensive list of tools, but with a gap. It was felt a display solution was needed to fill this missing part and with this need in mind, Yamcs Studio was created.

### Yamcs Studio
Yamcs Studio is a desktop frontend to Yamcs. Its main attraction is its support for operator displays, but it also includes other facets that cover TC commanding and insight into various runtime aspects of Yamcs. Most of our legacy client GUIs have by now been ported into Yamcs Studio (with the exception of the Packet Viewer), for an integrated solution.

Yamcs can be integrated within a display software other than Yamcs Studio (and in fact, this is often the case in long-running missions where Yamcs was added in the mix after the project's initial conception), but there are advantages to working with Yamcs Studio:

* Increased semantical coherence
* Single point of contact
* Opportunities for customisation that covers both server and client
* Integrated operational views

### Technology
Yamcs Studio is an Eclipse RCP application, and builds upon Open Source software libraries like CS-Studio, Netty, Protobuf and of course our own Yamcs API.

The main programming language is Java 8.

### License
Yamcs Studio follows a similar licensing scheme as Yamcs Server. The core of Yamcs Studio is open-source and licensed under the Eclipse Public License. Mission-specific extensions can be developed on a case-by-case basis and under custom licenses.

We believe that having an open-source core, is not only fun and exciting, but that this increases the quality of our products and benefits all of our customers equally.
