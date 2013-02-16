//
//  ViewController.m
//  test
//
//  Created by Duncan Champney on 2/15/13.
//  Copyright (c) 2013 WareTo. All rights reserved.
//

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
  self.messageLabel.text = NSLocalizedString(K_USELESS_BUTTON_STRING,
                                             @"Message that the button the user clicked doesn't do anything useful.");
  sender.alpha =.5;
  
  //Deselect the items in the 2 table views, if any were selected.
  [self.firstTableViewController deselectItemsWithAnimation: YES];
  [self.secondTableViewController deselectItemsWithAnimation: YES];
  
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
     //animation to fade it away again 1 second later.
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
  NSString *clickedTableVCName = @"";
  if (viewController == self.firstTableViewController)
    clickedTableVCName = K_FIRST_STRING;
  else if (viewController == self.secondTableViewController)
    clickedTableVCName = @" second";
  
  NSString *displayString = [NSString stringWithFormat: @"You clicked cell %d in the%@ tableview", indexPath.row+1, clickedTableVCName
                             ];
  self.messageLabel.text = displayString;
  self.messageLabel.alpha = 1.0;
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
           withTag: (NSInteger) tag
  inViewController: (UITableViewController <StaticTableViewControllerProtocol>*) viewController;
{
  //NSLog(@"Entering %s. Tag = %d", __PRETTY_FUNCTION__, tag);
  NSString *clickedTableVCName = @"";
  if (viewController == self.firstTableViewController)
    clickedTableVCName = NSLocalizedString(K_FIRST_STRING, @"The word ' first' with a preceding space");
                                    
  else if (viewController == self.secondTableViewController)
    clickedTableVCName = NSLocalizedString(K_SECOND_STRING, @"The word ' second' with a preceding space");
  
  NSString *youClickedFormatString = NSLocalizedString(K_YOU_CLICKED_STRING, @"String to tell user which button they clicked");
  NSString *displayString = [NSString stringWithFormat: youClickedFormatString, tag, clickedTableVCName
                             ];
  self.messageLabel.text = displayString;
  self.messageLabel.alpha = 1.0;
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
