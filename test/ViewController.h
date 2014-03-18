//
//  ViewController.h
//  test
//
//  Created by Duncan Champney on 2/15/13.
//  Copyright (c) 2013 WareTo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTableViewController.h"
#import "StaticTableViewControllerProtocol.h"
#import "StaticTableParentProtocol.h"

@interface ViewController : UIViewController <StaticTableParentProtocol>

//-----------------------------------------------------------------------------------------------------------
#pragma mark - instance variables
//-----------------------------------------------------------------------------------------------------------

{
}

//-----------------------------------------------------------------------------------------------------------
#pragma mark - properties
//-----------------------------------------------------------------------------------------------------------

@property (strong, nonatomic) IBOutlet UILabel *messageLabel;
@property (nonatomic, weak) UITableViewController <StaticTableViewControllerProtocol> *firstTableViewController;
@property (nonatomic, weak) UITableViewController <StaticTableViewControllerProtocol> *secondTableViewController;

//-----------------------------------------------------------------------------------------------------------
#pragma mark - actions
//-----------------------------------------------------------------------------------------------------------

- (IBAction)buttonAction: (UIButton *) sender;

//-----------------------------------------------------------------------------------------------------------
#pragma mark - StaticTableParentProtocol methods
//-----------------------------------------------------------------------------------------------------------


@end
