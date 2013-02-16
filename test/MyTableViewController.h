//
//  MyTableViewController.h
//  test
//
//  Created by Duncan Champney on 2/15/13.
//  Copyright (c) 2013 Duncan Champney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StaticTableParentProtocol.h"
#import "StaticTableViewControllerProtocol.h"

@interface MyTableViewController : UITableViewController <StaticTableViewControllerProtocol>

{
  BOOL wasSelected;
}


@property (nonatomic, weak) UIViewController <StaticTableParentProtocol> *delegate;

//-----------------------------------------------------------------------------------------------------------
#pragma mark - Public interface methods
//-----------------------------------------------------------------------------------------------------------

- (void) deselectItemsWithAnimation: (BOOL) animation;

//-----------------------------------------------------------------------------------------------------------
#pragma mark - IBAction methods
//-----------------------------------------------------------------------------------------------------------

- (IBAction)cellButtonTapped:(id)sender;

@end
