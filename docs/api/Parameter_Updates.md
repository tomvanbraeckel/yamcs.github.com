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
[1, 4, 2, {
        "dt": "PARAMETER",
        "data": {
                "parameter": [{
                        "id": {
                                "name": "/YSS/SIMULATOR/BatteryVoltage1"
                        },
                        "rawValue": {
                                "type": "UINT32",
                                "uint32Value": 10
                        },
                        "engValue": {
                                "type": "UINT32",
                                "uint32Value": 10
                        },
                        "acquisitionTime": 1514993937058,
                        "generationTime": 1514993932468,
                        "acquisitionStatus": "ACQUIRED",
                        "processingStatus": true,
                        "monitoringResult": "IN_LIMITS",
                        "acquisitionTimeUTC": "2018-01-03T15:38:20.058Z",
                        "generationTimeUTC": "2018-01-03T15:38:15.468Z",
                        "expirationTime": 1514993950358,
                        "expirationTimeUTC": "2018-01-03T15:38:33.358Z",
                        "alarmRange": [{
                                "level": "CRITICAL",
                                "minInclusive": 9.0,
                                "maxInclusive": 15.0
                        }],
                        "expireMillis": 13300
                }, {
                        "id": {
                                "name": "SIMULATOR_BatteryVoltage2",
                                "namespace": "MDB:OPS Name"
                        },
                        "rawValue": {
                                "type": "UINT32",
                                "uint32Value": 192
                        },
                        "engValue": {
                                "type": "UINT32",
                                "uint32Value": 192
                        },
                        "acquisitionTime": 1514993937058,
                        "generationTime": 1514993932468,
                        "acquisitionStatus": "ACQUIRED",
                        "processingStatus": true,
                        "monitoringResult": "CRITICAL",
                        "rangeCondition": "HIGH",
                        "acquisitionTimeUTC": "2018-01-03T15:38:20.058Z",
                        "generationTimeUTC": "2018-01-03T15:38:15.468Z",
                        "expirationTime": 1514993950358,
                        "expirationTimeUTC": "2018-01-03T15:38:33.358Z",
                        "alarmRange": [{
                                "level": "CRITICAL",
                                "minInclusive": 2.0,
                                "maxInclusive": 15.0
                        }],
                        "expireMillis": 13300
                }]
        }
}]
```


### Unsubscribe

Unsubscribe from selected parameter updatess:

```json
[ 1, 1, 790, {
    "parameter": "unsubscribe" 
    "data": {
        "list": [
            { "name": "/YSS/SIMULATOR/BatteryVoltage1" },
            { "namespace": "MDB:OPS Name", "name": "SIMULATOR_BatteryVoltage2" }
        ]
    }} ]
```

This will be confirmed with an empty reply message:

```json
[ 1, 2, 790 ]
```


### Unsubscribe all
Unsubscribe from all parameter updatess:

```json
[ 1, 1, 790, {
    "parameter": "unsubscribeAll"
} ]
```

This will be confirmed with an empty reply message:

```json
[ 1, 2, 790 ]
```
