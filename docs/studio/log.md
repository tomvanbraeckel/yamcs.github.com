---
layout: default
permalink: /docs/studio/log/
sidebar: yes
---

## Capturing Log Output
In case you need to debug an issue with a deployed Yamcs Studio client, it can be useful to capture the logging output. Instructions are specific to the platform.

### Linux

Launch the `Yamcs Studio` executable from a terminal window while redirecting all output to a file named `log.txt`

    ./Yamcs\ Studio >log.txt 2>&1


### Mac OS X

With `Terminal` navigate into the Yamcs Studio application bundle and launch `./Yamcs Studio` directly
from there while redirecting all output to a file named `log.txt`. For example:

    cd Yamcs\ Studio.app/Contents/MacOS
    ./Yamcs\ Studio >log.txt 2>&1

### Windows

With `Command Prompt` navigate into the location where you installed Yamcs Studio and launch `Yamcs Studio.exe` while redirecting all output to a file named `log.txt`. For example:

    "Yamcs Studio.exe" >log.txt 2>&1
