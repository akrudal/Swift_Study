//
//  BestCell.swift
//  baemin
//
//  Created by 마경미 on 2022/03/20.
//

import UIKit

struct BestInfo{
    var image:UIImage
    var storeName:String
    var fee:String
    var time:String
}

class BestCell: UICollectionViewCell {
    static let bestCellId = "bestCell"
    
    @IBOutlet var storeImg: UIImageView!
    
    @IBOutlet var storeNameL: UILabel!
    
    @IBOutlet var feeL: UILabel!
    
    @IBOutlet var timeL: UILabel!

    override init(frame:CGRect){
        super.init(frame:frame)
        
    }
    
    required init?(coder aDecoder : NSCoder) {
        super.init(coder : aDecoder)
    }
}



