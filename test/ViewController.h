//
//  ViewController.h
//  test
//
//  Created by Duncan Champney on 2/15/13.
//  Copyright (c) 2013 WareTo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTableViewController.h"

@interface ViewController : UIViewController

//-----------------------------------------------------------------------------------------------------------
#pragma mark - instance variables
//-----------------------------------------------------------------------------------------------------------

{
}
//-----------------------------------------------------------------------------------------------------------
#pragma mark - properties
//-----------------------------------------------------------------------------------------------------------

@property (strong, nonatomic) IBOutlet UILabel *messageLabel;
@property (nonatomic, weak) MyTableViewController *firstTableViewController;
@property (nonatomic, weak) MyTableViewController *secondTableViewController;

//-----------------------------------------------------------------------------------------------------------
#pragma mark - actions
//-----------------------------------------------------------------------------------------------------------

- (IBAction)buttonAction: (UIButton *) sender;

@end
