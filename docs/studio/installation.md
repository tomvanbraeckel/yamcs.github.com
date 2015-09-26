---
layout: default
permalink: /docs/studio/Installation/
sidebar: yes
---

#### Install Java 8
You will need Oracle Java 8 installed. We currently recommend the latest [Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html).

#### Download Yamcs Studio
[Download](https://github.com/yamcs/yamcs-studio/releases) the latest Yamcs Studio release for your platform. Extract to your preferred location and just launch it. When it asks you to choose a workspace, choose a new directory inside for example your home directory. Workspaces contain displays, scripts and user preferences. By default your workspace will be populated with a few sample projects. These projects contains displays that show simulated parameters as produced by a default-configured Yamcs Server.

#### Troubleshooting
Most problems related to starting Yamcs Studio, have to do with Java not being correctly detected, or by trying to launch Yamcs Studio with an old version of Java. Both of these issues are usually resolved by installing Oracle&nbsp;JDK&nbsp;8.

In case that didn't help, Try defining the `-vm` property in the root `yamcs-studio.ini` file. Refer to [these instructions](https://wiki.eclipse.org/Eclipse.ini).
