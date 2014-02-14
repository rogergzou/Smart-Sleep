//
//  MainAlarmViewController.m
//  Smart Sleep
//
//  Created by Roger on 2/13/14.
//  Copyright (c) 2014 handWave. All rights reserved.
//

#import "MainAlarmViewController.h"

@interface MainAlarmViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *SetAlarm;
@property (weak, nonatomic) IBOutlet UITableView *alarmTable;



@end

@implementation MainAlarmViewController


- (void) updateUI
{
    self.timeLabel.text = [NSString stringWithFormat:@"%i seconds", self.seconds];
}

- (IBAction)modifyPressed:(id)sender {
    [self performSegueWithIdentifier:@"modifyIt" sender:sender];
}

- (IBAction)alarmPressed:(id)sender {
    NSDate *alarmTime = [[NSDate date] dateByAddingTimeInterval:self.seconds];
    // need to set alarm, add the minute :O
    
    UILocalNotification *alarmNotification =[[UILocalNotification alloc]init];
    alarmNotification.fireDate = alarmTime;
    alarmNotification.alertBody = [NSString stringWithFormat: @"alert fired %@ %i", alarmTime, self.seconds];
    alarmNotification.soundName = UILocalNotificationDefaultSoundName;
    //alarmNotification.applicationIconBadgeNumber = 1;
    [[UIApplication sharedApplication] scheduleLocalNotification:alarmNotification];
    NSLog(@"scheduld for %@ %i", alarmTime, self.seconds);
    
    //[self addAlarmToTableWithDate:alarmTime secondInterval:self.seconds];
    
}
/* nvm will do later
#define ALARM_TABLE_KEY @"AlarmTableResults_All"
+ (NSArray *) alarmItemsInTable
{
    NSMutableArray *theresults = [NSMutableArray array];
    
    for (id lists in [[[NSUserDefaults standardUserDefaults]dictionaryForKey:ALARM_TABLE_KEY] allValues])
    {
        AlarmItem *
    }
    
    
    return theresults;
}

-(void)addAlarmToTableWithDate: (NSDate *)date secondInterval:(int)secs
{
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    
    
    
    
    [userdefaults synchronize];
}


-(void)addAlarmTable:(NSSet *)objects
{
    
}
 */
/*- (IBAction)unwindToList:(UIStoryboardSegue *)sender
{
 
    xyzXYZAddToDoItemViewController *source = [sender sourceViewController];
    xyzXYZToDoItem *item = source.toDoItem;
    if (item != nil) {
        [self.toDoItems addObject:item];
        [self.tableView reloadData];
    
    }
 
}*/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"modifyIt"])
    {
        ModifyAlarmTimeViewController *svc = (ModifyAlarmTimeViewController *)segue.destinationViewController;
        svc.myDelegate = self;
    }
}

- (void)modalViewControllerDismissed:(int)intToPass
{
    self.seconds = intToPass;
    NSLog(@"received %i", intToPass);
    [self updateUI];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self updateUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

const int DEFAULT_SEC = 5;
- (int) seconds
{
    if (!_seconds)
        _seconds = DEFAULT_SEC;
    return _seconds;
}

@end
