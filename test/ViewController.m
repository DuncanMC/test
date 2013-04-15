//
//  ViewController.m
//  test
//
//  Created by Duncan Champney on 2/15/13.
//  Copyright (c) 2013 WareTo. All rights reserved.
// test change

#import "ViewController.h"
#import "StringConstants.h"

//-----------------------------------------------------------------------------------------------------------
#pragma mark - Put "private" methods here.
//-----------------------------------------------------------------------------------------------------------
@interface ViewController ()

@end

@implementation ViewController

//-----------------------------------------------------------------------------------------------------------
#pragma mark - View controller life cycle methods
//-----------------------------------------------------------------------------------------------------------

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  //Hide the "This button doesn't do anything useful" message to start.
  self.messageLabel.alpha = 0.0;
  
	// Do any additional setup after loading the view, typically from a nib.
}

//-----------------------------------------------------------------------------------------------------------

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  //NSLog(@"Entering %s for segue %@", __PRETTY_FUNCTION__, segue.identifier);
  
  //For the 2 "embed" segues, save pointers to the view controllers
  
  if ([segue.identifier isEqualToString: @"firstTable"])
  {
    self.firstTableViewController = segue.destinationViewController;
    self.firstTableViewController.delegate =self;
  }
  
  else if ([segue.identifier isEqualToString: @"secondTable"])
  {
    self.secondTableViewController = segue.destinationViewController;
    self.secondTableViewController.delegate =self;
 }
}

//-----------------------------------------------------------------------------------------------------------

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-----------------------------------------------------------------------------------------------------------
#pragma mark - IBAction methods
//-----------------------------------------------------------------------------------------------------------

- (IBAction)buttonAction: (UIButton *) sender;
{
  //Disable and dim the button until the animation is complete.
  sender.enabled = FALSE;
  sender.alpha =.5;
  
  //set the message label text to a localized form of "This button doesn't do anything useful"
  self.messageLabel.text = NSLocalizedString(@"This button doesn't do anything useful",
                                             @"Message that the button the user clicked doesn't do anything useful.");
  
  //Deselect the items in the 2 table views, if any were selected.
  [self.firstTableViewController deselectItemsWithAnimation: NO];
  [self.secondTableViewController deselectItemsWithAnimation: NO];
  
  //Animate in the "this button doesn't do anything useful" message
  //onto the screen.
  [UIView animateWithDuration: .2  //The first part of the animation will run over .2 seconds
                   animations:
   ^{
     //Animate the label to full opacity
     self.messageLabel.alpha  = 1.0;
   }
                   completion:
   ^(BOOL finished){
     //When the animation is finsished, queue up a second
     //animation to fade the message away again .75 seconds later.
     [UIView animateWithDuration: .2
                           delay: .75
                         options: 0
                      animations:
      ^{
        self.messageLabel.alpha  = 0;
      }
                      completion:
      ^(BOOL finished)
      {
        //Once both steps of the animation are complete, reenable and un-dim the button
        sender.enabled = TRUE;
        sender.alpha =1.0;
      }
      ];
   }
   ];
}


//-----------------------------------------------------------------------------------------------------------
#pragma mark - StaticTableParentProtocol methods
//-----------------------------------------------------------------------------------------------------------

- (void) tableView: (UITableView *) tableView
         didSelect: (BOOL) select
   cellAtIndexPath: (NSIndexPath *)indexPath
 inViewController : (UIViewController <StaticTableViewControllerProtocol> *) viewController;
{
  //Build a localized word for " first" or " second" based on which table view the user clicked in.
  NSString *clickedTableVCName = @"";
  if (viewController == self.firstTableViewController)
    clickedTableVCName = NSLocalizedString(@" first", @"The word ' first' with a preceding space");
  else if (viewController == self.secondTableViewController)
    clickedTableVCName = NSLocalizedString(@" second", @"The word ' second' with a preceding space");

  //Create a localized word "selected" or "deselected" in selectedStateString
  NSString *selectedString = NSLocalizedString(@"selected", nil);
  NSString *deselectedString = NSLocalizedString(@"deselected", nil);
  NSString *selectedStateString = select ? selectedString : deselectedString;
  
  //Get a localized copy of the format string for the full sentence.
  NSString *clickedFormatString = NSLocalizedString(@"You %@ cell %d in the%@ tableview", nil);
  
  //Build the fully localized string for display.
  NSString *displayString = [NSString stringWithFormat: clickedFormatString, selectedStateString, indexPath.row+1, clickedTableVCName
                             ];
  
  //Show the message
  self.messageLabel.text = displayString;
  self.messageLabel.alpha = 1.0;   //Make the message label visible.
  
  //Create an animation that begins after 1 second and fades away the message
  [UIView animateWithDuration: .2
                        delay: 1.0
                      options: 0
                   animations:
   ^{
     self.messageLabel.alpha = 0;
   }
                   completion:nil
   ];
}

//-----------------------------------------------------------------------------------------------------------

- (void) tableView: (UITableView *) tableView
     clickedButton: (UIButton *) button
       atIndexPath: (NSIndexPath *) buttonIndexPath
  inViewController: (UITableViewController <StaticTableViewControllerProtocol>*) viewController;
{
  NSInteger oneBasedCellNumber = -1;
  if (buttonIndexPath)
    oneBasedCellNumber = buttonIndexPath.row + 1;
  
  NSString *clickedTableVCName = @"";
  if (viewController == self.firstTableViewController)
    clickedTableVCName = NSLocalizedString(@" first", @"The word ' first' with a preceding space");
                                    
  else if (viewController == self.secondTableViewController)
    clickedTableVCName = NSLocalizedString(@" second", @"The word ' second' with a preceding space");
  
  NSString *youClickedFormatString = NSLocalizedString(  @"You clicked button %d in the%@ tableview", @"String to tell user which button they clicked");
  NSString *displayString = [NSString stringWithFormat: youClickedFormatString, oneBasedCellNumber, clickedTableVCName
                             ];
  
  //Show the message
  self.messageLabel.text = displayString;
  self.messageLabel.alpha = 1.0;  //Make the message label visible.
  
  //Create an animation that begins after 1 second and fades away the message
  [UIView animateWithDuration: .2
                        delay: 1.0
                      options: 0
                   animations:
   ^{
     self.messageLabel.alpha = 0;
   }
                   completion:nil
   ];

}

@end
