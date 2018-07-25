---
layout: default
permalink: /downloads/APT_Repository/
sidebar: yes
---

### APT (Debian, Ubuntu)

Packages suitable for x86_64 are available via an APT repository. The repository and key can be installed with the following script:

```shell
wget -q -O - https://nexus.spaceapplications.com/repository/yamcs/keys/yamcs.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://nexus.spaceapplications.com/repository/yamcs/apt stable main" > /etc/apt/sources.list.d/yamcs.list'
```
