//
//  ModifyAlarmTimeViewController.m
//  Smart Sleep
//
//  Created by Roger on 2/13/14.
//  Copyright (c) 2014 handWave. All rights reserved.
//

#import "ModifyAlarmTimeViewController.h"

@interface ModifyAlarmTimeViewController ()


@property (weak, nonatomic) IBOutlet UIPickerView *seconds;


@end

@implementation ModifyAlarmTimeViewController

@synthesize myDelegate;


- (IBAction)timeModifiedButtonPressed:(id)sender {
    
    int numofsec = [[self.secondList objectAtIndex:[self.seconds selectedRowInComponent:0]]intValue];
    if ([self.myDelegate respondsToSelector:@selector(modalViewControllerDismissed:)])
    {
        [self.myDelegate modalViewControllerDismissed:numofsec];
        NSLog(@"passed %@", [self.secondList objectAtIndex:[self.seconds selectedRowInComponent:0]]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"dismissed, %@", [self.secondList objectAtIndex:[self.seconds selectedRowInComponent:0]]);
    
}


#pragma mark -
#pragma mark PickerView DataSource

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}


const int SECOND = 4;

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    switch (pickerView.tag) {
        case SECOND:
            return [self.secondList count];
            break;
        default:
            return 0; //FAIL
            break;
    }
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (pickerView.tag) {
        case SECOND:
            return self.secondList[row];
            break;
        default:
            return nil; //FAIL
            break;
    }
}

const int NUMBER_OF_SECONDS_IN_SECONDLIST = 59;
const int SECONDS_INCREMENT = 5;
-(NSArray *)secondList
{
    if (!_secondList)
    {
        NSMutableArray *placeholderArray = [NSMutableArray array];
        for (int i = 0; i <= NUMBER_OF_SECONDS_IN_SECONDLIST; i++) {
            if ( i % SECONDS_INCREMENT == 0)
                [placeholderArray addObject:[NSString stringWithFormat:@"%i", i]];
        }
        _secondList = placeholderArray;
    }
    return _secondList;
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
