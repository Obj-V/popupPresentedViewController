//
//  popupViewController.swift
//  popupPresentedViewController
//
//  Created by Virata Yindeeyoungyeon on 11/27/16.
//  Copyright © 2016 ObjV. All rights reserved.
//

import UIKit

class popupViewController: UIViewController {
    
    var popupInset : CGFloat!
    var initialPopupPoint : CGPoint!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.layer.borderColor = UIColor.blue.cgColor
        self.view.layer.cornerRadius = 10
        self.view.layer.borderWidth = 2
        
        self.popupInset = self.view.bounds.width/10
    }
    
    @IBAction func doneButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    public convenience init(initialPopupPoint:CGPoint) {
        self.init()
        self.initialPopupPoint = initialPopupPoint
        self.modalPresentationStyle = .custom
        self.transitioningDelegate = self
    }
    
    public func translatedPointFromCenterToInitialPoint() -> CGPoint {
        let x = self.initialPopupPoint.x - self.view.bounds.size.width/2 - self.popupInset/2
        let y = self.initialPopupPoint.y  - self.view.bounds.size.height/2 - self.popupInset/2
        return CGPoint(x: x, y: y)
    }
}

extension popupViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return popupViewAnimationController()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return popupViewAnimationController()
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return popupViewPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
