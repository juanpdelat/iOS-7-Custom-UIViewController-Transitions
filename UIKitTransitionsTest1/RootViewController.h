//
//  RootViewController.h
//  UIKitTransitionsTest1
//
//  Created by Juan de la Torre on 2013-08-22.
//  Copyright (c) 2013 Brisk Mobile Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SecondViewController;

@interface RootViewController : UIViewController <UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>

@property (strong, nonatomic) IBOutlet UIButton *button;

@end
