---
layout: default
permalink: /docs/api/Parameter_Updates/
sidebar: yes
---

Subscribe to parameter updates:

```json
[ 1, 1, :seq, {
    "parameter": "subscribe",
    "data": {
        "list": [
            { "namespace": ":namespace", "name": ":name" }
        ]
    }
} ]
```
    
Subscribing is an additive operation, where new parameter IDs are appended to any existing subscription.    

### Example

Subscribe to BatteryVoltage1 through a qualified name, and BatteryVoltage2 using an OPS name:

```json
[ 1, 1, 789, {
    "parameter": "subscribe",
    "data": {
        "list": [
            { "name": "/YSS/SIMULATOR/BatteryVoltage1" },
            { "namespace": "MDB:OPS Name", "name": "SIMULATOR_BatteryVoltage2" }
        ]
    }
} ]
```

### Response

You first get an empty reply message confirming the positive receipt of your request:

```json
[ 1, 2, 789 ]
```
    
Further messages will be marked as type <tt>PARAMETER_DATA</tt>. Directly after you subscribe, you will receive the latest cached values -- if applicable.

```json
todo
```


### Unsubscribe

Unsubscribe from all currently subscribed parameters:

```json
[ 1, 1, 790, { "parameter": "unsubscribe" } ]
```

This will be confirmed with an empty reply message:

```json
[ 1, 2, 790 ]
```
