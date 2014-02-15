//
//  AlarmItem.m
//  Smart Sleep
//
//  Created by Roger on 2/14/14.
//  Copyright (c) 2014 handWave. All rights reserved.
//

#import "AlarmItem.h"

@interface AlarmItem()

@end

@implementation AlarmItem

-(NSDate *)date
{
    if (!_date)
        _date = [NSDate date];
    return _date;
}

-(int) seconds
{
    if (!_seconds)
        _seconds = 0;
    return _seconds;
}

@end
