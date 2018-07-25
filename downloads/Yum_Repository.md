---
layout: default
permalink: /downloads/Yum_Repository/
sidebar: yes
---

### RPM (RHEL, Fedora, CentOS)

Packages suitable for x86_64 are available via a yum repository. The repository and key can be installed with the following script:

```shell
sudo rpm --import https://nexus.spaceapplications.com/repository/yamcs/keys/yamcs.asc
sudo sh -c 'echo -e "[yamcs]\nname=Yamcs\nbaseurl=https://nexus.spaceapplications.com/repository/yamcs/rpm/stable/x86_64\nenabled=1\ngpgcheck=1\ngpgkey=https://nexus.spaceapplications.com/repository/yamcs/keys/yamcs.asc" > /etc/yum.repos.d/yamcs.repo'
```

### RPM (SLE, openSUSE)

Packages suitable for x86_64 are available via a zypper repository. The repository and key can be installed with the following script:

```shell
sudo rpm --import https://nexus.spaceapplications.com/repository/yamcs/keys/yamcs.asc
sudo sh -c 'echo -e "[yamcs]\nname=Yamcs\nbaseurl=https://nexus.spaceapplications.com/repository/yamcs/rpm/stable/x86_64\nenabled=1\ngpgcheck=1\ngpgkey=https://nexus.spaceapplications.com/repository/yamcs/keys/yamcs.asc" > /etc/zypp/repos.d/yamcs.repo'
```
