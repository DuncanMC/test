//
//  UITableView+indexPathForCellContainingView.m
//  test
//
//  Created by Duncan Champney on 4/15/13.
//  Copyright (c) 2013 Duncan Champney. All rights reserved.
//

#import "UITableView+indexPathForCellContainingView.h"

@implementation UITableView (indexPathForCellContainingView)

- (NSIndexPath *) indexPathForCellContainingView: (UIView *) view;
{
  //get the view's center point (which will be in it's parent view's coordinate system
  //And convert it to the table view's coorindate system
  CGPoint viewCenter = [self convertPoint: view.center fromView: view.superview];
  
  //Ask the table view which cell's index path contains that point.
  return [self indexPathForRowAtPoint: viewCenter];
}

@end
