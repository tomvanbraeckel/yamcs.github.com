---
layout: default
permalink: /docs/studio/Installation/
sidebar: yes
---

### Prerequisites
Java 8 or higher must be installed. We currently recommend the latest [Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html).

64-bit packages are generated for Linux, Windows and Mac OS.

### Install Manually
[Download](https://github.com/yamcs/yamcs-studio/releases) the latest Yamcs Studio release for your platform. Extract to your preferred location and launch it. When it asks you to choose a workspace, choose a new directory where you have write rights , e.g. under your home directory. Workspaces contain displays, scripts and user preferences. By default your workspace will be populated with a few sample projects. These projects contain displays that show simulated parameters as produced by a default-configured Yamcs Server.

### Install from Repository

On Linux distributions you can install the open-source version of Yamcs Studio via a package repository. Configure the Yamcs repository appropriate to your distribution following the [repository instructions](/downloads/Yum_Repository/).

#### RPM (RHEL, Fedora, CentOS)

Install via <tt>dnf</tt> (or <tt>yum</tt> on older distributions)

    $ dnf check-update
    $ sudo dnf install yamcs-studio

#### RPM (SLE, openSUSE)

    $ sudo zypper refresh
    $ sudo zypper install yamcs-studio

#### APT (Debian, Ubuntu)

    $ sudo apt-get update
    $ sudo apt-get install yamcs-studio


### Troubleshooting
Most problems related to starting Yamcs Studio have to do with Java not being correctly detected, or by trying to launch Yamcs Studio with an old version of Java. Both of these issues are usually resolved by installing Oracle&nbsp;JDK&nbsp;8.

In case that didn't help, Try defining the <tt>-vm</tt> property in the root <tt>Yamcs Studio.ini</tt> file. Refer to the instructions available at [https://wiki.eclipse.org/Eclipse.ini](https://wiki.eclipse.org/Eclipse.ini).
