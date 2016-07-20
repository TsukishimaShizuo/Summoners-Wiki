//
//  ViewController.swift
//  MyWiki
//
//  Created by 月島静雄 on 2016/05/12.
//  Copyright © 2016年 月島静雄. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UIAlertViewDelegate, FilterDelegate {
    
    var col : CollectionViewController! = nil
    var fv : FilterViewController! = nil

    var selectedHosi : Int = 0
    var selectedProperty : EireiProperty = EireiProperty.Unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        col = CollectionViewController(collectionViewLayout: layout)
        self.addChildViewController(col)
        self.view.addSubview(col.collectionView!)
        col.collectionView?.backgroundColor = UIColor.whiteColor()
        navigationItem.title = "モンスター"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Search, target: self, action: #selector(loadFilter))
        navigationItem.rightBarButtonItem?.title = "Filter"
    }
    
    func selectedHosi(hosi: Int, property: EireiProperty) {
        
        if hosi != selectedHosi || property != selectedProperty {
            selectedHosi = hosi
            selectedProperty = property
            col.filterStar = hosi
            col.filterProperty = property
            col.collectionView?.reloadData()
            if MyDBFW.sharedInstance.fetchEireiIDs(col.filterStar, eireiProperty: col.filterProperty).count != 0 {
                col.collectionView?.scrollToItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 0), atScrollPosition: UICollectionViewScrollPosition.Top, animated: false)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadFilter() {
        
        fv = FilterViewController(hosi: selectedHosi, prop: selectedProperty)
        fv.filterDelegate = self
        self.presentViewController(fv, animated: true, completion: nil
            )
    }
}

extension ViewController {}