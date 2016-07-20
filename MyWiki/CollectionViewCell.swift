//
//  CollectionViewCell.swift
//  MyWiki
//
//  Created by 月島静雄 on 2016/05/12.
//  Copyright © 2016年 月島静雄. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var eireiID: Int!
    var aImage : UIImage!
    var aImageView : UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor.whiteColor()
        
        aImage  = UIImage()
        aImageView = UIImageView(image: aImage)
        aImageView.contentMode = UIViewContentMode.ScaleAspectFit
        aImageView.frame = CGRectMake(0, 0, self.frame.width, self.frame.height)
        self.contentView.addSubview(aImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
