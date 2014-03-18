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

//-----------------------------------------------------------------------------------------------------------
#pragma mark - Class methods
//-----------------------------------------------------------------------------------------------------------

//Tell the system to use a gradient layer as this button's backing layer
+ (Class) layerClass {
  return [CAGradientLayer class];
}

//-----------------------------------------------------------------------------------------------------------
#pragma mark - property methods
//-----------------------------------------------------------------------------------------------------------

- (void) setEnabled:(BOOL)enabled
{
  [super setEnabled: enabled];
  self.titleLabel.textColor = [UIColor colorWithRed: 200/255.0
                                              green: 200/255.0
                                               blue: 255/255.0 alpha: 1];
}

//-----------------------------------------------------------------------------------------------------------

- (void)setHighlighted:(BOOL)highlighted
{
  [super setHighlighted:highlighted];
  if (highlighted)
    [self useHighlightColors];
  else
    [self useNormalColors];
}

//-----------------------------------------------------------------------------------------------------------
#pragma mark - Object lifecycle methods
//-----------------------------------------------------------------------------------------------------------

- (void) doInitSetup;
{
  CAGradientLayer *gradient = (CAGradientLayer *)[self layer];
  
  //Set up the button to have the normal outline and shape
  gradient.borderWidth = 1;
  gradient.borderColor = [UIColor lightGrayColor].CGColor;
  gradient.cornerRadius = 8;
  gradient.masksToBounds = YES;
  
  //Set the colors and color locations for the gradient.
  [self useNormalColors];
  gradient.locations = @[@0, @.1, @.3, @.8, @1];
}

//-----------------------------------------------------------------------------------------------------------

- (id) initWithCoder:(NSCoder *)aDecoder
{
  self = [super initWithCoder: aDecoder];
  if (!self)
    return nil;
  [self doInitSetup];
  return self;
}

//-----------------------------------------------------------------------------------------------------------

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (!self)
    return nil;
  [self doInitSetup];
  return self;
}

//-----------------------------------------------------------------------------------------------------------
#pragma mark - custom instance methods
//-----------------------------------------------------------------------------------------------------------

- (void) changeTitleColor;
{
  self.titleLabel.textColor = [UIColor colorWithRed: 200/255.0
                                              green: 200/255.0
                                               blue: 255/255.0
                                              alpha: 1];
};

//-----------------------------------------------------------------------------------------------------------

- (void) useNormalColors;
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
  [self changeTitleColor];
}

//-----------------------------------------------------------------------------------------------------------

- (void) useHighlightColors;
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


@end
