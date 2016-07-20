//
//  FilterPresentationController.swift
//  MyWiki
//
//  Created by 月島静雄 on 2016/05/23.
//  Copyright © 2016年 月島静雄. All rights reserved.
//

import UIKit

class FilterPresentationController: UIPresentationController {
    
    var firstResponderDelegate: FirstResponderDelegate?
    
    lazy var dimmingView : UIView = {
        let view = UIView(frame: self.containerView!.bounds)
        view.backgroundColor = UIColor.clearColor()
        let be = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let ve = UIVisualEffectView(effect: be)
        ve.frame = self.containerView!.bounds
        view.addSubview(ve)
        
        return view
    }()
    
    func dismissMe() {
        firstResponderDelegate?.resumeFirstResponder()
    }

    override func frameOfPresentedViewInContainerView() -> CGRect {
        
        guard
            let containerView = containerView
            else {
                return CGRect()
        }
        dimmingView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissMe)))
        
        var frame = containerView.bounds;
        frame = CGRectInset(frame, 50.0, 50.0)
        
        return CGRect(x: 0, y: containerView.bounds.height / 4 * 3, width: containerView.bounds.width, height: containerView.bounds.height / 4)
        
    }
    
    override func presentationTransitionWillBegin() {
        
        guard
            let containerView = containerView,
            let presentedView = presentedView()
            else {
                return
        }
        
        // Add the dimming view and the presented view to the heirarchy
        dimmingView.frame = containerView.bounds
        containerView.addSubview(dimmingView)
        containerView.addSubview(presentedView)
        
        // Fade in the dimming view alongside the transition
        if let transitionCoordinator = self.presentingViewController.transitionCoordinator() {
            transitionCoordinator.animateAlongsideTransition({(context: UIViewControllerTransitionCoordinatorContext!) -> Void in
                self.dimmingView.alpha = 1.0
                }, completion:nil)
        }
    }
    
    override func presentationTransitionDidEnd(completed: Bool) {
        
    }
    
    override func dismissalTransitionWillBegin() {
        if let transitionCoordinator = self.presentingViewController.transitionCoordinator() {
            transitionCoordinator.animateAlongsideTransition({(context: UIViewControllerTransitionCoordinatorContext!) in
                self.dimmingView.alpha = 0.0}, completion: nil)
        }
    }
    
    override func dismissalTransitionDidEnd(completed: Bool) {
        if completed {
            self.dimmingView.removeFromSuperview()
        }
    }
    
}
