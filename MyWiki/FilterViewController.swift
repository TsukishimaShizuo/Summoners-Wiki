//
//  FilterViewController.swift
//  MyWiki
//
//  Created by 月島静雄 on 2016/05/23.
//  Copyright © 2016年 月島静雄. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController,UIViewControllerTransitioningDelegate, FirstResponderDelegate {
    
    var selectedHosi: Int = 0
    var selectedProperty: EireiProperty = EireiProperty.Unknown
    var filterDelegate: FilterDelegate?
    var starSegment : UISegmentedControl!
    var propertySegment : UISegmentedControl!
    var okButton : UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.transitioningDelegate = self
        self.modalPresentationStyle = .Custom
    }
    
    required override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.transitioningDelegate = self
        self.modalPresentationStyle = .Custom
    }
    
    func resumeFirstResponder() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    init(hosi: Int, prop: EireiProperty) {
        super.init(nibName: nil, bundle: nil)
        self.transitioningDelegate = self
        self.modalPresentationStyle = .Custom
        
        self.selectedHosi = hosi
        self.selectedProperty = prop
        
        starSegment = UISegmentedControl(frame: CGRectZero)
        starSegment.translatesAutoresizingMaskIntoConstraints = false
        starSegment.insertSegmentWithTitle("全て", atIndex: 0, animated: false)
        starSegment.insertSegmentWithTitle("★1", atIndex: 1, animated: false)
        starSegment.insertSegmentWithTitle("★2", atIndex: 2, animated: false)
        starSegment.insertSegmentWithTitle("★3", atIndex: 3, animated: false)
        starSegment.insertSegmentWithTitle("★4", atIndex: 4, animated: false)
        starSegment.insertSegmentWithTitle("★5", atIndex: 5, animated: false)
        starSegment.insertSegmentWithTitle("★6", atIndex: 6, animated: false)
        starSegment.addTarget(self, action: #selector(setHosi), forControlEvents: UIControlEvents.ValueChanged)
        starSegment.selectedSegmentIndex = selectedHosi
        
        propertySegment = UISegmentedControl(frame: CGRectZero)
        propertySegment.translatesAutoresizingMaskIntoConstraints = false
        propertySegment.insertSegmentWithTitle("全て", atIndex: 0, animated: false)
        propertySegment.insertSegmentWithTitle("火", atIndex: 1, animated: false)
        propertySegment.insertSegmentWithTitle("水", atIndex: 2, animated: false)
        propertySegment.insertSegmentWithTitle("風", atIndex: 3, animated: false)
        propertySegment.insertSegmentWithTitle("光", atIndex: 4, animated: false)
        propertySegment.insertSegmentWithTitle("闇", atIndex: 5, animated: false)
        propertySegment.addTarget(self, action: #selector(setProperty), forControlEvents: UIControlEvents.ValueChanged)
        propertySegment.selectedSegmentIndex = selectedProperty.hashValue
        
        okButton = UIButton(frame: CGRectZero)
        okButton.translatesAutoresizingMaskIntoConstraints = false
        okButton.setTitle("OK", forState: UIControlState.Normal)
        okButton.setTitleColor(starSegment.tintColor, forState: UIControlState.Normal)
        okButton.tintColor = starSegment.tintColor
        okButton.layer.masksToBounds = true
        okButton.layer.cornerRadius = 10.0
        okButton.layer.borderWidth = 1.0
        okButton.layer.borderColor = starSegment.tintColor.CGColor
        
        okButton.addTarget(self, action: #selector(dissMissMe), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(starSegment)
        self.view.addConstraint(NSLayoutConstraint(item: starSegment, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Top, multiplier: 0.5, constant: 10.0))
        self.view.addConstraint(NSLayoutConstraint(item: starSegment, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 10.0))
        self.view.addConstraint(NSLayoutConstraint(item: starSegment, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -10.0))
        
        self.view.addSubview(propertySegment)
        self.view.addConstraint(NSLayoutConstraint(item: propertySegment, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: starSegment, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 10.0))
        self.view.addConstraint(NSLayoutConstraint(item: propertySegment, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 10.0))
        self.view.addConstraint(NSLayoutConstraint(item: propertySegment, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -10.0))
        
        self.view.addSubview(okButton)
        self.view.addConstraint(NSLayoutConstraint(item: okButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: propertySegment, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 10.0))
        self.view.addConstraint(NSLayoutConstraint(item: okButton, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -10.0))
        self.view.addConstraint(NSLayoutConstraint(item: okButton, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 10.0))
        self.view.addConstraint(NSLayoutConstraint(item: okButton, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -10.0))
    }
    
    func setHosi(sender : UISegmentedControl) {
        selectedHosi = sender.selectedSegmentIndex
    }
    
    func setProperty(sender : UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case EireiProperty.Fire.hashValue:
            selectedProperty = EireiProperty.Fire
        case EireiProperty.Water.hashValue:
            selectedProperty = EireiProperty.Water
        case EireiProperty.Wind.hashValue:
            selectedProperty = EireiProperty.Wind
        case EireiProperty.Light.hashValue:
            selectedProperty = EireiProperty.Light
        case EireiProperty.Dark.hashValue:
            selectedProperty = EireiProperty.Dark
        default:
            selectedProperty = EireiProperty.Unknown
        }
    }
    
    func dissMissMe(sender : UISegmentedControl) {
        filterDelegate?.selectedHosi(selectedHosi, property: selectedProperty)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        
        if presented == self {
            let tempController = FilterPresentationController(presentedViewController: presented, presentingViewController: presenting)
            tempController.firstResponderDelegate = self
            return tempController
        }
        
        return nil
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if presented == self {
            return FilterPresentationAnimationController(isPresenting: true)
        }
        else {
            return nil
        }
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if dismissed == self {
            return FilterPresentationAnimationController(isPresenting: false)
        }
        else {
            return nil
        }
    }
    
}
