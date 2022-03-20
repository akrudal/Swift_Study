//
//  StoreCell.swift
//  baemin
//
//  Created by 마경미 on 2022/03/20.
//

import UIKit

struct StoreInfo {
    var image1:UIImage
    var image2:UIImage
    var image3:UIImage
    var storeName:String
    var rate:String
    var orderFee:String
    var distance:String
    var fee:String
}

class StoreCell: UICollectionViewCell {
    static let storeCellId = "storeCell"
        
    @IBOutlet var storeImg1: UIImageView!

    @IBOutlet var storeImg2: UIImageView!
    
    @IBOutlet var storeImg3: UIImageView!

    @IBOutlet var storeNameL: UILabel!

    @IBOutlet var ratingL: UILabel!
    
    @IBOutlet var timeL: UILabel!
    
    @IBOutlet var orderFeeL: UILabel!

    @IBOutlet var distanceL: UILabel!

    @IBOutlet var deliveryFeeL: UILabel!
        
    override init(frame:CGRect){
        super.init(frame:frame)
        
        contentView.layer.cornerRadius = 20
    }
        
    required init?(coder aDecoder : NSCoder) {
        super.init(coder : aDecoder)
    }
}

