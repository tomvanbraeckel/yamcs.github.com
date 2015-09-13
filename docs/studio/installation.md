---
layout: default
permalink: /docs/studio/installation/
---

## Yamcs Studio Installation

### Install JDK
You will need a Java 8 runtime in your path. Verify you see something simular by running this command:
```
$ javac -version
javac 1.8.0_31
[...]
```
Install a Java 8 runtime if you don't see similar output. We currently recommend the latest [Oracle JDK](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html). Alternatively, you can target Yamcs Studio to the Java runtime of your choice by defining the `-vm` property in the root `yamcs-studio.ini` file (refer to [these instructions](https://wiki.eclipse.org/Eclipse.ini)).

### Download Yamcs Studio
[Download](https://github.com/yamcs/yamcs-studio/releases) the latest client release for your platform. Extract to your preferred location and just launch it. You'll be greeted with a workspace containing a `Sample MCS` project. This Mission Control System contains some sample displays that show simulated parameters as produced by a default-configured Yamcs Server.

### Configure connection to Yamcs
By default Yamcs Studio will connect to a server instance of the Yamcs Mission Control System running on localhost. Depending on how Yamcs was deployed at your site, you may need to update these connection properties by opening the preferences from the menu and going to the `Yamcs` preference page.

Saved preferences and log files are all stored under the `.metadata/` folder of your workspace.

### Your first display
Create an empty OPI (Operator Interface) file in your project. drag the `Text Update` widget to your editor. In the properties pane set `PVName` to `para://TODO`. Actually the `para://` prefix is optional, so you may as well just set `PVName` to `TODO`. Save your changes, and click on the green Launch button. The OPI runtime will open in a new window showing incoming TODO from Yamcs.

