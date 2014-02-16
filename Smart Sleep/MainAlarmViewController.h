//
//  MainAlarmViewController.h
//  Smart Sleep
//
//  Created by Roger on 2/13/14.
//  Copyright (c) 2014 handWave. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModifyAlarmTimeViewController.h"
#import "AlarmItem.h"

@interface MainAlarmViewController : UIViewController <TimeModalDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) int seconds;
@property (nonatomic) int minutes;


@end
