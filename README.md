test
====

A demo of using multiple static table views in iOS 6.

This project shows how to set up mutiple `UITableViewController`s on a single screen. It uses a parent view controller with container views and a pair of `UITableViewController`s as child view controllers. The parent view controller has "container" views in it, that link to the `UITableViewController`s using embed segues.

The screen looks like this:


->![app screenshot](Static tableviews screenshot.png)<-

The project defines a protocol that the parent view controller uses to communicate with the child `UITableViewController`s, and a second protocol that the children use to notify the parent when the user makes a selection or clicks a button.



The StaticTableParentProtocol defines 2 methods, which are both optional:

```objective-c
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
```


And the StaticTableViewControllerProtocol defines a delegate property and 1 method, which is also optional:

```objective-c
@protocol StaticTableViewControllerProtocol <NSObject>

  @property (nonatomic, weak) UIViewController <StaticTableParentProtocol> *delegate;

  @optional

  - (void) deselectItemsWithAnimation: (BOOL) animation;

@end
```
