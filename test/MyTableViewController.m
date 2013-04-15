//
//  MyTableViewController.m
//  test
//
//  Created by Duncan Champney on 2/15/13.
//  Copyright (c) 2013 Duncan Champney. All rights reserved.
//
//  test change

#import "MyTableViewController.h"
#import "UITableView+indexPathForCellContainingView.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController

//-----------------------------------------------------------------------------------------------------------
#pragma mark - instance methods
//-----------------------------------------------------------------------------------------------------------

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//-----------------------------------------------------------------------------------------------------------

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-----------------------------------------------------------------------------------------------------------
#pragma mark - Table view data source
//-----------------------------------------------------------------------------------------------------------

//We don't need table view data source methods for a static table. (yay!)


//-----------------------------------------------------------------------------------------------------------
#pragma mark - Table view delegate
//-----------------------------------------------------------------------------------------------------------


//This method remembers if the cell was already selected, so we can toggle the selected state.

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSIndexPath *currentSelection = [self.tableView indexPathForSelectedRow];
  wasSelected = [indexPath compare: currentSelection] == NSOrderedSame;
  return indexPath;
}

//-----------------------------------------------------------------------------------------------------------

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  //If the cell started out selected, un-select it.
  if (wasSelected)
  {
    [self.tableView deselectRowAtIndexPath: indexPath animated: NO];
  }
  if ([self.delegate respondsToSelector: @selector(tableView:didSelect:cellAtIndexPath:inViewController:)])
  {
    [self.delegate tableView: tableView
                   didSelect:  !wasSelected
             cellAtIndexPath: indexPath
            inViewController: self];
  }
}

//-----------------------------------------------------------------------------------------------------------
#pragma mark - Public interface methods
//-----------------------------------------------------------------------------------------------------------

- (void) deselectItemsWithAnimation: (BOOL) animation;
{
  NSIndexPath *currentSelection = [self.tableView indexPathForSelectedRow];
  [self.tableView deselectRowAtIndexPath: currentSelection animated: animation];
}



//-----------------------------------------------------------------------------------------------------------
#pragma mark - IBAction methods
//-----------------------------------------------------------------------------------------------------------

- (IBAction)cellButtonTapped:(UIButton *)sender
{
  if ([self.delegate respondsToSelector: @selector(tableView:didSelect:cellAtIndexPath:inViewController:)])
  {
    NSIndexPath *buttonIndexPath = [self.tableView indexPathForCellContainingView: sender];
    [self.delegate tableView: self.tableView
               clickedButton: sender
                 atIndexPath: buttonIndexPath
            inViewController: self];
  }

}

@end
