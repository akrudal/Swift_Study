//
//  BannerCell.swift
//  delivery5
//
//  Created by 마경미 on 2022/03/03.
//

import UIKit

struct CustomData {
    var title:String
    var image:UIImage
}

class BannerCell: UICollectionViewCell {
    var data:CustomData?{
        didSet{
            guard let data = data else { return }
            bg.image=data.image
        }
    }
    
    fileprivate let bg:UIImageView = {
        let iv=UIImageView()
        iv.image = #imageLiteral(resourceName: "banner3")
        iv.translatesAutoresizingMaskIntoConstraints=false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        //image에 borderradius 주고싶으면
        //iv.layer.cornerRadius=12
        return iv
    }()
    
    override init(frame:CGRect){
        super.init(frame:frame)
        
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive=true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive=true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive=true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive=true
    }
    
    required init?(coder aDecoder : NSCoder) {
        super.init(coder : aDecoder)
    }
}
