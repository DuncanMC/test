//
//  UITableView+indexPathForCellContainingView.h
//  test
//
//  Created by Duncan Champney on 4/15/13.
//  Copyright (c) 2013 Duncan Champney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (indexPathForCellContainingView)

- (NSIndexPath *) indexPathForCellContainingView: (UIView *) view;

@end
