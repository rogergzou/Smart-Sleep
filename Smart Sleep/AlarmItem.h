//
//  AlarmItem.h
//  Smart Sleep
//
//  Created by Roger on 2/14/14.
//  Copyright (c) 2014 handWave. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlarmItem : NSObject

@property (strong, nonatomic) NSDate *date;
@property (nonatomic) int seconds;

@end
