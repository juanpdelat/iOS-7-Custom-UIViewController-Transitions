iOS-7-Custom-UIViewController-Transitions
=========================================

Sample project implementing new custom <code>UIViewController</code> Transitions on iOS 7. (For personal reference)

1. The parent VC should adopt the protocols <code>UIViewControllerTransitioningDelegate</code> and <code>UIViewControllerAnimatedTransitioning</code>
2. The transition delegate of the new VC should be set with <code>setTransitioningDelegate:</code> before <code>presentViewController:animated:completion</code>
3. The parent VC should implement the methods:
    - <code>animationControllerForPresentedController:presentingController:sourceController:</code> (should return self, which is the new <code>UIViewControllerTransitioningDelegate</code>)
    - <code>animationControllerForDismissedController:</code> (can return nil)
    - <code>interactionControllerForPresentation:</code> (can return nil)
    - <code>interactionControllerForDismissal:</code> (can return nil)
    - <code>transitionDuration:</code> (can return any number but I'm sure this duration should be properly used on the next steps)
    - <code>animateTransition:</code> (All the necessary animations should be performed here)
4. Get a temporary view with <code>containerView</code> from the <code>UIViewControllerContextTransitioning</code>
5. Get the new VC with <code>viewControllerForKey:</code> using the key <code>UITransitionContextToViewControllerKey</code> and add it to the temporary view
6. At the end call <code>completeTransition:</code> set to YES or else the transition won't be executed.
