//
//  ViewController.m
//  Focus
//
//  Created by Mike on 9/28/14.
//  Copyright (c) 2014 Mike Xia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
    @property (weak, nonatomic) IBOutlet UILabel *habitLabel;
    @property (weak, nonatomic) IBOutlet UILabel *timeLabel;
    @property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
    @property (weak, nonatomic) IBOutlet UITextField *focus;
@end

@implementation ViewController
@synthesize habitLabel;
@synthesize timeLabel;
@synthesize datePicker;
@synthesize focus;

-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    habitLabel.hidden = YES;
    timeLabel.hidden = YES;
    datePicker.hidden = YES;
    [self scheduleAlerts];
    return YES;
}


-(void) scheduleAlerts {
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    [localNotification setFireDate: datePicker.date];
    [localNotification setTimeZone: [NSTimeZone defaultTimeZone]];
    [localNotification setRepeatInterval: NSCalendarUnitDay];

    localNotification.alertBody = focus.text;
    localNotification.alertAction = NSLocalizedString(@"Okay", nil);
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

-(IBAction)check:(id)sender {
    
}

-(IBAction)giveUp:(id)sender {
    
}

-(NSString*) getFocus {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"focusText"];
}

-(NSDate*) getFocusDate {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"focusDate"];
}

-(void) setFocus {
    [[NSUserDefaults standardUserDefaults] setObject:focus.text forKey:@"focusText"];
    [[NSUserDefaults standardUserDefaults] setObject:datePicker.date forKey:@"focusDate"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [focus becomeFirstResponder];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
