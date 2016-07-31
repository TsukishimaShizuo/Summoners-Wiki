//
//  CollectionViewController.swift
//  MyWiki
//
//  Created by 月島静雄 on 2016/05/12.
//  Copyright © 2016年 月島静雄. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class CollectionViewController: UICollectionViewController {
    
    var filterStar : Int = 0
    var filterProperty : EireiProperty = EireiProperty.Unknown
    var sideLength = UIScreen.mainScreen().bounds.width / 5
    var eireiIDs : [Int] = [Int]()
    
    override func loadView() {
        super.loadView()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(sideLength, sideLength)
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        self.collectionView = UICollectionView(frame: UIScreen.mainScreen().bounds, collectionViewLayout: layout)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        eireiIDs = MyDBFW.sharedInstance.fetchEireiIDs(filterStar, eireiProperty: filterProperty)
        return MyDBFW.sharedInstance.getDataCount(filterStar, eireiProperty: filterProperty)
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell

        var aEireiID = eireiIDs[indexPath.item]
        if aEireiID >= 9001 {
            aEireiID = 795
        }
        
        let aImage  = UIImage(named: "monster_" + String(aEireiID) + ".png")
        cell.aImageView.image = aImage
        
        cell.eireiID = aEireiID
        return cell
    }
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        self.collectionView?.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        print("1")
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        print("2")
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
        print(indexPath)
    }
    */
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cvc = collectionView.cellForItemAtIndexPath(indexPath) as! CollectionViewCell
        let aData = MyDBFW.sharedInstance.fetchEireiDetailInfo(cvc.eireiID)
        let aDetail = DetailInfoViewController()
        aDetail.id = aData.id
        aDetail.name = aData.name
        aDetail.star = aData.star
        aDetail.stamina = aData.stamina
        aDetail.attack = aData.attack
        aDetail.defence = aData.defence
        aDetail.speed = aData.speed
        aDetail.property = aData.property
        aDetail.skill1 = aData.skill1
        aDetail.skill2 = aData.skill2
        aDetail.skill3 = aData.skill3
        aDetail.skill4 = aData.skill4
        aDetail.type = aData.type
        navigationController?.pushViewController(aDetail, animated: true)
    }
    
    func showDetailInfo(aButton : UIButton) {
    }
    
    func showDebugPage(aButton : UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let aDebug = sb.instantiateViewControllerWithIdentifier("debugScene")
        navigationController?.pushViewController(aDebug, animated: true)
    }

}
