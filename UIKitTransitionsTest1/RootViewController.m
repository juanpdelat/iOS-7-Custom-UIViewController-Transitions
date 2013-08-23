//
//  RootViewController.m
//  UIKitTransitionsTest1
//
//  Created by Juan de la Torre on 2013-08-22.
//  Copyright (c) 2013 Brisk Mobile Inc. All rights reserved.
//

#import "RootViewController.h"
#import "SecondViewController.h"


@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (IBAction)buttonTapped:(UIButton *)sender {
  
  SecondViewController *secondVC = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
  [secondVC setTransitioningDelegate:self];
  [self presentViewController:secondVC animated:YES completion:nil];
  

}


//===================================================================
#pragma mark - UIViewControllerTransitioningDelegate
//===================================================================

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
  return self;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
  return nil;
}

- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator {
  return nil;
}

- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
  return nil;
}


//===================================================================
#pragma mark - UIViewControllerAnimatedTransitioning
//===================================================================

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
  return 40;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
  
  // This is like a temporary view where the animations during the transition will be performed
  UIView *inView = [transitionContext containerView];
  
  // From and To VCs
  RootViewController *fromVC = (RootViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey]; // Should be quals to self
  SecondViewController *toVC = (SecondViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  
  // Add the To VC.view to the temporary view
  [inView addSubview:toVC.view];
  
  // Perform any configurations needed before the transition starts
  toVC.secondVCButton.center = CGPointMake(0, 200);
  toVC.view.center = CGPointMake(500, 500);

  [UIView animateWithDuration:1
                   animations:^{
                     
                     // Perform the configurations needed for the transition
                     fromVC.button.center = CGPointMake(-20, -20);
                     toVC.secondVCButton.center = CGPointMake(5000, 5000);
                     CGRect screenRect = [[UIScreen mainScreen] bounds];
                     toVC.view.center = CGPointMake(screenRect.size.width/2, screenRect.size.height/2);

                   }
                   completion:^(BOOL finished) {
                     
                     // Perform any configurations needed when the transition is finished
                     toVC.view.backgroundColor = [UIColor whiteColor];
                     
                     // completeTransition must be called or else the transition won't be executed
                     [transitionContext completeTransition:YES];
                   }];
}

@end
