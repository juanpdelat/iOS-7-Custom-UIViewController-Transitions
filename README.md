iOS-7-Custom-UIViewController-Transitions
=========================================

Sample project implementing new custom UIViewController Transitions on iOS 7. (For personal reference)

1. The parent VC should adopt the protocols <code>UIViewControllerTransitioningDelegate</code> and <code>UIViewControllerAnimatedTransitioning</code>
2. The transition delegate of the new VC should be set with setTransitioningDelegate: before presentViewController:animated:completion
3. The parent VC should implement the methods:
    animationControllerForPresentedController:presentingController:sourceController: (should return self, which is the new UIViewControllerTransitioningDelegate)
    animationControllerForDismissedController: (can return nil)
    interactionControllerForPresentation: (can return nil)
    interactionControllerForDismissal: (can return nil)
    transitionDuration: (can return any number but I'm sure this duration should be properly used on the next steps)
    animateTransition: (All the necessary animations should be performed here)
4. Get a temporary view with containerView from the UIViewControllerContextTransitioning 
5. Get the new VC with viewControllerForKey:UITransitionContextToViewControllerKey and add it to the temporary view
6. At the end call completeTransition:YES or else the transition won't be executed.
