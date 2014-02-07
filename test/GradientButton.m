//
//  GradientButton.m
//  test
//
//  Created by Duncan Champney on 8/3/13.
//  Copyright (c) 2013 Duncan Champney. All rights reserved.
//

#import "GradientButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation GradientButton


//Tell the system to use a gradient layer as this button's backing layer
+ (Class) layerClass {
  return [CAGradientLayer class];
}


- (void) doInitSetup;
{
  CAGradientLayer *gradient = (CAGradientLayer *)[self layer];
  
  //Set up the button to have the normal outline and shape
  gradient.borderWidth = 1;
  gradient.borderColor = [UIColor lightGrayColor].CGColor;
  gradient.cornerRadius = 8;
  gradient.masksToBounds = YES;
  
  //Set the colors and color locations for the gradient.
  [self setNormalColors];
  gradient.locations = @[@0, @.1, @.3, @.8, @1];

}

- (void) setNormalColors;
{
  //Set the colors for the unhighlighted state
  ((CAGradientLayer *)self.layer).colors =
  @[
//   (id)[UIColor darkGrayColor].CGColor,
//   (id)[UIColor darkGrayColor].CGColor,
   (id)[UIColor colorWithRed: .50 green: .50 blue: .50 alpha: 1.0].CGColor,
   (id)[UIColor colorWithRed: .60 green: .60 blue: .60 alpha: 1.0].CGColor,
   (id)[UIColor colorWithRed: .4 green: .4 blue: .4 alpha: 1.0].CGColor,
   (id)[UIColor colorWithRed: .4 green: .4 blue: .4 alpha: 1.0].CGColor,
   (id)[UIColor colorWithRed: .2 green: .2 blue: .2 alpha: 1.0].CGColor
   ];
}

- (void) setHighlightColors;
{
  //Set the gradient colors for the highlighted state
  ((CAGradientLayer *)self.layer).colors =
  @[
    (id)[UIColor colorWithRed: 0.2 green: 0.2 blue: .6 alpha: 1.0].CGColor,
    (id)[UIColor colorWithRed: 0.2 green: 0.2 blue: .6 alpha: 1.0].CGColor,
    (id)[UIColor colorWithRed: 0.4 green: 0.4  blue: .8 alpha: 1.0].CGColor,
    (id)[UIColor colorWithRed: 0.4 green: 0.4 blue: .8 alpha: 1.0].CGColor,
    (id)[UIColor colorWithRed: 0.6 green: 0.6 blue: .9 alpha: 1.0].CGColor
    ];
}

- (void)setHighlighted:(BOOL)highlighted
{
  [super setHighlighted:highlighted];
  if (highlighted)
    [self setHighlightColors];
  else
    [self setNormalColors];
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
  self = [super initWithCoder: aDecoder];
  if (!self)
    return nil;
  [self doInitSetup];
  return self;
}

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (!self)
    return nil;
  [self doInitSetup];
  return self;
}

@end
