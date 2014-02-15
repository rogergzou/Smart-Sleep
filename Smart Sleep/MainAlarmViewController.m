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
@property (strong, nonatomic) NSMutableArray *tableItems;


@end

@implementation MainAlarmViewController


- (void) updateUI
{
    self.timeLabel.text = [NSString stringWithFormat:@"%i seconds", self.seconds];
    
    //update table
    
    [self.alarmTable reloadData];
}

- (void) loadInitialTableData
{
    AlarmItem *item1 = [[AlarmItem alloc]init];
    item1.date = [NSDate date];
    item1.seconds = 12345;
    [self.tableItems addObject:item1];
    
}

- (IBAction)modifyPressed:(id)sender {
    [self performSegueWithIdentifier:@"modifyIt" sender:sender];
}

- (IBAction)alarmPressed:(id)sender {
    NSDate *alarmTime = [[NSDate date] dateByAddingTimeInterval:self.seconds];
    // need to set alarm, add the minute :O
    
    UILocalNotification *alarmNotification =[[UILocalNotification alloc]init];
    alarmNotification.fireDate = alarmTime;
    alarmNotification.alertBody = [NSString stringWithFormat: @"hey my alert fired %@ %i", alarmTime, self.seconds];
    alarmNotification.soundName = UILocalNotificationDefaultSoundName;
    //alarmNotification.applicationIconBadgeNumber = 1;
    [[UIApplication sharedApplication] scheduleLocalNotification:alarmNotification];
    NSLog(@"scheduld for %@ %i", alarmTime, self.seconds);
    
    [self addAlarmToTableWithDate:alarmTime secondInterval:self.seconds];
    
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
 NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
 
 
 
 
 [userdefaults synchronize];
 
    return theresults;
}
*/
-(void)addAlarmToTableWithDate: (NSDate *)date secondInterval:(int)secs
{
    AlarmItem *newItem = [[AlarmItem alloc]init];
    newItem.date = date;
    newItem.seconds=secs;
    [self.tableItems addObject:newItem];
    /*NSArray *index = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]];
    [self.alarmTable insertRowsAtIndexPaths:index withRowAnimation:UITableViewRowAnimationLeft];*/
    [self updateUI];
}

/*
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

- (NSMutableArray *)tableItems
{
    if (!_tableItems)
        _tableItems = [NSMutableArray array];
    return _tableItems;
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
    // set up initial table
    [self loadInitialTableData];
    
    [self updateUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// lazy instantiation, default settings

const int DEFAULT_SEC = 5;
- (int) seconds
{
    if (!_seconds)
        _seconds = DEFAULT_SEC;
    return _seconds;
}


#pragma mark - Table view data source


// commented out so static data shows up
// JK to implement UITableViewDataSource protocol, uncommented.


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1; //changed from 0
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    //return 0;
    return [self.tableItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // I have no idea what this does...
    
    static NSString *cellIdentifier = @"AlarmWorkCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (cell == nil)
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    // Configure the cell...
    
    AlarmItem *theItem = self.tableItems[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat: @"secs %i, date %@", theItem.seconds, theItem.date];
    
    // implement later
    /*
    if (time is past) {
        delete it
    }
    */
    return cell;
}




/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    //AlarmItem *tappedItem = self.tableItems[indexPath.row];
    //tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}


@end
