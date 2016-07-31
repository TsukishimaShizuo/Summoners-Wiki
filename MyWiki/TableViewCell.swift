//
//  TableViewCell.swift
//  MyWiki
//
//  Created by 月島静雄 on 2016/07/31.
//  Copyright © 2016年 月島静雄. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var eireiID: Int!
    var aLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        aLabel = UILabel(frame: CGRect(x: 0, y: 0, width: contentView.bounds.width, height: contentView.bounds.height))
        contentView.addSubview(aLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
