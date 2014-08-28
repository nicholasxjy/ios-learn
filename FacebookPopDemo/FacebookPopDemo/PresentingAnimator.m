//
//  PresentingAnimator.m
//  FacebookPopDemo
//
//  Created by nicholas on 14-8-26.
//  Copyright (c) 2014年 nicholas. All rights reserved.
//

#import "PresentingAnimator.h"
#import "pop/POP.h"
#import "Chameleon.h"

@implementation PresentingAnimator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    fromView.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
    fromView.userInteractionEnabled = NO;
    
//    UIView *dimmingView = [[UIView alloc] initWithFrame:fromView.bounds];
//    dimmingView.backgroundColor = [UIColor flatNavyBlueColor];
//    dimmingView.layer.opacity = 0.0;
    
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    toView.frame = CGRectMake(0,
                              0,
                              CGRectGetWidth(transitionContext.containerView.bounds) ,
                              CGRectGetHeight(transitionContext.containerView.bounds));
    toView.center = CGPointMake(transitionContext.containerView.center.x, -transitionContext.containerView.center.y);
    
//    [transitionContext.containerView addSubview:dimmingView];
    [transitionContext.containerView addSubview:toView];
    
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    positionAnimation.toValue = @(transitionContext.containerView.center.y);
    positionAnimation.springBounciness = 0;
    [positionAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.springBounciness = 4;
    scaleAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(1.2, 1)];
    
    POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacityAnimation.toValue = @(0.2);
    
    [toView.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
    [toView.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
//    [dimmingView.layer pop_addAnimation:opacityAnimation forKey:@"opacityAnimation"];
}

@end
