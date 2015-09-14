---
layout: default
permalink: /docs/studio/installation/
---

## Yamcs Studio Installation

### Install Java 8
You will need Oracle Java 8 installed. We currently recommend the latest [Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html).

### Download Yamcs Studio
[Download](https://github.com/yamcs/yamcs-studio/releases) the latest client release for your platform. Extract to your preferred location and just launch it. When it asks you to choose a workspace, choose a new directory inside for example your home directory. Workspaces contain displays, scripts and user preferences. By default your workspace will be populated with a sample project called `YSS`. This project contains a few sample displays that show simulated parameters as produced by a default-configured Yamcs Server.

### Troubleshooting
Most problems related to starting Yamcs Studio, have to do with Java not being correctly detected, or by trying to launch Java with an old version of Java. Both of these issues are usually resolved by installing Oracle JDK 8.

In case that didn't help, Try defining the `-vm` property in the root `yamcs-studio.ini` file. Refer to [these instructions](https://wiki.eclipse.org/Eclipse.ini).
