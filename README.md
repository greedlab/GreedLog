# GreedLog [![Build Status](https://travis-ci.org/greedlab/GreedLog.svg?branch=master)](https://travis-ci.org/greedlab/GreedLog)
log for ios
# Installation
pod 'GreedLog'
# Usage
[GRLog.h](https://github.com/greedlab/GreedLog/blob/master/GreedLog/GRLog.h)

```objc
#import "GRLog.h"

- (void)testLog
{
    [GRLog setGRLogLevel:GRLogLevelDebug];
    GRLog(@"Demo for GRLog");
    GRLogEmergency(@"Demo for GRLogEmergency");
    GRLogAlert(@"Demo for GRLogAlert");
    GRLogCritical(@"Demo for GRLogCritical");
    GRLogError(@"Demo for GRLogError");
    GRLogWarning(@"Demo for GRLogWarning");
    GRLogNotice(@"Demo for GRLogNotice");
    GRLogInfo(@"Demo for GRLogInfo");
    GRLogDebug(@"Demo for GRLogDebug");
    NSLog(@"Demo for NSLog");
}

```

# Release Notes
* 0.0.1 first version
* 0.0.2 change GRLogLevel to NSInteger

# LICENSE
MIT
