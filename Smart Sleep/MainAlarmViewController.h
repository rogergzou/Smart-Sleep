//
//  MainAlarmViewController.h
//  Smart Sleep
//
//  Created by Roger on 2/13/14.
//  Copyright (c) 2014 handWave. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModifyAlarmTimeViewController.h"

@interface MainAlarmViewController : UIViewController <TimeModalDelegate>

@property (nonatomic) int seconds;


@end
