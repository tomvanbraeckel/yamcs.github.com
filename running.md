---
layout: default
permalink: /running/
sidebar: no
title: Up & Running
---

Yamcs deployment details can vary greatly from mission to mission. To present an overall feel of the core system, we have created a sample configuration, which we call the **Yamcs Simulation System (YSS)**.

The YSS configuration is simple by design, showcasing only core functionality. In the backend, it includes just two servers: **Yamcs** and a generic **Simulator**. These servers are set-up to exchange TM and TC. In the frontend, we connect sample operator displays that were authored in **Yamcs Studio**, as well as a selection of built-in displays (Archive, Command Stack, etc.). From Yamcs Studio we can send commands to Yamcs, which in turn will verify and issue them to the Simulator.

Running YSS is easy and straight-forward, but there are a few requirements you'll need to make sure your system has before you start. In particular this showcase uses <tt>docker</tt> and <tt>docker-compose</tt> to run container images that are prebuilt by the core Yamcs development team, and updated together with every Yamcs release.

On this page:

* TOC
{:toc}

## Install Docker

Detailed installation instructions can be found at [https://docs.docker.com/installation/](https://docs.docker.com/installation/). For example, on Ubuntu 14.04 LTS the simplest install would be something like:

    $ curl -sSL https://get.docker.com/ | sh
    
Docker's official documentation also explains how to set up <tt>docker</tt> so that you don't need to prepend every command with <tt>sudo</tt>, which we definitely recommend. Further instructions presume that <tt>docker</tt> was configured as such, and will no longer mention the use of `sudo`.

Verify correct installation by running <tt>docker -v</tt>. 

## Install Docker Compose

Detailed installation instructions can be found at [https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/). It boils down to this:

1. Get the <tt>docker-compose</tt> binary.

        $ sudo wget https://github.com/docker/compose/releases/download/1.4.0/docker-compose-`uname  -s`-`uname -m` -O /usr/local/bin/docker-compose

    This command installs the binary in the <tt>/usr/local/bin</tt> directory. 
	
2. Add executable permissions to the binary.

        $ sudo chmod +x /usr/local/bin/docker-compose
        
Verify correct installation by running <tt>docker-compose -v</tt>. Any problems related to this latest command usually have to do with either not having started the docker daemon (for some platforms this is automatically configured, for others not), or by not having added your user to the <tt>docker</tt> group. Please ask a yamcs developer for further assistance specific to your platform if you get stuck on this.
		
## Run Yamcs and the Simulator

With all the preparations done, we now get to run a Yamcs instance in a box (well, container).

1. Get the YSS configuration. You have the choice between two different configurations:

    * A 5Hz Launch &amp; Landing simulator
    
            $ curl -sSL http://www.yamcs.org/yss/landing.sh | sh
            $ cd landing
    
    * A 1Hz LEO Spacecraft simulator

            $ curl -sSL http://www.yamcs.org/yss/leo_spacecraft.sh | sh
            $ cd leo_spacecraft

    This will create a directory <tt>landing/</tt> or <tt>leo_spacecraft/</tt> under your current working directory with some configuration files needed to link the Yamcs container with the Simulator container.

2. Start your YSS deployment with compose.
    
        $ docker-compose up       
    
    This will download, then launch both Yamcs and the Simulator in the foreground. You should see some log messages and the phrase  *yamcsstartup success* near the bottom.
    
    When you're done with testing and want to shutdown the deployment, just <tt>CTRL-c</tt> this process. Later on, whenever you want the YSS configuration back up again, go to the applicable directory and run <tt>docker-compose up</tt>.
    
**Note:** If you are upgrading from a previous version, remove your current configuration, and re-execute Step&nbsp;1. Replace Step&nbsp;2 with:

    $ docker-compose build
    $ docker-compose up --force-recreate


## Run Yamcs Studio

We now have a working Yamcs Server receiving and recording telemetry from a Simulator. To get a better peek at what's happening we will now launch Yamcs Studio -- a rich desktop client for Yamcs. Make sure you have Yamcs Studio installed (refer to [these instructions](/docs/studio/installation)). From the menu choose **File > Connect...** and fill in these details:

![YSS Connection](/assets/main/yss-connect.png){: .center-image }

Soon after clicking the **Connect** button, you should notice the processor in the top bar updating to <tt>realtime</tt>.

Now, open a sample display by clicking on **Bookmarks** in the top bar. Note that none of these YSS displays are perfect. There are non-sensical things in them. Most widgets are backed by TM from the simulator, but some widgets are unconnected, others use locally simulated values using in-display functions. 

The displays you should open depends on the YSS configuration that you are currently running with (otherwise the display widgets would not be able to connect).

* If you started the Landing configuration, then choose *YSS Landing: Flight Data*.  When you run this display for a while it might look like this (the simulator will loop forever).

    ![YSS Flight Data](/assets/main/yss-flight-data.png){: .center-image }
    
* If you started the LEO Spacecraft configuration, then choose *YSS LEO Spacecraft: Main*. In its current state, the display is a bit bare-bones. But it does enable us to have a peek at what is being generated by the simulator. And we can use this blank slate to test out the display authoring in Yamcs Studio.

    ![YSS Flight Data](/assets/main/yss-leo-spacecraft.png){: .center-image }

For more on Yamcs Studio, see [Yamcs Studio User Guide](/docs/studio/).
