//
//  MenuCell.swift
//  baemin
//
//  Created by 마경미 on 2022/03/20.
//

import UIKit

struct ImageInfo{
    var name:String
    var image:UIImage
}

class MenuCell: UICollectionViewCell {
    static let menuCellId = "menuCell"
    
    @IBOutlet var menuIV: UIImageView!
    
    @IBOutlet var nameL: UILabel!
    
    override init(frame:CGRect){
        super.init(frame:frame)
    }
    
    required init?(coder aDecoder : NSCoder) {
        super.init(coder : aDecoder)
    }
}

