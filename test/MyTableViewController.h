//
//  MyTableViewController.h
//  test
//
//  Created by Duncan Champney on 2/15/13.
//  Copyright (c) 2013 Duncan Champney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewController : UITableViewController

{
  BOOL wasSelected;
}

//-----------------------------------------------------------------------------------------------------------
#pragma mark - Public interface methods
//-----------------------------------------------------------------------------------------------------------

- (void) deselectItemsWithAnimation: (BOOL) animation;

@end
