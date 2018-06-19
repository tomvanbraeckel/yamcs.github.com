---
layout: default
sidebar: yes
chapter: yes
permalink: /docs/server/Instance_Services/
---

Yamcs functionality is modularised into different services, representing objects with operational state, with methods to start and stop. Yamcs acts as a container for services, each running in a different thread. Services carry out a specific function. Some services are vital to core functionality, others can be thought of as more optional and give Yamcs its pluggable nature.

Services appear at three different conceptual levels:

1. **Global services** provide functionality across all instances.
2. **Instance services** provide functionality for one specific instance.
3. **Processor services** provide functionality for one specific processor.
