//
//  StaticTableParentProtocol.h
//  test
//
//  Created by Duncan Champney on 2/16/13.
//  Copyright (c) 2013 Duncan Champney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "StaticTableViewControllerProtocol.h"

@protocol StaticTableParentProtocol <NSObject>

@optional

- (void) tableView: (UITableView *) tableView
         didSelect: (BOOL) select
   cellAtIndexPath: (NSIndexPath *)indexPath
 inViewController : (UIViewController <StaticTableViewControllerProtocol> *) viewController;

- (void) tableView: (UITableView *) tableView
     clickedButton: (UIButton *) button
       atIndexPath: (NSIndexPath *) buttonIndexPath
  inViewController: (UITableViewController <StaticTableViewControllerProtocol>*) viewController;

@end
