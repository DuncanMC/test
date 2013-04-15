//
//  StaticTableViewControllerProtocol.h
//  test
//
//  Created by Duncan Champney on 2/16/13.
//  Copyright (c) 2013 Duncan Champney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//Forward declaration of StaticTableParentProtocol,
//since the delegate in StaticTableViewControllerProtocol.h conforms to the StaticTableParentProtocol

@protocol StaticTableParentProtocol;

@protocol StaticTableViewControllerProtocol <NSObject>

@property (nonatomic, weak) UIViewController <StaticTableParentProtocol> *delegate;

@optional

- (void) deselectItemsWithAnimation: (BOOL) animation;

@end
