//
//  popupViewPresentationController.swift
//  popupPresentedViewController
//
//  Created by Virata Yindeeyoungyeon on 11/27/16.
//  Copyright © 2016 ObjV. All rights reserved.
//

import UIKit

class popupViewPresentationController: UIPresentationController {
    
    override var frameOfPresentedViewInContainerView: CGRect  {
        let viewSize = size(forChildContentContainer: presentedViewController, withParentContainerSize: containerView!.bounds.size)
        var frame = CGRect(x: 0, y: 0, width: viewSize.width, height: viewSize.height)
        let popupVC = presentedViewController as? popupViewController
        frame = frame.insetBy(dx: (popupVC?.popupInset)!, dy: (popupVC?.popupInset)!)
        return frame
    }
    
    override func presentationTransitionWillBegin() {
        let container = self.containerView!
        let shadowView = UIView(frame: container.frame)
        shadowView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        shadowView.alpha = 0
        container.insertSubview(shadowView, at: 0)
        
        let transitionCoordinator = self.presentedViewController.transitionCoordinator
        transitionCoordinator?.animate(alongsideTransition: { (_) in
            shadowView.alpha = 1
            }, completion: nil)
    }
    
    override func dismissalTransitionWillBegin() {
        let container = self.containerView!
        let shadowView = container.subviews[0]
        let transitionCoordinator = self.presentedViewController.transitionCoordinator
        transitionCoordinator?.animate(alongsideTransition: { (_) in
            shadowView.alpha = 0
            }, completion: nil)
        
    }
}
