---
layout: default
version: v1.0.0-beta.24
permalink: /docs/studio/v1.0.0-beta.24/Capturing_Log_Output/
sidebar: yes
---

In case you need to debug an issue with a deployed Yamcs Studio client, it can be useful to capture the logging output. Instructions are specific to the platform.

#### Linux

Launch the executable from a terminal window while redirecting all output to a file named <tt>log.txt</tt>

    ./Yamcs\ Studio >log.txt 2>&1


#### Mac OS X

With Terminal navigate into the Yamcs Studio application bundle and launch the executable directly from there while redirecting all output to a file named <tt>log.txt</tt>. For example:

    cd Yamcs\ Studio.app/Contents/MacOS
    ./Yamcs\ Studio >log.txt 2>&1

#### Windows

With Command Prompt navigate into the location where you installed Yamcs Studio and launch the executable while redirecting all output to a file named <tt>log.txt</tt>. For example:

    "Yamcs Studio.exe" >log.txt 2>&1
