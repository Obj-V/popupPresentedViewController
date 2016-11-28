//
//  popupViewAnimationController.swift
//  popupPresentedViewController
//
//  Created by Virata Yindeeyoungyeon on 11/27/16.
//  Copyright © 2016 ObjV. All rights reserved.
//

import UIKit

class popupViewAnimationController: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        
        //vars
        var animatedView:UIView!
        let scale:CGFloat = 10
        var positionTransform: CGAffineTransform!
        let scaleTransform = CGAffineTransform(scaleX: 1.0/scale, y: 1.0/scale)
        var initialTransform:CGAffineTransform!
        var finalTransform:CGAffineTransform!
        
        //presenting popup
        if let popupVC = toViewController as? popupViewController {
            
            //Add to container
            let toView = (toViewController?.view)!
            containerView.addSubview(toView)
            
            //animatedView
            animatedView = toView
            animatedView.frame = transitionContext.finalFrame(for: toViewController!)
            
            //translation
            let translatedPoint:CGPoint = popupVC.translatedPointFromCenterToInitialPoint()
            positionTransform = CGAffineTransform(translationX: translatedPoint.x * scale, y: translatedPoint.y * scale)
            initialTransform = positionTransform.concatenating(scaleTransform)
            finalTransform = CGAffineTransform.identity
        
        //dismissing
        } else if let popupVC = fromViewController as? popupViewController {
            //animatedView
            animatedView = (fromViewController?.view)!
            
            //position translation
            let translatedPoint:CGPoint = popupVC.translatedPointFromCenterToInitialPoint()
            positionTransform = CGAffineTransform(translationX: translatedPoint.x * scale, y: translatedPoint.y * scale)
            initialTransform = CGAffineTransform.identity
            finalTransform = positionTransform.concatenating(scaleTransform)
        }
        
        
        animatedView.transform = initialTransform
        UIView.animate(withDuration: 0.4, animations: {
            animatedView.transform = finalTransform
            }) { (_) in
                transitionContext.completeTransition(true)
        }
    }
}
