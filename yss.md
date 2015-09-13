---
layout: default
title: Up & Running
permalink: /running/
weight: 20
top: yes
---

Yamcs deployment details can vary greatly from mission to mission. To present an overall feel of the core system, we have created a sample configuration, which we call the **Yamcs Simulation System (YSS)**.

# Yamcs Simulation System (YSS)

The YSS configuration is very simplistic by design, showcasing only core functionality. In the backend, it includes just two servers: **Yamcs** and a basic **Simulator**. These servers are set-up to exchange TM and TC. In the frontend, we connect sample operator displays that were authored in **Yamcs Studio**, as well as a selection of built-in displays (Archive, Command Stack, etc.). From Yamcs Studio we can send commands to Yamcs, which in turn will verify and issue them to the Simulator.

Running YSS is easy and straight-forward, but there are a few requirements you'll need to make sure your system has before you start. In particular this showcase uses `docker` and `docker-compose` to run container images that are prebuilt by the core Yamcs development team, and updated together with every Yamcs release.

## Install Docker

Detailed installation instructions can be found at [https://docs.docker.com/installation/](https://docs.docker.com/installation/). For example, on Ubuntu 14.04 LTS the simplest install would be something like:

    $ curl -sSL https://get.docker.com/ | sh

Verify correct installation by running `sudo docker -v`.

Docker's official documentation also explains how to set up `docker` so that you don't need to prepend every command with `sudo`. Further instructions presume that `docker` was configured as such, and will no longer mention the use of `sudo`. 

## Install Docker Compose

Detailed installation instructions can be found at [https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/). It boils down to this:

1. Get the `docker-compose` binary.

        $ sudo wget https://github.com/docker/compose/releases/download/1.4.0/docker-compose-`uname  -s`-`uname -m` -O /usr/local/bin/docker-compose

    This command installs the binary in the `/usr/local/bin` directory. 
	
2. Add executable permissions to the binary.

        $ sudo chmod +x /usr/local/bin/docker-compose
		
## Run the Yamcs Simulation System (YSS)

1. In your terminal, navigate to the `yamcs/contrib/yss` directory

    This directory includes a `docker-compose.yml` configuration that
    links a basic yamcs server together with a sample simulator.

2. Build YSS.

        $ docker-compose build
		
    The command outputs its progress until it completes.

4. Start your YSS configuration with compose.

        $ docker-compose up   
	
## Explore a bit

We now have a working yamcs server receiving and recording telemetry from a simulator. To get a better peek at what's happening we will now install Yamcs Studio -- a rich desktop client for Yamcs.
