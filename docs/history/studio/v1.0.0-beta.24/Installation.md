---
layout: default
version: v1.0.0-beta.24
permalink: /docs/studio/v1.0.0-beta.24/Installation/
sidebar: yes
---

### Install Java 8
You will need Oracle Java 8 to be installed. We currently recommend the latest [Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html).

### Download Yamcs Studio
[Download](https://github.com/yamcs/yamcs-studio/releases) the latest Yamcs Studio release for your platform. Extract to your preferred location and launch it. When it asks you to choose a workspace, choose a new directory where you have write rights , e.g. under your home directory. Workspaces contain displays, scripts and user preferences. By default your workspace will be populated with a few sample projects. These projects contain displays that show simulated parameters as produced by a default-configured Yamcs Server.

### Troubleshooting
Most problems related to starting Yamcs Studio have to do with Java not being correctly detected, or by trying to launch Yamcs Studio with an old version of Java. Both of these issues are usually resolved by installing Oracle&nbsp;JDK&nbsp;8.

In case that didn't help, Try defining the <tt>-vm</tt> property in the root <tt>yamcs-studio.ini</tt> file. Refer to the instructions available at [https://wiki.eclipse.org/Eclipse.ini](https://wiki.eclipse.org/Eclipse.ini).
