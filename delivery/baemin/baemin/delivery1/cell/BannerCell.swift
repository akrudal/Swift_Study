//
//  BannerCell.swift
//  baemin
//
//  Created by 마경미 on 2022/03/20.
//

import UIKit

struct CustomData {
    var title:String
    var image:UIImage
}

class BannerCell: UICollectionViewCell {
    static let bannerCellId = "bannerCell"
    @IBOutlet var bg: UIImageView!
    var data:CustomData?{
        didSet{
            guard let data = data else { return }
            bg.image=data.image
        }
    }
    
    override init(frame:CGRect){
        super.init(frame:frame)
    }
    
    required init?(coder aDecoder : NSCoder) {
        super.init(coder : aDecoder)
    }
}
