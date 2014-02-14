//
//  ModifyAlarmTimeViewController.h
//  Smart Sleep
//
//  Created by Roger on 2/13/14.
//  Copyright (c) 2014 handWave. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TimeModalDelegate <NSObject>
-(void) modalViewControllerDismissed:(int)intToPass;
@end

@interface ModifyAlarmTimeViewController : UIViewController
{
    id timeDelegate;
}

@property (nonatomic, weak) id<TimeModalDelegate> myDelegate;
@property (nonatomic, strong) NSArray *secondList;

@end
